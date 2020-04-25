package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.keep.root.dao.OutputDao;
import com.keep.root.domain.User;
import com.keep.root.service.OutputService;

@Component
public class OutputServicelmpl implements OutputService{
	
	OutputDao outputDao;
	
	public OutputServicelmpl(OutputDao outputDao) {
		this.outputDao = outputDao;
		
	}

	@Override
	public int add(User user) throws Exception {
		return outputDao.insert(user);
	}

	@Override
	public List<User> findAllByUser() throws Exception {
		return outputDao.findAll();
	}

	@Override
	public User get(int no) throws Exception {
		return outputDao.fineByNo(no);
	}
}

