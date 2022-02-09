package com.ktds.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_STAGING;
import com.ktds.biz.service.PretreatmentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/Pretreatment")
public class PretreatmentController {

	@Autowired
	PretreatmentService pretreatmentService;

	@RequestMapping(value = "/list")
	public ResponseEntity<List<AI_CAMPAIGN>> getCampaignList(AI_CAMPAIGN campaign) {
		log.info("Request List....getCampaignList.... - {}", campaign);
		List<AI_CAMPAIGN> out_campaign = null;
		if (campaign.getSrc_name() != null || campaign.getAdm_id() != null || campaign.getSrc_type() != null
				|| campaign.getStatus_cd() != null) {
			out_campaign = pretreatmentService.selectCampaign(campaign);
		} else {
			out_campaign = pretreatmentService.selectAllcampaign();
		}
		for (AI_CAMPAIGN cam : out_campaign) {
			log.info("DS_CAMPAIGN :: " + cam.toString());
		}
		return new ResponseEntity<>(out_campaign, HttpStatus.OK);
	}

	@RequestMapping(value = "/detail")
	public ResponseEntity<List<AI_STAGING>> getCampaignTrg(AI_CAMPAIGN campaign) {
		log.info("Request List....getCampaignTrg.... - {}", campaign.getSrc_id());
		List<AI_STAGING> trainData = null;
		if (campaign.getSrc_id() != null) {
			trainData = pretreatmentService.selectStaginTrain(campaign);
		}
		if (trainData == null) {
			log.info("trainData is null!! :: {}", trainData);
		} else {
			log.info("trainData is not null!! :: {}", trainData);
		}
		for (AI_STAGING info : trainData) {
			log.info("Pretreatment :: " + info.toString());
		}
		log.info("getCampaignTrg return");
		return new ResponseEntity<>(trainData, HttpStatus.OK);
	}

	@RequestMapping(value = "/detailResult")
	public ResponseEntity<List<AI_STAGING>> getCampaignTrgResult(AI_CAMPAIGN campaign) {
		log.info("Request List....getCampaignTrgResult.... - {}", campaign.getSrc_id());
		List<AI_STAGING> trainData = null;
		if (campaign.getSrc_id() != null) {
			trainData = pretreatmentService.selectStaginTrainResult(campaign);
		}
		if (trainData == null) {
			log.info("trainData is null!! :: {}", trainData);
		} else {
			log.info("trainData is not null!! :: {}", trainData);
		}
		for (AI_STAGING info : trainData) {
			log.info("Pretreatment :: " + info.toString());
		}
		log.info("getCampaignTrg return");
		return new ResponseEntity<>(trainData, HttpStatus.OK);
	}
}
