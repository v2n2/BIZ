package com.ktds.biz.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.admin.model.CommonCode;
import com.ktds.biz.admin.model.CommonDtlCode;
import com.ktds.biz.admin.service.impl.CommonCodeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/admin")
public class CommonCodeController {
	
	@Autowired
	CommonCodeService commonCodeService;
	
	@RequestMapping(value = "/SearchCode")
	public List<CommonCode> SearchCode(CommonCode com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_no() );
		
		return commonCodeService.searchCode(com);
	}
	
	@RequestMapping(value = "/SearchDtlCode")
	public List<CommonDtlCode> SearchDtlCode(CommonDtlCode comDtl, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + comDtl.getEmp_no() );
		
		return commonCodeService.searchDtlCode(comDtl);
	}
	@RequestMapping(value = "/SearchDtlCode2")
	public List<CommonDtlCode> SearchDtlCode2(CommonDtlCode comDtl, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + comDtl.getEmp_no() );
		
		return commonCodeService.searchDtlCode2(comDtl);
	}
	@RequestMapping(value = "/InsertCode")
	public void InsertCode(CommonCode com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_no() );
		
		commonCodeService.insertCode(com);
	}
	
	@RequestMapping(value = "/InsertDtlCode")
	public void insertDtlCode(CommonDtlCode comDtl, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + comDtl.getEmp_no() );
		
		commonCodeService.insertDtlCode(comDtl);
	}
	@RequestMapping(value = "/UpdateCode")
	public void updateCode(CommonCode com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_no() );
		
		commonCodeService.updateCode(com);
	}
	
	@RequestMapping(value = "/UpdateDtlCode")
	public void updateDtlCode(CommonDtlCode comDtl, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + comDtl.getEmp_no() );
		
		commonCodeService.updateDtlCode(comDtl);
	}
	
	@RequestMapping(value = "/DeleteCode")
	public void deleteCode(CommonCode com, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + com.getEmp_no() );
		
		commonCodeService.deleteCode(com);
	}
	@RequestMapping(value = "/DeleteDtlCode")
	public void deleteDtlCode(CommonDtlCode comDtl, HttpSession session) {
		log.info("Request List....");
		log.info("ADM_ID : " + comDtl.getEmp_no() );
		
		commonCodeService.deleteDtlCode(comDtl);
	}
	@RequestMapping(value = "/CodePage")
	public List<String> CodePage(HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = commonCodeService.selectCommonCodePageNum();
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
	@RequestMapping(value = "/CodeDtlPage")
	public List<String> CodeDtlPage(CommonDtlCode comDtl, HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = commonCodeService.selectCommonDtlCodePageNum(comDtl);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
	
}