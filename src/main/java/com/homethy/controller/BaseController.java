package com.homethy.controller;

import com.homethy.UserHolder;
import com.homethy.constant.Constant;
import com.homethy.util.HomethyStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BaseController {

  public static String PERMISSION_DENIED = HomethyStringUtil.returnResultStr(Constant.ERROR,"没有权限！");

  @Autowired
  UserHolder userHolder;

  public boolean isDbAdminUser(){
    if(userHolder.getUserInfo().getLevel() == 9){
      return true;
    }
    return false;
  }

}
