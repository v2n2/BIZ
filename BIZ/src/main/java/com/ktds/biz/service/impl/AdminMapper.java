package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_ADMINUSER;

public interface AdminMapper {

	AI_ADMINUSER selectAdminById(String ADMIN_ID);

	void updateAdminById(String ADMIN_ID);

	List<AI_ADMINUSER> selectAllAdmin();

	void insertAdmin(AI_ADMINUSER admin);
}
