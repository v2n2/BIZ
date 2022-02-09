package com.ktds.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.model.AI_STAGING;
import com.ktds.biz.model.PageCriteria;
import com.ktds.biz.model.PageMaker;
import com.ktds.biz.service.StagingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/staging")
public class StagingController {

	@Autowired
	StagingService stagingService;

	@RequestMapping(value = "/train")
	public ResponseEntity<List<AI_STAGING>> getTrain(AI_PAGE page) {
		log.info("Request List....getTrain.... - {}", page);
		List<AI_STAGING> out_train = stagingService.selectStaginTrain(page);
		for (AI_STAGING info : out_train) {
			log.info("train :: " + info.toString());
		}

		return new ResponseEntity<>(out_train, HttpStatus.OK);
	}

	@RequestMapping(value = "/test")
	public ResponseEntity<List<AI_STAGING>> getTest(AI_PAGE page) {
		log.info("Request List....getTest.... - {}", page);
		List<AI_STAGING> out_test = stagingService.selectStaginTest(page);
		for (AI_STAGING info : out_test) {
			log.info("test :: " + info.toString());
		}
		return new ResponseEntity<>(out_test, HttpStatus.OK);
	}

	@RequestMapping(value = "/result")
	public ResponseEntity<List<AI_STAGING>> getResult(AI_PAGE page) {
		log.info("Request List....getResult.... - {}", page);
		List<AI_STAGING> out_test = null;
		if (page.getPage().equals("1")) {
			out_test = stagingService.selectStaginTrain(page);
		} else if (page.getPage().equals("2")) {
			out_test = stagingService.selectStaginTest(page);
		} else if (page.getPage().equals("3")) {
			out_test = stagingService.selectStaginTrainResult(page);
		} else if (page.getPage().equals("4")) {
			out_test = stagingService.selectStaginTestResult(page);
		}
		for (AI_STAGING info : out_test) {
			log.info("test :: " + info.toString());
		}
		return new ResponseEntity<>(out_test, HttpStatus.OK);
	}

	@RequestMapping(value = "/predict")
	public ResponseEntity<List<AI_STAGING>> getPredict(AI_PAGE page) {
		log.info("Request List....getPredict.... - {}", page);
		List<AI_STAGING> out_test = stagingService.selectTestPredict(page);
		log.info("######....getPredict.... - {}", page);
		for (AI_STAGING info : out_test) {
			log.info("test :: " + info.toString());
		}
		return new ResponseEntity<>(out_test, HttpStatus.OK);
	}

	// 값에 따른 선택에 의한 전처리 목록 총 갯수 가져오기
	@RequestMapping(value = "/count")
	public PageMaker getPreprocessCount(AI_STAGING staging, PageCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Integer totalCount = 0;
		switch (staging.getStatusFlag()) {
		// 학습 데이터 처리 전
		case 1:
			totalCount = stagingService.selectStagingTrainCnt(staging);
			break;
		// 대상자 데이터 처리 전
		case 2:
			totalCount = stagingService.selectStagingTestCnt(staging);
			break;
		// 학습 데이터 처리 후
		case 3:
			totalCount = stagingService.selectStagingTrainResultCnt(staging);
			break;
		// 대상자 데이터 처리 후
		case 4:
			totalCount = stagingService.selectStagingTestResultCnt(staging);
			break;
		default:
			break;
		}
		pageMaker.setTotalCount(totalCount);
		log.info("$$$$$ 총 목록 수:" + totalCount + ", 디스플레이 페이지:" + pageMaker.getDisplayPageNum() + ", 페이지 총 수:"
				+ pageMaker.getRealEndPage());
		return pageMaker;
	}

	// 전처리 목록 가져오기(다른 방식, 수동에 사용)
	@RequestMapping(value = "/list")
	public List<AI_STAGING> getPreprocessList(AI_STAGING stagingParam, PageCriteria cri) {
		stagingParam.setPage(cri.getPage());
		stagingParam.setPerPageNum(cri.getPerPageNum());
		log.info("$$$$$$페이지:" + cri.getPage() + ", 페이지당 목록 수:" + cri.getPerPageNum());
		List<AI_STAGING> staging = null;
		switch (stagingParam.getStatusFlag()) {
		// 학습 데이터 처리 전
		case 1:
			staging = stagingService.selectStagingTrainList(stagingParam);
			break;
		// 대상자 데이터 처리 전
		case 2:
			staging = stagingService.selectStagingTestList(stagingParam);
			break;
		// 학습 데이터 처리 후
		case 3:
			staging = stagingService.selectStagingTrainResultList(stagingParam);
			break;
		// 대상자 데이터 처리 후
		case 4:
			staging = stagingService.selectStagingTestResultList(stagingParam);
			break;
		default:
			break;
		}
		log.info("$$$$$스테이징 :: " + staging.toString());
		return staging;
	}
}
