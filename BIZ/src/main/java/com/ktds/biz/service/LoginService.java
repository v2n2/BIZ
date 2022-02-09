package com.ktds.biz.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.Login_CRM;
import com.ktds.biz.model.MenuList;
import com.ktds.biz.service.impl.LoginMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LoginService implements LoginMapper {
	@Autowired
	LoginMapper loginmapper;
	@Override
	public Login_CRM selectAccountById(String EMP_NO) {
		// TODO Auto-generated method stub
		log.info("emp_no: "+EMP_NO);
		return loginmapper.selectAccountById(EMP_NO);
	}

	@Override
	public void updateAccountById(String EMP_NO) {
		// TODO Auto-generated method stub
		loginmapper.updateAccountById(EMP_NO);
	}

	@Override
	public List<Login_CRM> selectAllAccount() {
		// TODO Auto-generated method stub
		return loginmapper.selectAllAccount();
	}

	@Override
	public void insertAccount(Login_CRM login) {
		// TODO Auto-generated method stub
		loginmapper.insertAccount(login);
	}

	@Override
	public List<MenuList> selectAllMenu() {
		// TODO Auto-generated method stub
		return loginmapper.selectAllMenu();
	}

}
