package com.ktds.biz.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.admin.service.MenuMgrMapper;
import com.ktds.biz.model.MenuList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MenuMgrService implements MenuMgrMapper {
	@Autowired
	MenuMgrMapper menuMapper;
	@Override
	public void updateMenuByNo(MenuList menu) {
		// TODO Auto-generated method stub
		menuMapper.updateMenuByNo(menu);
	}

	@Override
	public void insertMenu(MenuList menu) {
		// TODO Auto-generated method stub
		menuMapper.insertMenu(menu);
	}

	@Override
	public void deleteMenuByNo(String MenuNo) {
		// TODO Auto-generated method stub
		menuMapper.deleteMenuByNo(MenuNo);
	}

}
