package com.keep.root.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.keep.root.domain.User;

@Service
public interface OutputService {
	int add(User user) throws Exception;
	
	List<User> findAllByUser() throws Exception;
	
	User get(int no) throws Exception;

}
