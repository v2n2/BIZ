package com.ktds.biz.admin.service;

import java.util.List;

import com.ktds.biz.admin.model.User;

public interface UserMgrMapper {

	void updateUserByNo(User usr);

	void insertUser(User usr);
	
	void deleteUserByNo(User usr);
	
	List<User> selectUserPage (User usr);
	
	int selectUserPageNum();
}
