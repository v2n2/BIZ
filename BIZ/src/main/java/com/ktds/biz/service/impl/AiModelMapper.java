package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_TRAIN_MODEL;

public interface AiModelMapper {

	/*
	 * Name : 학습데이터 가져오기 (max : 100개)
	 */
	List<AI_TRAIN_MODEL> selectAiTrainModel(String cam_id);
}
