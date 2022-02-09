package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_TRAIN_MODEL;
import com.ktds.biz.model.AI_TRAIN_MODEL_FEATURE;
import com.ktds.biz.model.Learning_Info;
import com.ktds.biz.model.Learning_Res;
import com.ktds.biz.service.impl.LearningMapper;

@Service
@Transactional
public class LearningService implements LearningMapper {

	@Autowired
	LearningMapper learningMapper;

	@Override
	public List<Learning_Info> getLearning_info(AI_CAMPAIGN campaign) {
		return learningMapper.getLearning_info(campaign);
	}

	@Override
	public List<Learning_Res> getLearning_res(AI_TRAIN_MODEL in_trian_model) {
		return learningMapper.getLearning_res(in_trian_model);
	}

	@Override
	public List<AI_TRAIN_MODEL_FEATURE> getLearning_feature(AI_CAMPAIGN campaign) {
		return learningMapper.getLearning_feature(campaign);
	}

	@Override
	public List<AI_TRAIN_MODEL> getLearningResultList(String cam_id) {
		return learningMapper.getLearningResultList(cam_id);
	}

	@Override
	public List<Learning_Res> getLearningWeighting(String cam_id, String train_method) {
		return learningMapper.getLearningWeighting(cam_id, train_method);
	}
}
