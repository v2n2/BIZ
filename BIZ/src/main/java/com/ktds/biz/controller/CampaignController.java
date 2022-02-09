package com.ktds.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.PageCriteria;
import com.ktds.biz.model.PageMaker;
import com.ktds.biz.service.CampaignService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/campaign")
public class CampaignController {

	@Autowired
	CampaignService campaignService;

	@RequestMapping(value = "/totalPage")
	public List<String> getTotalCampaign(HttpSession session) {
		log.info("Request TotalCampaign....");
		List<String> response = new ArrayList<>();
		String admid = (String) session.getAttribute("sessionID");
		AI_CAMPAIGN in_compaign = new AI_CAMPAIGN();
		in_compaign.setAdm_id(admid);
		int maxRowNum = campaignService.selectCamPageNum(in_compaign);
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		log.info("response : " + response.get(0));
		return response;
	}

	@RequestMapping(value = "/listPage")
	public ResponseEntity<List<AI_CAMPAIGN>> getCampaignListPage(AI_CAMPAIGN campaign, HttpSession session) {
		log.info("Request List....getCampaignListPage.... - {}", campaign);
		String admid = (String) session.getAttribute("sessionID");
		campaign.setAdm_id(admid);
		List<AI_CAMPAIGN> out_campaign = campaignService.selectCampaignPage(campaign);
		for (AI_CAMPAIGN cam : out_campaign) {
			log.info("AI_CAMPAIGN :: " + cam.toString());
		}
		session.setAttribute("sessionCAMCNT", out_campaign.size());
		return new ResponseEntity<>(out_campaign, HttpStatus.OK);
	}

	@RequestMapping(value = "/aistatus")
	public ResponseEntity<AI_CAMPAIGN> getCampaignAiStatus(AI_CAMPAIGN campaign, HttpSession session) {
		log.info("Request List....getCampaignListPage.... - {}", campaign);
		String admid = (String) session.getAttribute("sessionID");
		campaign.setAdm_id(admid);
		AI_CAMPAIGN out_campaign = campaignService.selectCampaignAiStatus(campaign);
		return new ResponseEntity<>(out_campaign, HttpStatus.OK);
	}

	@RequestMapping(value = "/count")
	public PageMaker getCamTotalCount(AI_CAMPAIGN campaignParam, PageCriteria cri, HttpSession session) {
		log.info("##### 캠페인 매개변수:" + campaignParam.getSrc_name());
		String admId = (String) session.getAttribute("sessionID");
		campaignParam.setAdm_id(admId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = campaignService.selectCamCount(campaignParam);
		pageMaker.setTotalCount(totalCount);
		log.info("$$$$$ 총 목록 수:" + totalCount + ", 디스플레이 페이지:" + pageMaker.getDisplayPageNum() + ", 페이지 총 수:"
				+ pageMaker.getRealEndPage());
		return pageMaker;
	}

	@RequestMapping(value = "/lastOne")
	public String getCamLastOne(AI_CAMPAIGN campaignParam, HttpSession session) {
		log.info("##### 캠페인 매개변수:" + campaignParam.getSrc_name());
		String admId = (String) session.getAttribute("sessionID");
		campaignParam.setAdm_id(admId);

		String srcId = campaignService.selectLastOne(campaignParam);
		
		log.info("$$$$$ 최근 등록된 id:" + srcId);
		return srcId;
	}
	
	@RequestMapping(value = "/list")
	public List<AI_CAMPAIGN> getNewCampaignListPage(AI_CAMPAIGN campaignParam, PageCriteria cri, HttpSession session) {
		log.info("Request List....getNewCampaignListPage.... - {}", campaignParam.getSrc_name());
		
		String admId = (String) session.getAttribute("sessionID");
		log.info("Request List....admId.... - {}", admId);
		log.info("Request List....Page.... - {}", cri.getPage());
		log.info("Request List....pageNum.... - {}", cri.getPerPageNum());
		
		if(campaignParam.getSrc_name() != null && campaignParam.getSrc_name().length()!=0) {
			log.info("Request List....srcName... - {}", campaignParam.getSrc_name());
			campaignParam.setSrc_name('%'+campaignParam.getSrc_name()+'%');
		}
		campaignParam.setAdm_id(admId);
		campaignParam.setPage(cri.getPage());
		log.info("$$$$$$perPageNum:" + cri.getPerPageNum());
		campaignParam.setPerPageNum(cri.getPerPageNum());
		List<AI_CAMPAIGN> campaign = campaignService.selectNewCampaignPage(campaignParam);
		log.info("NEW_AI_CAMPAIGN :: " + campaign.toString());
		return campaign;
	}
}
