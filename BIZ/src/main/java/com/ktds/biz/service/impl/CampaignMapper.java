package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_CAMPAIGN;

public interface CampaignMapper {

	/*
	 * Name : 캠페인 정보 검색
	 */
	List<AI_CAMPAIGN> selectCampaignPage(AI_CAMPAIGN campaign);

	/*
	 * Name : 캠페인 정보 검색
	 */
	int selectCamPageNum(AI_CAMPAIGN campaign);

	/*
	 * Name : 캠페인 SEQ 가져오기
	 */
	AI_CAMPAIGN selectCampaignSeq();

	/*
	 * Name : 캠페인 정보 검색
	 */
	AI_CAMPAIGN selectCampaignAiStatus(AI_CAMPAIGN campaign);
	/*
	 * Name : 최신 한 건에 대한 캠페인 id 조회
	 */
	String selectLastOne(AI_CAMPAIGN campaign);
	/*
	 * Name : 파라메터 입력받는 캠페인 정보 검색
	 */
	List<AI_CAMPAIGN> selectNewCampaignPage(AI_CAMPAIGN campaign);

	/*
	 * Name : 파라메터 입력받는 캠페인 총 갯수
	 */
	int selectCamCount(AI_CAMPAIGN campaign);

	/*
	 * Name : 캠페인 Insert
	 */
	void insertCampaign(AI_CAMPAIGN campaign);

	/*
	 * Name : 캠페인 Update
	 */
	void updateCampaignTType(AI_CAMPAIGN campaign);
	void updateCampaignPType(AI_CAMPAIGN campaign);
	void updateCampaignAllType(AI_CAMPAIGN campaign);
	/*
	 * Name : 캠페인 Update
	 */
	void insertCampaignRtype(AI_CAMPAIGN campaign);
	
	/*
	 * Name : 캠페인파일 정보 Insert
	 */
	void insertCampaignFile(AI_CAMPAIGN campaign);
	
	/*
	 * Name : 캠페인 예측 경로 가져오기
	 */
	AI_CAMPAIGN selectPredictPath(AI_CAMPAIGN campaign);

	
}
