package com.etco.exception;

public class ObjectNotExistException extends Exception {

    private static final long serialVersionUID = 1L;
    
    private static final String message = "対象するオブジェクトがありません。";
    
    /**
     * コンストラクタ
     */
    public ObjectNotExistException() {
        super(message);
    }
    
    /**
     * コンストラクタ
     */
    public ObjectNotExistException(String message) {
        super(message);
    }

}
