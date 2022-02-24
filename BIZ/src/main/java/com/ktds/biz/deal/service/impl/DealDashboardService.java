package com.ktds.biz.deal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.deal.model.Deal;
import com.ktds.biz.deal.model.DealDashboard_sub01;
import com.ktds.biz.deal.model.DealLgr;
import com.ktds.biz.deal.model.Deal_Lgr_sub01;
import com.ktds.biz.deal.model.Deal_sub01;
import com.ktds.biz.deal.service.DealDashboardMapper;
import com.ktds.biz.deal.service.DealMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class DealDashboardService implements DealDashboardMapper {
	@Autowired
	DealDashboardMapper dealDashboardMapper;

	@Override
	public List<DealDashboard_sub01> searchDealDashboard(DealDashboard_sub01 com) {
		// TODO Auto-generated method stub
		return dealDashboardMapper.searchDealDashboard(com);
	}
	
	

}
