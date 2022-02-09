package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_STAGING;
import com.ktds.biz.service.impl.PretreatmentMapper;

@Service
@Transactional
public class PretreatmentService implements PretreatmentMapper {

	@Autowired
	PretreatmentMapper pretreatmentMapper;

	@Override
	public List<AI_CAMPAIGN> selectAllcampaign() {
		return pretreatmentMapper.selectAllcampaign();
	}

	@Override
	public List<AI_CAMPAIGN> selectCampaign(AI_CAMPAIGN campaign) {
		return pretreatmentMapper.selectCampaign(campaign);
	}

	@Override
	public List<AI_STAGING> selectStaginTrain(AI_CAMPAIGN campaign) {
		return pretreatmentMapper.selectStaginTrain(campaign);
	}

	@Override
	public List<AI_STAGING> selectStaginTrainResult(AI_CAMPAIGN campaign) {
		return pretreatmentMapper.selectStaginTrainResult(campaign);
	}
}
