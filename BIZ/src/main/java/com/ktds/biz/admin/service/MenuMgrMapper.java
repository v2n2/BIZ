package com.ktds.biz.admin.service;

import com.ktds.biz.model.MenuList;

public interface MenuMgrMapper {

	void updateMenuByNo(MenuList menu);

	void insertMenu(MenuList menu);
	
	void deleteMenuByNo(String MenuNo);
}
