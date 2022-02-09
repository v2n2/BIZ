package com.ktds.biz.epr.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.epr.model.Epr;
import com.ktds.biz.epr.model.Epr_sub01;
import com.ktds.biz.epr.service.impl.EprService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/epr")
public class EprController {
	
	@Autowired
	EprService eprService;
	
	@RequestMapping(value = "/SearchEpr")
	public Epr Searchepr(Epr_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getBse_emp_no() );
		
		return eprService.selectEpr(com);
	}
	
	@RequestMapping(value = "/SearchEprDtl")
	public Epr_sub01 SearcheprDtl(Epr_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getBse_emp_no() );
		
		return eprService.SearchEprDtl(com);
	}
	@RequestMapping(value = "/InsertEpr")
	public void Insertepr(Epr_sub01 epr_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + epr_sub01.getBse_emp_no() );
		
		eprService.insertEpr(epr_sub01);
	}
	
	@RequestMapping(value = "/UpdateEpr")
	public void Updateepr(Epr_sub01 epr_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + epr_sub01.getBse_emp_no() );
		
		eprService.updateEprByNo(epr_sub01);
	}

	@RequestMapping(value = "/DeleteEpr")
	public void deleteCode(Epr_sub01 epr_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + epr_sub01.getBse_emp_no() );
		
		eprService.deleteEprByNo(epr_sub01);
	}
	
	@RequestMapping(value = "/eprPage")
	public List<String> CodePage(Epr_sub01 com,HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = eprService.selectEprPageNum(com);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}

	
}