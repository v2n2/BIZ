
package com.ktds.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.Login_CRM;
import com.ktds.biz.model.MenuList;
import com.ktds.biz.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/proc")
	public List<String> list(Login_CRM user, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + user.getEmp_no() + "  ADM_PW : " + user.getEmp_password());
		List<String> response = new ArrayList<String>();
		Login_CRM admin = loginService.selectAccountById(user.getEmp_no());
		if (admin == null) {
			response.add("fail. user not found!");
		} else {
			if (admin.getEmp_password().equals(user.getEmp_password())) {
				response.add("success");
				session.setAttribute("sessionID", admin.getEmp_no());
				session.setAttribute("sessionNAME", admin.getEmp_name());
				session.setAttribute("sessionTELNO", admin.getTel_no());
				//loginService.updateAccountById(admin.getEmp_no());
			} else {
				response.add("fail. PW not correct!");
			}
		}
		log.info("response : " + response.get(0));
		return response;
	}
	
	@RequestMapping(value = "/menu")
	public List<MenuList> menuList(HttpSession session){
		List<MenuList> menu = null; 
		menu = loginService.selectAllMenu();
		log.info("Menu Size : "+menu.size());
		
		session.setAttribute("menu", menu);
		return menu;
		
	}
}
