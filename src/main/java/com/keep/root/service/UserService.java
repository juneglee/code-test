package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.User;

public interface UserService {
  void add(User user) throws Exception;

  List<User> list(int userNo) throws Exception;

  User get(int no) throws Exception;

  User get(String name, String tel, String account, String bank) throws Exception;

  int update(User user) throws Exception;

  int delete(int no) throws Exception;
}
