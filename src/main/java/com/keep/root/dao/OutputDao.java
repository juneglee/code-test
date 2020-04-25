package com.keep.root.dao;

import java.util.List;

import com.keep.root.domain.User;

public interface OutputDao {
	int insert(User user) throws Exception;
	
	List<User> findAll() throws Exception;
	
	User fineByNo(int no) throws Exception;

}
