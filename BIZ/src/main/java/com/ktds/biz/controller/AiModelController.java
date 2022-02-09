package com.ktds.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.model.AI_TRAIN_MODEL;
import com.ktds.biz.service.AiModelService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/model")
public class AiModelController {

	@Autowired
	AiModelService aiModelService;

	@RequestMapping(value = "/list")
	public ResponseEntity<List<AI_TRAIN_MODEL>> getModel(AI_PAGE page) {
		log.info("Request List....getModel.... - {}", page);
		List<AI_TRAIN_MODEL> out_model = aiModelService.selectAiTrainModel(page.getCam_id());
		for (AI_TRAIN_MODEL info : out_model) {
			log.info("train :: " + info.toString());
		}
		return new ResponseEntity<>(out_model, HttpStatus.OK);
	}

	@RequestMapping(value = "/learn")
	public List<AI_TRAIN_MODEL> getNewModelList(String cam_id) {
		log.info("$$$$$ 캠페인 아이디:" + cam_id);
		return aiModelService.selectAiTrainModel(cam_id);
	}
}
