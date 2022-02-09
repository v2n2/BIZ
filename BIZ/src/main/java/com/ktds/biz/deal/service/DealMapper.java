package com.ktds.biz.deal.service;

import java.util.List;

import com.ktds.biz.deal.model.Deal;
import com.ktds.biz.deal.model.DealLgr;
import com.ktds.biz.deal.model.Deal_Lgr_sub01;
import com.ktds.biz.deal.model.Deal_sub01;

public interface DealMapper {

	Deal selectDeal(Deal_sub01 com);
	List<Deal_sub01> selectDealPage(Deal_sub01 com);

	Deal_sub01 SearchDealDtl(Deal_sub01 com);
	
	void insertDeal(Deal_sub01 deal_sub01);
	void updateDealByNo(Deal_sub01 deal_sub01);
	void deleteDealByNo(Deal_sub01 deal_sub01);
	int selectDealPageNum(Deal_sub01 com);
	
	DealLgr selectLgr(Deal_Lgr_sub01 com);
	List<Deal_Lgr_sub01> selectLgrPage(Deal_Lgr_sub01 com);

	Deal_Lgr_sub01 SearchLgrDtl(Deal_Lgr_sub01 com);
	
	void insertLgr(Deal_Lgr_sub01 deal_sub01);
	void updateLgrByNo(Deal_Lgr_sub01 deal_sub01);
	void deleteLgrByNo(Deal_Lgr_sub01 deal_sub01);
	int selectLgrPageNum(Deal_Lgr_sub01 com);
}
