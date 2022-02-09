package com.ktds.biz.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ktds.biz.admin.model.CommonDtlCode;
import com.ktds.biz.admin.service.impl.CommonCodeService;

@Component
public class ScheduleTest {
	@Autowired
	CommonCodeService commonCodeService;
	
	/*
	 * @Scheduled(fixedDelay = 10000) public void test() throws Exception{
	 * CommonDtlCode com = new CommonDtlCode(); com.setGrp_cd("CAL_RPT_TYPE");
	 * List<CommonDtlCode> a = commonCodeService.searchDtlCode2(com);
	 * 
	 * for(int i = 0 ; i <a.size();i++) { System.out.println(a.get(i).toString()); }
	 * }
	 */
}
