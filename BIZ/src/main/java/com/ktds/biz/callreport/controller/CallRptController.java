package com.ktds.biz.callreport.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.callreport.model.CallRpt;
import com.ktds.biz.callreport.model.CallRpt_sub01;
import com.ktds.biz.callreport.service.impl.CallRptService;
import com.ktds.biz.deal.model.Deal_sub01;
import com.ktds.biz.model.MenuList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/CallReport")
public class CallRptController {
	
	@Autowired
	CallRptService callRptService;
	
	@RequestMapping(value = "/searchRpt")
	public CallRpt searchRpt(CallRpt_sub01 rpt, HttpSession session) {
		log.info("Request List....");
		
		return callRptService.selectRpt(rpt);
	}
	@RequestMapping(value = "/searchRptDetail")
	public CallRpt_sub01 searchRptDetail(CallRpt_sub01 rpt, HttpSession session) {
		log.info("Request List....");
		
		return callRptService.selectRptDetail(rpt.getRpt_no());
	}
	
	@RequestMapping(value = "/registRpt")
	public void insertRpt(CallRpt_sub01 rpt, HttpSession session) {
		log.info("Request List....");
		
		callRptService.insertRpt(rpt);
	}
	
	@RequestMapping(value = "/updateRpt")
	public void updateRpt(CallRpt_sub01 rpt, HttpSession session) {
		log.info("Request List....");
		
		callRptService.updateRptByNo(rpt);
	}
	
	@RequestMapping(value = "/deleteRpt")
	public void deleteRpt(CallRpt_sub01 rpt, HttpSession session) {
		log.info("Request List....");
		
		callRptService.deleteRptByNo(rpt.getRpt_no());
	}
	
	@RequestMapping(value = "/rptPage")
	public List<String> CodePage(CallRpt_sub01 com,HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = callRptService.selectRptCount(com);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
}
