package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_TRAIN_MODEL;
import com.ktds.biz.service.impl.AiModelMapper;

@Service
@Transactional
public class AiModelService implements AiModelMapper {

	@Autowired
	AiModelMapper aiModelMapper;

	@Override
	public List<AI_TRAIN_MODEL> selectAiTrainModel(String cam_id) {
		return aiModelMapper.selectAiTrainModel(cam_id);
	}
}
