package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.service.impl.CampaignMapper;

@Service
@Transactional
public class CampaignService implements CampaignMapper {

	@Autowired
	CampaignMapper campaignMapper;

	@Override
	public List<AI_CAMPAIGN> selectCampaignPage(AI_CAMPAIGN campaign) {
		return campaignMapper.selectCampaignPage(campaign);
	}

	@Override
	public int selectCamPageNum(AI_CAMPAIGN campaign) {
		return campaignMapper.selectCamPageNum(campaign);
	}

	@Override
	public AI_CAMPAIGN selectCampaignSeq() {
		return campaignMapper.selectCampaignSeq();
	}

	@Override
	public AI_CAMPAIGN selectCampaignAiStatus(AI_CAMPAIGN campaign) {
		return campaignMapper.selectCampaignAiStatus(campaign);
	}

	@Override
	public void insertCampaign(AI_CAMPAIGN campaign) {
		campaignMapper.insertCampaign(campaign);
	}

	@Override
	public List<AI_CAMPAIGN> selectNewCampaignPage(AI_CAMPAIGN campaign) {
		return campaignMapper.selectNewCampaignPage(campaign);
	}

	@Override
	public int selectCamCount(AI_CAMPAIGN campaign) {
		return campaignMapper.selectCamCount(campaign);
	}

	@Override
	public void updateCampaignTType(AI_CAMPAIGN campaign) {
		campaignMapper.updateCampaignTType(campaign);
	}

	@Override
	public void updateCampaignPType(AI_CAMPAIGN campaign) {
		campaignMapper.updateCampaignPType(campaign);
	}
	@Override
	public void updateCampaignAllType(AI_CAMPAIGN campaign) {
		campaignMapper.updateCampaignAllType(campaign);
	}
	public void insertCampaignFile(AI_CAMPAIGN campaign) {
		campaignMapper.insertCampaignFile(campaign);
		
	}

	@Override
	public void insertCampaignRtype(AI_CAMPAIGN campaign) {
		// TODO Auto-generated method stub
		campaignMapper.insertCampaignRtype(campaign);
	}

	@Override
	public String selectLastOne(AI_CAMPAIGN campaign) {
		return campaignMapper.selectLastOne(campaign);
	}

	@Override
	public AI_CAMPAIGN selectPredictPath(AI_CAMPAIGN campaign) {
		
		return campaignMapper.selectPredictPath(campaign);
	}
	
}
