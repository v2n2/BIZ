package com.ktds.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_ADMINUSER;
import com.ktds.biz.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	AdminService admService;

	@RequestMapping(value = "/login_proc")
	public List<String> list(AI_ADMINUSER user, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + user.getADM_ID() + "  ADM_PW : " + user.getADM_PW());
		List<String> response = new ArrayList<String>();
		AI_ADMINUSER admin = admService.selectAdminById(user.getADM_ID());
		if (admin == null) {
			response.add("fail. user not found!");
		} else {
			if (admin.getADM_PW().equals(user.getADM_PW())) {
				response.add("success");
				session.setAttribute("sessionID", admin.getADM_ID());
				session.setAttribute("sessionNAME", admin.getADM_NAME());
				session.setAttribute("sessionROLE", admin.getADM_ROLE());
				session.setAttribute("sessionLOGIN", admin.getADM_LOGIN());
				session.setAttribute("sessionCAMCNT", admin.getCAM_CNT());
				admService.updateAdminById(admin.getADM_ID());
			} else {
				response.add("fail. PW not correct!");
			}
		}
		log.info("response : " + response.get(0));
		return response;
	}

	@RequestMapping(value = "/register_check")
	public List<String> register_check(AI_ADMINUSER admin) {
		log.info("Request register_check....{}", admin);
		List<String> response = new ArrayList<String>();
		AI_ADMINUSER user = admService.selectAdminById(admin.getADM_ID());
		if (user != null) {
			response.add("fail. ID Already exists ");
		} else {
			admService.insertAdmin(admin);
			response.add("success");
		}
		log.info("response : " + response.get(0));
		return response;
	}
}
