package com.keep.root.dao;

import java.util.List;
import java.util.Map;
import com.keep.root.domain.User;

public interface UserDao {

  int insert(User user) throws Exception;

  List<User> findAll(int userNo) throws Exception;

  User findByNo(int no) throws Exception;

  User findForWithdraw(Map<String, Object> params) throws Exception;

  int update(User user) throws Exception;

  int delete(int no) throws Exception;

  User findByEmailAndPassword(Map<String, Object> params) throws Exception;
}
