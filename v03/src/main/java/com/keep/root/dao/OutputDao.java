package com.keep.root.dao;

import java.util.List;

import com.keep.root.domain.Point;
import com.keep.root.domain.User;

//출금용 구현 테스트
public interface OutputDao {
	int insert(User user) throws Exception;
	
	List<User> findAll() throws Exception;
	
	List<Point> findOutListByUserNo() throws Exception;
	
	User fineByNo(int no) throws Exception;

}
