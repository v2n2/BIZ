package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AIStatistics;

public interface StatisticsMapper {

	List<AIStatistics> selectCamList(AIStatistics vo);
	List<AIStatistics> selectSttModelYList(AIStatistics vo);
	
	AIStatistics selectDTreeAvg(AIStatistics vo);
	
	AIStatistics selectRFavg(AIStatistics vo);
	
	AIStatistics selectSVMavg(AIStatistics vo);
	
	AIStatistics selectLRavg(AIStatistics vo);
	
	AIStatistics selectDNNavg(AIStatistics vo);
}
