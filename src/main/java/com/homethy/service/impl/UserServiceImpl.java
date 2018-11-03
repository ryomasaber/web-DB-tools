package com.homethy.service.impl;

import com.homethy.UserHolder;
import com.homethy.constant.Constant;
import com.homethy.dao.sys.UserDao;
import com.homethy.dao.sys.UserGroupDao;
import com.homethy.dao.sys.UserRoleDao;
import com.homethy.domain.DatabaseUserFavorite;
import com.homethy.domain.DatabaseUserInfo;
import com.homethy.domain.DatabaseUserSqlHistory;
import com.homethy.domain.UserRole;
import com.homethy.service.UserService;
import com.homethy.util.HomethyStringUtil;
import com.homethy.util.JacksonUtils;
import com.homethy.util.MD5Support;
import com.homethy.util.ReturnJacksonUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

  @Autowired
  UserDao userDao;

  @Autowired
  UserHolder userHolder;

  @Autowired
  UserRoleDao userRoleDao;

  @Autowired
  UserGroupDao userGroupDao;

  @Override
  public DatabaseUserInfo getUserInfoByAccount(String accout){
    DatabaseUserInfo userInfo = userDao.queryUserInfoByAccount(accout);
    if(userInfo != null){
      List<UserRole> userRoleList = userRoleDao.queryUserRoleLsitByUserId(userInfo.getId());
      userInfo.setUserRoleList(userRoleList);
      return userInfo;
    }
    return null;
  }

  @Override
  public void updateLastLoginData(DatabaseUserInfo user){
    userDao.updateLastLoginData(user);
  }

  @Override
  public int saveUserFavoriteSql(String name,String statement){
    DatabaseUserFavorite databaseUserFavorite = new DatabaseUserFavorite();
    databaseUserFavorite.setName(name);
    databaseUserFavorite.setFavoriteSqlDetail(HomethyStringUtil.replceSingleQuot(statement));
    databaseUserFavorite.setClientIp(userHolder.getClientIp());
    databaseUserFavorite.setUserId(userHolder.getUserInfo().getId());
    return userDao.saveUserFavoriteSql(databaseUserFavorite);
  }

  @Override
  public int updateUserFavoriteSql(long id,String name,String statement){
    DatabaseUserFavorite databaseUserFavorite = new DatabaseUserFavorite();
    databaseUserFavorite.setId(id);
    databaseUserFavorite.setName(name);
    databaseUserFavorite.setFavoriteSqlDetail(HomethyStringUtil.replceSingleQuot(statement));
    databaseUserFavorite.setClientIp(userHolder.getClientIp());
    databaseUserFavorite.setUserId(userHolder.getUserInfo().getId());
    databaseUserFavorite.setUpdateTime(new Date());
    return userDao.updateUserFavoriteSql(databaseUserFavorite);
  }

  @Override
  public List<DatabaseUserFavorite> queryDatabaseUserFavoriteSql(){
    return userDao.queryDatabaseUserFavoriteSql(userHolder.getUserInfo().getId());
  }

  @Override
  public String queryDatabaseUserHistorySql(){
    try{
      List<DatabaseUserSqlHistory> list = userDao.queryDatabaseUserHistorySql(userHolder.getUserInfo().getId());
      return JacksonUtils.toJson(list);
    }catch (Exception e){
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,e.toString());
    }
  }

  @Override
  public int deleteUserFavoriteSql(long id){
    return userDao.deleteUserFavoriteSql(id,userHolder.getUserInfo().getId());
  }


  @Override
  public String updateUserPassword(String password,String newPassword,String confirmPassword){
    String encPassword = MD5Support.hex(password, Constant.MD5KEY);

    if(!(newPassword.equals(confirmPassword))){
      return HomethyStringUtil.returnResultStr(Constant.ERROR,"2次输入的密码不匹配");
    }else if(!(userHolder.getUserInfo().getPassword().equals(encPassword))){
      return HomethyStringUtil.returnResultStr(Constant.ERROR,"原始密码不正确");
    }else {
      int result = userDao.updateUserPassword(MD5Support.hex(newPassword, Constant.MD5KEY),userHolder.getUserInfo().getId());
      if(result == 1){
        //更新session中user的密码位新密码
        userHolder.getUserInfo().setPassword(MD5Support.hex(newPassword, Constant.MD5KEY));
        return HomethyStringUtil.returnResultStr(Constant.SUCCESS,Constant.SUCCESS_RESULT);
      }
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,Constant.SERRVER_ERROR);
    }
  }

  @Override
  public String createUserSubmit(DatabaseUserInfo userInfo,int roleGroup) {
    DatabaseUserInfo databaseUserInfo = getUserInfoByAccount(userInfo.getAccount());
    if(databaseUserInfo!=null){
      return HomethyStringUtil.returnResultStr(Constant.ERROR,"用户名重复！");
    }else{
      int insert = userDao.insertUser(userInfo);
      userGroupDao.insertUserGroup(userInfo.getId(),roleGroup);
      if(insert == 1){
        return HomethyStringUtil.returnResultStr(Constant.SUCCESS,Constant.SUCCESS_RESULT);
      }
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,Constant.SERRVER_ERROR);
    }
  }

  @Override
  public DatabaseUserInfo getUserInfoById(long id,long version) {
    return userDao.getUserById(id,version);
  }

  @Override
  public String shareUserFavoriteSql(int userId, long sqlId){
    int result = userDao.shareUserFavoriteSql(userId, sqlId,userHolder.getUserInfo().getId());
    if(result == 1){
      return HomethyStringUtil.returnResultStr(Constant.SUCCESS,Constant.SUCCESS_RESULT);
    }else{
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,Constant.SERRVER_ERROR);
    }
  }

  @Override
  public String getUserNamesByKey(String key){
    try {
      List<DatabaseUserInfo> list = userDao.getUserNames(key);
      return ReturnJacksonUtil.resultOk(list);
    } catch (Exception e) {
      e.printStackTrace();
      return StringUtils.EMPTY;
    }
  }

  @Override
  public String queryDatabaseUserInfo(int limit, int offset, String userName) {
    try{
      List<DatabaseUserInfo> list = null;
      if(StringUtils.isBlank(userName)){
        list = userDao.getAllUserInfo(offset, limit);
      }else{
        list = userDao.getUserInfo(offset, limit, userName);
      }
      JSONArray rowData = JSONArray.fromObject(list);
      Map<String,Object> result = new HashMap<>();
      result.put("rows",rowData);
      result.put("total",userDao.getTotalCountUsers());
      return JacksonUtils.toJson(result);
    } catch (Exception e) {
      return ReturnJacksonUtil.resultFail(Constant.ERROR,e.toString(),Locale.CHINESE);
    }
  }

  @Override
  public String updateUserInfo(DatabaseUserInfo userInfo){
    try{
      userDao.updateUserInfo(userInfo);
      return ReturnJacksonUtil.resultOk();
    }catch (Exception e) {
      e.printStackTrace();
      return ReturnJacksonUtil.resultFail(Constant.ERROR,e.toString(),Locale.CHINESE);
    }
  }

  @Override
  public String updateDefaultSchema(String defaultSchema) {
    try{
      int n = userDao.updateDefaultSchema(defaultSchema,userHolder.getUserInfo().getId());
      return HomethyStringUtil.returnResultStr(Constant.SUCCESS,"执行成功，影响行数："+n);
    }catch (Exception e){
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,e.toString());
    }
  }

  @Override
  public String deleteUser(String idList) {
    try{
      List<Long> list = Arrays.stream(idList.substring(0, idList.length() - 1).split(",")).map(id -> {
        return NumberUtils.toLong(id);
      }).collect(Collectors.toList());
      int n = userDao.deleteUser(list);
      return HomethyStringUtil.returnResultStr(Constant.SUCCESS,"执行成功，影响行数："+n);
    }catch (Exception e){
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,e.toString());
    }
  }

  @Override
  public String getSqlDetail(int sqlId) {
    try{
      return ReturnJacksonUtil.resultOk(userDao.getSqlDetailById(sqlId));
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  @Override
  public String resetPassword(long id,String password){
    try{
      int n = userDao.resetUserPassword(id, MD5Support.hex(password, Constant.MD5KEY));
      return HomethyStringUtil.returnResultStr(Constant.SUCCESS,"执行成功，影响行数："+n);
    }catch (Exception e){
      return HomethyStringUtil.returnFailResultStr(Constant.ERROR,e.toString());
    }
  }
}
