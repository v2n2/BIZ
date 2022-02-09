package com.ktds.biz.epr.service;

import java.util.List;

import com.ktds.biz.epr.model.Epr;
import com.ktds.biz.epr.model.Epr_sub01;

public interface EprMapper {

	Epr selectEpr(Epr_sub01 com);
	List<Epr_sub01> selectEprPage(Epr_sub01 com);

	Epr_sub01 SearchEprDtl(Epr_sub01 com);
	
	void insertEpr(Epr_sub01 deal_sub01);
	void updateEprByNo(Epr_sub01 deal_sub01);
	void deleteEprByNo(Epr_sub01 deal_sub01);
	int selectEprPageNum(Epr_sub01 com);
}
