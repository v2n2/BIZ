package com.ktds.biz.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.DashboardChartData;
import com.ktds.biz.service.impl.DashboardChartMapper;

@Service
@Transactional
public class DashboardChartService implements DashboardChartMapper {

	@Autowired
	DashboardChartMapper dashboardChartMapper;

	// 전체 데이터 통계
	@Override
	public DashboardChartData selectTotal(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectTotal(baseData);
	}

	// 산업군별 데이터 통계
	@Override
	public List<DashboardChartData> selectType(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectType(baseData);
	}

	// 기간별 데이터 통계
	@Override
	public List<DashboardChartData> selectPeriod(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectPeriod(baseData);
	}

	// 캠페인별 데이터 통계
	@Override
	public List<DashboardChartData> selectCampaign(HashMap<String, Object> baseData) {
		return dashboardChartMapper.selectCampaign(baseData);
	}
}