package com.ktds.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_TRAIN_MODEL;
import com.ktds.biz.model.AI_TRAIN_MODEL_FEATURE;
import com.ktds.biz.model.Learning_Info;
import com.ktds.biz.model.Learning_Res;
import com.ktds.biz.service.LearningService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/Learning")
public class LearningController {

	@Autowired
	LearningService learningService;

	@RequestMapping(value = "/info")
	public ResponseEntity<List<Learning_Info>> getLearning_info(AI_CAMPAIGN campaign) {
		log.info("Request List....getLearning.... - {}", campaign);
		log.info("Request List....getLearning.... - {}", campaign.getSrc_id());
		List<Learning_Info> out_learning = null;
		alert("getCam_id :: " + campaign.getSrc_id());
		if (campaign.getSrc_id() != null) {
			log.info("##################");
			out_learning = learningService.getLearning_info(campaign);
		}
		log.info("Request List....getLearning out .... - {}", out_learning);
		for (Learning_Info info : out_learning) {
			log.info("Learning :: " + info.toString());
		}
		return new ResponseEntity<>(out_learning, HttpStatus.OK);
	}

	private void alert(String string) {
		log.info(string);
	}

	@RequestMapping(value = "/res")
	public ResponseEntity<Object> getLearning_res(AI_TRAIN_MODEL campaign) {
		log.info("Request List....getLearningres.... - {}", campaign);
		log.info("Request List....getLearningres.... - {}", campaign.getCam_id());
		List<Learning_Res> out_learning = null;
		alert("getCam_id22 :: " + campaign.getCam_id());
		if (campaign.getCam_id() != null) {
			log.info("##################");
			out_learning = learningService.getLearning_res(campaign);
		}
		log.info("Request List....getLearningres out .... - {}", out_learning);
		for (Learning_Res res : out_learning) {
			log.info("Learning res :: " + res.toString());
		}
		return new ResponseEntity<Object>(out_learning, HttpStatus.OK);
	}

	@RequestMapping(value = "/feature/list")
	public List<AI_TRAIN_MODEL_FEATURE> getLearning_feature(AI_CAMPAIGN campaign) {
		return learningService.getLearning_feature(campaign);
	}

	@RequestMapping(value = "/result")
	public List<AI_TRAIN_MODEL> getLearningResultList(String cam_id) {
		return learningService.getLearningResultList(cam_id);
	}

	@RequestMapping(value = "/weight")
	public List<Learning_Res> getLearningWeighting(String cam_id, String train_method) {
		return learningService.getLearningWeighting(cam_id, train_method);
	}
}
