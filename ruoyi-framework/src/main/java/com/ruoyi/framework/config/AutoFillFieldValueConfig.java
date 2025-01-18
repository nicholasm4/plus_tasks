package com.ruoyi.framework.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.ruoyi.common.utils.SecurityUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 自动填充字段值的配置
 * 插入时，保存创建时间和创建人，以及更新时间和更新人。
 * 更新时，保存更新时间和更新人。
 * 其中，创建人，更新人都是从ThreadlUser获取的当前线程用户信息
 */

@Component
public class AutoFillFieldValueConfig implements MetaObjectHandler {

    private static final String createdBy = "createBy";
    private static final String updatedBy = "updateBy";
    private static final String createdAt = "createTime";
    private static final String updatedAt = "updateTime";

    @Override
    public void insertFill(MetaObject metaObject) {
        String username = SecurityUtils.getUsername();
        this.strictInsertFill(metaObject, createdAt, Date.class, new Date());
        this.strictInsertFill(metaObject, createdBy, String.class, username);
        this.strictInsertFill(metaObject, updatedAt, Date.class, new Date());
        this.strictInsertFill(metaObject, updatedBy, String.class, username);
String ss = "";
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        String username = SecurityUtils.getUsername();
        this.strictInsertFill(metaObject, updatedAt, Date.class, new Date());
        this.strictInsertFill(metaObject, updatedBy, String.class, username);

    }




}
