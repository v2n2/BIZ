package com.ktds.biz.deal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.deal.model.Deal;
import com.ktds.biz.deal.model.DealLgr;
import com.ktds.biz.deal.model.Deal_Lgr_sub01;
import com.ktds.biz.deal.model.Deal_sub01;
import com.ktds.biz.deal.service.DealMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class DealService implements DealMapper {
	@Autowired
	DealMapper dealMapper;
	
	@Override
	public void insertDeal(Deal_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.insertDeal(deal_sub01);
	}

	@Override
	public void updateDealByNo(Deal_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.updateDealByNo(deal_sub01);
	}

	@Override
	public void deleteDealByNo(Deal_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.deleteDealByNo(deal_sub01);
	}

	@Override
	public Deal selectDeal(Deal_sub01 com) {
		// TODO Auto-generated method stub
		Deal rtn = new Deal();
		log.info("deal>>>>>>>>>>>>>"+com.getBefore_date());
		log.info("deal>>>>>>>>>>>>>"+com.getAfter_date());
		rtn.setCnt(selectDealPageNum(com));
		log.info("deal>>>>>>>>>>>>>"+rtn.getCnt());
		log.info("deal>>>>>>>>>>>>>"+com.getPage_end());
		log.info("deal>>>>>>>>>>>>>"+com.getPage_st());
		//if(rtn.getCnt()>0) {
			rtn.setDealList(dealMapper.selectDealPage(com)); 
		//}
		
		return rtn;
	}

	@Override
	public List<Deal_sub01> selectDealPage(Deal_sub01 com) {
		// TODO Auto-generated method stub
		return dealMapper.selectDealPage(com);
	}

	@Override
	public int selectDealPageNum(Deal_sub01 com) {
		// TODO Auto-generated method stub
		return dealMapper.selectDealPageNum(com);
	}

	@Override
	public Deal_sub01 SearchDealDtl(Deal_sub01 com) {
		
		return dealMapper.SearchDealDtl(com);
	}
	public void insertLgr(Deal_Lgr_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.insertLgr(deal_sub01);
	}

	@Override
	public void updateLgrByNo(Deal_Lgr_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.updateLgrByNo(deal_sub01);
	}

	@Override
	public void deleteLgrByNo(Deal_Lgr_sub01 deal_sub01) {
		// TODO Auto-generated method stub
		dealMapper.deleteLgrByNo(deal_sub01);
	}

	@Override
	public DealLgr selectLgr(Deal_Lgr_sub01 com) {
		// TODO Auto-generated method stub
		DealLgr rtn = new DealLgr();
		log.info("deal>>>>>>>>>>>>>"+com.getBefore_date());
		log.info("deal>>>>>>>>>>>>>"+com.getAfter_date());
		rtn.setCnt(selectLgrPageNum(com));
		log.info("deal>>>>>>>>>>>>>"+rtn.getCnt());
		log.info("deal>>>>>>>>>>>>>"+com.getPage_end());
		log.info("deal>>>>>>>>>>>>>"+com.getPage_st());
		//if(rtn.getCnt()>0) {
			rtn.setLgrList(dealMapper.selectLgrPage(com)); 
		//}
		
		return rtn;
	}

	@Override
	public List<Deal_Lgr_sub01> selectLgrPage(Deal_Lgr_sub01 com) {
		// TODO Auto-generated method stub
		return dealMapper.selectLgrPage(com);
	}

	@Override
	public int selectLgrPageNum(Deal_Lgr_sub01 com) {
		// TODO Auto-generated method stub
		return dealMapper.selectLgrPageNum(com);
	}

	@Override
	public Deal_Lgr_sub01 SearchLgrDtl(Deal_Lgr_sub01 com) {
		
		return dealMapper.SearchLgrDtl(com);
	}

	@Override
	public List<Deal_sub01> searchAllDeal(Deal_sub01 com) {
		return dealMapper.searchAllDeal(com);
	}

}
