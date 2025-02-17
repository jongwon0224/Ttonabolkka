package com.app.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public int saveUser(User user) {

		int result = userDAO.saveUser(user);

		return result;
	}

	@Override
	public User findUserById(String id) {

		User user = userDAO.findUserById(id);

		return user;
	}

	@Override
	public User checkUserLogin(User user) {
		
		// 1) 서비스 자체에서 로직을 수행
		
		User loginUser = userDAO.findUserById(user.getId());

		if (loginUser != null && user.getPassword().equals(loginUser.getPassword())) { // 비밀번호 맞다!
			
			return loginUser;
		}
		
		return null;
		
	}
}
