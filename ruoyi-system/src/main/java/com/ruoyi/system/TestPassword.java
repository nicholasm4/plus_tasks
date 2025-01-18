package com.ruoyi.system;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import org.junit.jupiter.api.Test;

public class TestPassword {

    @Test
    public void test() {

        ISysUserService userService = new SysUserServiceImpl();

        SysUser user= userService.selectUserById(1L);
        System.out.println(user);
    }
}
