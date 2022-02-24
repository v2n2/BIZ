package com.ktds.biz.deal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.admin.model.CommonDtlCode;
import com.ktds.biz.admin.service.impl.CommonCodeService;
import com.ktds.biz.deal.model.DealDashboard;
import com.ktds.biz.deal.model.DealDashboard_sub01;
import com.ktds.biz.deal.model.Deal_sub01;
import com.ktds.biz.deal.service.impl.DealDashboardService;
import com.ktds.biz.deal.service.impl.DealService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/dealDashboard")
public class DealDashboardController {
	
	@Autowired
	DealService dealService;
	@Autowired
	DealDashboardService dealDashboardService;
	@Autowired
	CommonCodeService commonCodeService;
	
	@RequestMapping(value = "/DealDashboardSearch")
	public DealDashboard SearchDeal(Deal_sub01 com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_name() );
		DealDashboard_sub01 dashboard = new DealDashboard_sub01();
		//나중에 이렇게 바꿔서 써야함 -회사채/증자 등 공통코드 만들어지면
		//comDtlCd.setGrp_cd(com.getBiz_type().toUpperCase());
		dashboard.setGrp_cd(com.getProc_type());
		dashboard.setBiz_type(com.getBiz_type());
		//첫번째 해당 유형의 프로세스 공통코드에서 조회

		//두번째 해당 유형의 Deal 조회
		//세번째 해당 값들 DealDashboard에 세팅 후 리턴
		DealDashboard dealDashboardList = new DealDashboard();
		dealDashboardList.setDealDashboardList(dealDashboardService.searchDealDashboard(dashboard));
		dealDashboardList.setDealList(dealService.searchAllDeal(com));
		return dealDashboardList;
		
		
	}
	@RequestMapping(value = "/DealTabSearch")
	public List<CommonDtlCode> SearchDealTab(CommonDtlCode com, HttpSession session) {
		log.info("Request List....");
		//나중에 이렇게 바꿔서 써야함 -회사채/증자 등 공통코드 만들어지면
		
		return commonCodeService.searchDtlCode2(com);
		
		
	}
	
}