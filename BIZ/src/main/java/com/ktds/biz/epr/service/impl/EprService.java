package com.ktds.biz.epr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.epr.model.Epr;
import com.ktds.biz.epr.model.Epr_sub01;
import com.ktds.biz.epr.service.EprMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EprService implements EprMapper {
	@Autowired
	EprMapper eprMapper;
	
	@Override
	public void insertEpr(Epr_sub01 epr_sub01) {
		// TODO Auto-generated method stub
		eprMapper.insertEpr(epr_sub01);
	}

	@Override
	public void updateEprByNo(Epr_sub01 epr_sub01) {
		// TODO Auto-generated method stub
		eprMapper.updateEprByNo(epr_sub01);
	}

	@Override
	public void deleteEprByNo(Epr_sub01 epr_sub01) {
		// TODO Auto-generated method stub
		eprMapper.deleteEprByNo(epr_sub01);
	}

	@Override
	public Epr selectEpr(Epr_sub01 com) {
		// TODO Auto-generated method stub
		Epr rtn = new Epr();
		rtn.setCnt(selectEprPageNum(com));
		log.info("cnt>>>>>>>>>>>>>"+rtn.getCnt());
		log.info("page_end>>>>>>>>>>>>>"+com.getPage_end());
		log.info("page_st>>>>>>>>>>>>>"+com.getPage_st());
		//if(rtn.getCnt()>0) {
			rtn.setEprList(eprMapper.selectEprPage(com)); 
		//}
		
		return rtn;
	}

	@Override
	public List<Epr_sub01> selectEprPage(Epr_sub01 com) {
		// TODO Auto-generated method stub
		return eprMapper.selectEprPage(com);
	}

	@Override
	public int selectEprPageNum(Epr_sub01 com) {
		// TODO Auto-generated method stub
		return eprMapper.selectEprPageNum(com);
	}

	@Override
	public Epr_sub01 SearchEprDtl(Epr_sub01 com) {
		
		return eprMapper.SearchEprDtl(com);
	}
	

}
