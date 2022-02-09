package com.ktds.biz.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.admin.model.User;
import com.ktds.biz.admin.service.UserMgrMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class UserMgrService implements UserMgrMapper {
	@Autowired
	UserMgrMapper usrMapper;
	
	@Override
	public void updateUserByNo(User usr) {
		// TODO Auto-generated method stub
		usrMapper.updateUserByNo(usr);
	}

	@Override
	public void insertUser(User usr) {
		// TODO Auto-generated method stub
		usrMapper.insertUser(usr);
	}

	@Override
	public void deleteUserByNo(User usr) {
		// TODO Auto-generated method stub
		usrMapper.deleteUserByNo(usr);
	}

	@Override
	public List<User> selectUserPage(User usr) {
		// TODO Auto-generated method stub
		return usrMapper.selectUserPage(usr);
	}

	@Override
	public int selectUserPageNum() {
		// TODO Auto-generated method stub
		return usrMapper.selectUserPageNum();
	}

}
