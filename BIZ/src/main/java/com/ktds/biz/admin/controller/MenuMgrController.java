package com.ktds.biz.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.admin.service.impl.MenuMgrService;
import com.ktds.biz.model.MenuList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/admin")
public class MenuMgrController {
	
	@Autowired
	MenuMgrService menuService;
	
	@RequestMapping(value = "/InsertMenu")
	public void insertMenu(MenuList user, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + user.getEmp_no() );
		if("".equals(user.getPar_menu_no())) {
			user.setPar_menu_no(null);
		}
		menuService.insertMenu(user);
	}
	
	@RequestMapping(value = "/UpdateMenu")
	public void updateMenu(MenuList user, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + user.getEmp_no() );
		
		menuService.updateMenuByNo(user);
	}
	
	@RequestMapping(value = "/DeleteMenu")
	public void deleteMenu(MenuList user, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + user.getEmp_no() );
		
		menuService.deleteMenuByNo(user.getMenu_no());
	}
}
