package com.ktds.biz.service.impl;

import java.util.HashMap;
import java.util.List;

import com.ktds.biz.model.DashboardChartData;

public interface DashboardChartMapper {

	// 전체 데이터 통계
	DashboardChartData selectTotal(HashMap<String, Object> baseData);

	// 산업군별 데이터 통계
	List<DashboardChartData> selectType(HashMap<String, Object> baseData);

	// 기간별 데이터 통계
	List<DashboardChartData> selectPeriod(HashMap<String, Object> baseData);

	// 캠페인별 데이터 통계
	List<DashboardChartData> selectCampaign(HashMap<String, Object> baseData);
}
