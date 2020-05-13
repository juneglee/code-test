package com.keep.root.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import com.keep.root.dao.UserDao;
import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@Component
public class UserServiceImpl implements UserService {

  UserDao userDao;

  public UserServiceImpl(UserDao userDao) {
    this.userDao = userDao;
  }

  @Override
  public void add(User user) throws Exception {
    userDao.insert(user);
  }

  @Override
  public List<User> list(int userNo) throws Exception {
    return userDao.findAll(userNo);
  }

  @Override
  public User get(int no) throws Exception {
    return userDao.findByNo(no);
  }

  @Override
  public User get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return userDao.findByEmailAndPassword(params);
  }

  @Override
  public User get(String name, String tel, String account, String bank) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("name", name);
    params.put("tel", tel);
    params.put("account", account);
    params.put("bank", bank);
    return userDao.findForWithdraw(params);
  }

  @Override
  public int update(User user) throws Exception {
    return userDao.update(user);
  }

  @Override
  public int delete(int no) throws Exception {
    return userDao.delete(no);
  }

}
