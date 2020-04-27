package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.User;

public interface UserDao {

  int insert(User user) throws Exception;

  List<User> findAll() throws Exception;

  User findByNo(int no) throws Exception;

  int update(User user) throws Exception;

  int delete(int no) throws Exception;

}
