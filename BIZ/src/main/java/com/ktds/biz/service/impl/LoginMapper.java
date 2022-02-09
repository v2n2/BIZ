package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.Login_CRM;
import com.ktds.biz.model.MenuList;

public interface LoginMapper {

	Login_CRM selectAccountById(String EMP_NO);

	void updateAccountById(String EMP_NO);

	List<Login_CRM> selectAllAccount();

	void insertAccount(Login_CRM login);
	
	List<MenuList> selectAllMenu();
}
