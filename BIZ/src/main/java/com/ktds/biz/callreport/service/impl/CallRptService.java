package com.ktds.biz.callreport.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ktds.biz.callreport.model.CallRpt;
import com.ktds.biz.callreport.model.CallRpt_sub01;
import com.ktds.biz.callreport.service.CallRptMapper;
import com.ktds.biz.deal.model.Deal_sub01;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CallRptService implements CallRptMapper {
	@Autowired
	CallRptMapper callRptMapper;

	@Override
	public int selectRptCount(CallRpt_sub01 rpt) {
		// TODO Auto-generated method stub
		log.info(rpt.getRpt_name());
		//
		StringUtils.isEmpty(rpt.getRpt_name());
		int rtn = callRptMapper.selectRptCount(rpt);
		log.info(""+rtn);
		return rtn;
	}

	@Override
	public CallRpt selectRpt(CallRpt_sub01 rpt) {
		// TODO Auto-generated method stub
		CallRpt rtn = new CallRpt();
		log.info("rpt>>>>>>>>>>>>>"+rpt.getBefore_date());
		log.info("rpt>>>>>>>>>>>>>"+rpt.getAfter_date());
		log.info("rpt>>>>>>>>>>>>>"+rpt.getBiz_sta_date());
		log.info("rpt>>>>>>>>>>>>>"+rpt.getBiz_end_date());
		rtn.setCnt(selectRptCount(rpt));
		log.info("rpt>>>>>>>>>>>>>"+rtn.getCnt());
		//if(rtn.getCnt()>0) {
			rtn.setCalList(callRptMapper.selectRptList(rpt)); 
		//}
		
		return rtn;
	}
	
	@Override
	public CallRpt_sub01 selectRptDetail(String rptNo) {
		// TODO Auto-generated method stub
	
		log.info("rpt>>>>>>>>>>>>>"+rptNo);
		//if(rtn.getCnt()>0) {
			 
		//}
		
		return callRptMapper.selectRptDetail(rptNo);
	}

	@Override
	public void insertRpt(CallRpt_sub01 rptNo) {
		// TODO Auto-generated method stub
		callRptMapper.insertRpt(rptNo);
		
	}

	@Override
	public void updateRptByNo(CallRpt_sub01 rptNo) {
		// TODO Auto-generated method stub
		callRptMapper.updateRptByNo(rptNo);
	}

	@Override
	public void deleteRptByNo(String rptNo) {
		// TODO Auto-generated method stub
		callRptMapper.deleteRptByNo(rptNo);
	}

	@Override
	public List<CallRpt_sub01> selectRptList(CallRpt_sub01 rpt) {
		// TODO Auto-generated method stub
		return callRptMapper.selectRptList(rpt);
	}

}
