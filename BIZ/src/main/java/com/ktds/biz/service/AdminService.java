package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_ADMINUSER;
import com.ktds.biz.service.impl.AdminMapper;

@Service
@Transactional
public class AdminService implements AdminMapper {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public AI_ADMINUSER selectAdminById(String ADMIN_ID) {
		return adminMapper.selectAdminById(ADMIN_ID);
	}

	@Override
	public List<AI_ADMINUSER> selectAllAdmin() {
		return adminMapper.selectAllAdmin();
	}

	@Override
	public void insertAdmin(AI_ADMINUSER admin) {
		adminMapper.insertAdmin(admin);
	}

	@Override
	public void updateAdminById(String ADMIN_ID) {
		adminMapper.updateAdminById(ADMIN_ID);
	}
}
