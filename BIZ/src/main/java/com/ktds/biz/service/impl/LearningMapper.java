package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_TRAIN_MODEL;
import com.ktds.biz.model.AI_TRAIN_MODEL_FEATURE;
import com.ktds.biz.model.Learning_Info;
import com.ktds.biz.model.Learning_Res;

public interface LearningMapper {

	/*
	 * Name : 학습데이터 검색
	 */
	List<Learning_Info> getLearning_info(AI_CAMPAIGN campaign);

	List<Learning_Res> getLearning_res(AI_TRAIN_MODEL in_trian_model);

	List<AI_TRAIN_MODEL_FEATURE> getLearning_feature(AI_CAMPAIGN campaign);

	/*
	 * Name : 학습데이터 결과 및 중요도(조인 안 한 단순 목록 조회, 쓸데없이 조인하면 성능 떨어짐)
	 */
	List<AI_TRAIN_MODEL> getLearningResultList(String cam_id);

	List<Learning_Res> getLearningWeighting(String cam_id, String train_method);
}
