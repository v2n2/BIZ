package com.ktds.biz.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.admin.model.User;
import com.ktds.biz.admin.service.impl.UserMgrService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/admin")
public class UserMgrController {
	
	@Autowired
	UserMgrService usrService;
	
	@RequestMapping(value = "/SearchUser")
	public List<User> SearchUser(User usr, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + usr.getEmp_no() );
		
		return usrService.selectUserPage(usr);
	}
	
	@RequestMapping(value = "/InsertUser")
	public void InsertUser(User usr, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + usr.getRgs_emp_no() );
		
		usrService.insertUser(usr);
	}
	
	@RequestMapping(value = "/UpdateUser")
	public void updateUser(User usr, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + usr.getEmp_no() );
		
		usrService.updateUserByNo(usr);
	}
	
	@RequestMapping(value = "/DeleteUser")
	public void deleteUser(User usr, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + usr.getEmp_no() );
		
		usrService.deleteUserByNo(usr);
	}
	
	@RequestMapping(value = "/UserPage")
	public List<String> userPage(HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = usrService.selectUserPageNum();
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
	
}