package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.model.AI_STAGING;

public interface StagingMapper {

	/*
	 * 학습데이터나 대상데이터의 총 갯수 가져오기
	 */
	Integer selectStagingTrainCnt(AI_STAGING staging);

	Integer selectStagingTrainResultCnt(AI_STAGING staging);

	Integer selectStagingTestCnt(AI_STAGING staging);

	Integer selectStagingTestResultCnt(AI_STAGING staging);

	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrain(AI_PAGE page);

	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTrainResult(AI_PAGE page);

	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTest(AI_PAGE page);

	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectStaginTestResult(AI_PAGE page);

	/*
	 * Name : 학습전처리완료데이터 가져오기 (max : 100개)
	 */
	List<AI_STAGING> selectTestPredict(AI_PAGE page);

	/*
	 * 수동 전처리 가져오기
	 */
	List<AI_STAGING> selectStagingTrainList(AI_STAGING staging);

	List<AI_STAGING> selectStagingTrainResultList(AI_STAGING staging);

	List<AI_STAGING> selectStagingTestList(AI_STAGING staging);

	List<AI_STAGING> selectStagingTestResultList(AI_STAGING staging);
}
