package com.app.service.user;

import com.app.dto.user.User;

public interface UserService {
	
	int saveUser(User user);

	User checkUserLogin(User user);
	
	User findUserById(String id);
	
	int modifyUser(User user);

	int removeUser(User user);

}
