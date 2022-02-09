package com.ktds.biz.deal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.deal.model.Deal;
import com.ktds.biz.deal.model.DealLgr;
import com.ktds.biz.deal.model.Deal_Lgr_sub01;
import com.ktds.biz.deal.model.Deal_sub01;
import com.ktds.biz.deal.service.impl.DealService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/deal")
public class DealController {
	
	@Autowired
	DealService dealService;
	
	@RequestMapping(value = "/SearchDeal")
	public Deal SearchDeal(Deal_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_name() );
		
		return dealService.selectDeal(com);
	}
	
	@RequestMapping(value = "/SearchDealDtl")
	public Deal_sub01 SearchDealDtl(Deal_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_name() );
		
		return dealService.SearchDealDtl(com);
	}
	@RequestMapping(value = "/InsertDeal")
	public void InsertDeal(Deal_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.insertDeal(deal_sub01);
	}
	
	@RequestMapping(value = "/UpdateDeal")
	public void UpdateDeal(Deal_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.updateDealByNo(deal_sub01);
	}

	@RequestMapping(value = "/DeleteDeal")
	public void deleteCode(Deal_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.deleteDealByNo(deal_sub01);
	}
	
	@RequestMapping(value = "/DealPage")
	public List<String> CodePage(Deal_sub01 com,HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = dealService.selectDealPageNum(com);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
	@RequestMapping(value = "/SearchLgr")
	public DealLgr SearchLgr(Deal_Lgr_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_name() );
		
		return dealService.selectLgr(com);
	}
	
	@RequestMapping(value = "/SearchLgrDtl")
	public Deal_Lgr_sub01 SearchLgrDtl(Deal_Lgr_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_name() );
		
		return dealService.SearchLgrDtl(com);
	}
	@RequestMapping(value = "/InsertLgr")
	public void InsertLgr(Deal_Lgr_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.insertLgr(deal_sub01);
	}
	
	@RequestMapping(value = "/UpdateLgr")
	public void UpdateLgr(Deal_Lgr_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.updateLgrByNo(deal_sub01);
	}

	@RequestMapping(value = "/DeleteLgr")
	public void deleteLgr(Deal_Lgr_sub01 deal_sub01, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + deal_sub01.getRgs_emp_no() );
		
		dealService.deleteLgrByNo(deal_sub01);
	}
	
	@RequestMapping(value = "/LgrPage")
	public List<String> CodePage(Deal_Lgr_sub01 com,HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = dealService.selectLgrPageNum(com);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
	
}