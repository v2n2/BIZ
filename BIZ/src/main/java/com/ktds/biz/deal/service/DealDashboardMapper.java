package com.ktds.biz.deal.service;

import java.util.List;

import com.ktds.biz.deal.model.Deal;
import com.ktds.biz.deal.model.DealDashboard_sub01;
import com.ktds.biz.deal.model.DealLgr;
import com.ktds.biz.deal.model.Deal_Lgr_sub01;
import com.ktds.biz.deal.model.Deal_sub01;

public interface DealDashboardMapper {

	List<DealDashboard_sub01> searchDealDashboard(DealDashboard_sub01 com);
}
