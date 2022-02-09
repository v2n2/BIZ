package com.ktds.biz.callreport.service;

import java.util.List;

import com.ktds.biz.callreport.model.CallRpt;
import com.ktds.biz.callreport.model.CallRpt_sub01;
import com.ktds.biz.deal.model.Deal_sub01;

public interface CallRptMapper {
	int selectRptCount(CallRpt_sub01 rpt);

	CallRpt selectRpt(CallRpt_sub01 rpt);
	CallRpt_sub01 selectRptDetail(String rptNo);
	List<CallRpt_sub01> selectRptList(CallRpt_sub01 rpt);
	void insertRpt(CallRpt_sub01 rptNo);
	void updateRptByNo(CallRpt_sub01 rpt);
	void deleteRptByNo(String rptNo);
}
