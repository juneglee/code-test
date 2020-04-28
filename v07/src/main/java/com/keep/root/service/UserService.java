package com.keep.root.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.keep.root.domain.User;

@Service
public interface UserService {
  void add(User user) throws Exception;

  List<User> list() throws Exception;

  User get(int no) throws Exception;

  int update(User user) throws Exception;

  int delete(int no) throws Exception;
}
