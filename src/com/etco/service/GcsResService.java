package com.etco.service;

import java.io.IOException;
import java.nio.ByteBuffer;

import org.slim3.controller.upload.FileItem;
import org.slim3.datastore.Datastore;

import com.etco.dao.GcsResDao;
import com.etco.exception.ObjectNotExistException;
import com.etco.meta.GcsResMeta;
import com.etco.model.GcsRes;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.google.appengine.api.appidentity.AppIdentityServiceFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.images.Transform;
import com.google.appengine.tools.cloudstorage.GcsFileOptions;
import com.google.appengine.tools.cloudstorage.GcsFilename;
import com.google.appengine.tools.cloudstorage.GcsOutputChannel;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.google.appengine.tools.cloudstorage.RetryParams;


public class GcsResService {
    
    /** DAO */
    private static final GcsResDao dao = new GcsResDao();
    
    /** ファイル権限 */
    protected static final String GCS_ACL = "public-read";
    
    /**
     * ルートディレクトリパス
     */
    protected static final String ROOT_DIRECTORY_PATH = "SITE/";
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static GcsRes getByKey(String keyString) throws ObjectNotExistException {
        GcsRes res = dao.getOrNull(createKey(keyString));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static GcsRes get(SitePage sitePage, String resType) throws ObjectNotExistException { 
        GcsRes res = dao.getOrNull(createKey(sitePage, resType));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static GcsRes get(ListItem listItem, String resType) throws ObjectNotExistException { 
        GcsRes res = dao.getOrNull(createKey(listItem, resType));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * GCSの保存
     * @param user
     * @param model
     * @param fileItem
     * @param leftX
     * @param topY
     * @param rightX
     * @param bottomY
     * @throws IOException
     */
    private static void saveGcsFile(
            User user, 
            GcsRes model,  
            FileItem fileItem, 
            int leftX, 
            int topY, 
            int rightX,
            int bottomY) throws IOException { 
        
        // image objectの取得
        Image image = ImagesServiceFactory.makeImage(fileItem.getData());

        // 画像の切り取り
        imageCrop(image, (float)leftX / (float)image.getWidth(), (float)topY / (float)image.getHeight(), (float)rightX / (float)image.getWidth(), (float)bottomY / (float)image.getHeight());
        
        // ファイルの保存
        GcsFilename gcsFilename = saveImageToGCS(ROOT_DIRECTORY_PATH + user.getSiteId() + "/" + model.getKey().getName(), fileItem.getContentType(), image);
        
        // servingUrl
        String servingUrl = getServingUrl(gcsFilename);
        
        model.setServingUrl(servingUrl);
        model.setWidth(image.getWidth());
        model.setHeight(image.getHeight());
        model.setContentType(fileItem.getContentType());
        model.setSize(image.getImageData().length);
    }
    
    /**
     * PUT(SitePage)
     * @param user
     * @param sitePage
     * @param resId
     * @param fileItem
     * @param leftX
     * @param topY
     * @param rightX
     * @param bottomY
     * @return
     * @throws IOException
     */
    public static GcsRes put(
            User user, 
            SitePage sitePage, 
            String resId,
            FileItem fileItem,
            int leftX, 
            int topY, 
            int rightX,
            int bottomY) throws IOException {

        Key key = createKey(sitePage, resId);

        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        GcsRes model = new GcsRes();
        Transaction tx = Datastore.beginTransaction();
        try {
            model.setKey(key);
            model.setResId(resId);

            model.getUserRef().setModel(user);
            model.getSitePageRef().setModel(sitePage);
            
            // GCSファイルの保存
            saveGcsFile(user, model, fileItem, leftX, topY, rightX, bottomY);

            // 保存
            Datastore.put(tx, model);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }

        return model;
    }
    
    /**
     * PUT(ListItem)
     * @param user
     * @param sitePage
     * @param resId
     * @param fileItem
     * @param leftX
     * @param topY
     * @param rightX
     * @param bottomY
     * @return
     * @throws IOException
     */
    public static GcsRes put(
            User user, 
            ListItem listItem, 
            String resId,
            FileItem fileItem,
            int leftX, 
            int topY, 
            int rightX,
            int bottomY) throws IOException {

        Key key = createKey(listItem, resId);

        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        GcsRes model = new GcsRes();
        Transaction tx = Datastore.beginTransaction();
        try {
            model.setKey(key);
            model.setResId(resId);

            model.getUserRef().setModel(user);
            model.getListItemRef().setModel(listItem);
            
            // GCSファイルの保存
            saveGcsFile(user, model, fileItem, leftX, topY, rightX, bottomY);

            // 保存
            Datastore.put(tx, model);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }

        return model;
    }
    
    /**
     * 画像の一部を切り取る
     * @param image
     * @param leftX
     * @param topY
     * @param rightX
     * @param bottomY
     */
    protected static void imageCrop(Image image, float leftX, float topY, float rightX, float bottomY) {
        ImagesService imagesService = ImagesServiceFactory.getImagesService();

        Transform imageTransform = ImagesServiceFactory.makeCrop(
            leftX < 0 ? 0 : leftX, 
                topY < 0 ? 0 : topY, 
                    rightX > 1 ? 1.0 : rightX, 
                        bottomY > 1 ? 1.0 : bottomY);
        imagesService.applyTransform(imageTransform, image);
    }
    
    /**
     * ファイルをGCSに保存
     * @param filePath
     * @param fileItem
     * @throws IOException
     */
    protected static GcsFilename saveImageToGCS(String filePath, String mimeType, Image image) throws IOException {
        
        // GCS SERVICE
        GcsService gcsService =
                GcsServiceFactory.createGcsService(RetryParams.getDefaultInstance());
        
        GcsOutputChannel outputChannel = null;
        try {
            // Gcsファイル名
            GcsFilename gcsFilename = new GcsFilename(
                AppIdentityServiceFactory.getAppIdentityService().getDefaultGcsBucketName(), 
                filePath
             );
            
            // 新規もしくは上書き
            outputChannel = gcsService.createOrReplace(gcsFilename, 
                new GcsFileOptions.Builder()
                .mimeType(mimeType)
                .acl(GCS_ACL)
                .build()
                    );
            
            // 保存
            outputChannel.write(ByteBuffer.wrap(image.getImageData()));
            
            return gcsFilename;
            
        } catch (IOException e) {
            throw e;
            
        }finally {
            if(outputChannel != null) {
                outputChannel.close();
            }
        }
    }
    
    /**
     * ServingUrl の取得
     * @param gcsFilename
     * @return
     */
    protected static String getServingUrl(GcsFilename gcsFilename) {
        ImagesService is = ImagesServiceFactory.getImagesService();
        
        String servingUrl = is.getServingUrl(
            ServingUrlOptions.Builder.withGoogleStorageFileName(
                "/gs/" + gcsFilename.getBucketName() + "/" + gcsFilename.getObjectName()
                ).secureUrl(true));
        
        return servingUrl;
    }
    
    
    // ----------------------------------------------------------------------
    // キーの作成
    // ----------------------------------------------------------------------
    /**
     * キーの作成
     * @param keyString
     * @return
     */
    public static Key createKey(String keyString) {
        return Datastore.createKey(GcsResMeta.get(), keyString);
    }
    
    /**
     * ページリソースキー
     * @param sitePage
     * @param resType
     * @return
     */
    public static Key createKey(SitePage sitePage, String resId) {
        return createKey(sitePage.getKey().getName() + "_" + resId);
    }
    
    /**
     * listItemリソースキー
     * @param listItem
     * @param resType
     * @return
     */
    public static Key createKey(ListItem listItem, String resId) {
        return createKey(listItem.getKey().getName() + "_" + resId);
    }

}
