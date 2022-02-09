package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.biz.model.AIStatistics;
import com.ktds.biz.service.impl.StatisticsMapper;

@Service
public class StatisticsService implements StatisticsMapper {

	@Autowired
	StatisticsMapper statisticsMapper;

	@Override
	public List<AIStatistics> selectSttModelYList(AIStatistics vo) {
		return statisticsMapper.selectSttModelYList(vo);
	}

	@Override
	public AIStatistics selectDTreeAvg(AIStatistics vo) {
		return statisticsMapper.selectDTreeAvg(vo);
	}

	@Override
	public AIStatistics selectRFavg(AIStatistics vo) {
		return statisticsMapper.selectRFavg(vo);
	}

	@Override
	public AIStatistics selectSVMavg(AIStatistics vo) {
		return statisticsMapper.selectSVMavg(vo);
	}

	@Override
	public AIStatistics selectLRavg(AIStatistics vo) {
		return statisticsMapper.selectLRavg(vo);
	}
	
	@Override
	public AIStatistics selectDNNavg(AIStatistics vo) {
		return statisticsMapper.selectDNNavg(vo);
	}

	@Override
	public List<AIStatistics> selectCamList(AIStatistics vo) {
		return statisticsMapper.selectCamList(vo);
	}
	
}
