package com.etco.enums;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum Template {
    T01("確認メールを送信しました！", "メールの指示に従ってアカウントの登録を完了してください。", "/user/account/addAccount"), 
    T02("パスワード再設定メールを送信しました。", "メールの指示に従ってパスワードの再設定を行ってください。", "/user/account/settingPassword");

    private String name;
    private String description;
    private String imageUrl;

    private Template(String name, String description, String imageUrl) {
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    
}
