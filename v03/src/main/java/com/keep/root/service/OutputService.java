package com.keep.root.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.keep.root.domain.Point;
import com.keep.root.domain.User;

//출금용 구현 테스트
@Service
public interface OutputService {
	int add(User user) throws Exception;
	
	List<User> findAllByUser() throws Exception;
	
	List<Point> findOutListByUserNo() throws Exception;
	
	User get(int no) throws Exception;

}
