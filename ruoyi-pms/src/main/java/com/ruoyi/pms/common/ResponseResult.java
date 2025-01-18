package com.ruoyi.pms.common;

public class ResponseResult<T> {
    private Integer code;
    private String message;
    private T data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }


    public static <T> ResponseResult<T> success(T data) {
        ResponseResult<T> responseResult = new ResponseResult<T>();
        responseResult.setCode(ResponseCode.SUCCESS);
        responseResult.setMessage("success");
        responseResult.setData(data);
        return responseResult;
    }
    public static ResponseResult<Void> success() {
        ResponseResult<Void> responseResult = new ResponseResult<Void>();
        responseResult.setCode(ResponseCode.SUCCESS);
        responseResult.setMessage("success");
        return responseResult;
    }

}
