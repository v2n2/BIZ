package com.ktds.biz.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.admin.model.CommonCode;
import com.ktds.biz.admin.model.CommonDtlCode;
import com.ktds.biz.admin.service.CommonCodeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CommonCodeService implements CommonCodeMapper {
	@Autowired
	CommonCodeMapper commonCodeMapper;

	@Override
	public List<CommonCode> searchCode(CommonCode com) {
		return commonCodeMapper.searchCode(com);
		
	}

	@Override
	public List<CommonDtlCode> searchDtlCode(CommonDtlCode comDtl) {
		return commonCodeMapper.searchDtlCode(comDtl);
		
	}
	@Override
	public List<CommonDtlCode> searchDtlCode2(CommonDtlCode comDtl) {
		return commonCodeMapper.searchDtlCode2(comDtl);
		
	}

	@Override
	public void insertCode(CommonCode com) {
		// TODO Auto-generated method stub
		commonCodeMapper.insertCode(com);
	}

	@Override
	public void insertDtlCode(CommonDtlCode comDtl) {
		// TODO Auto-generated method stub
		commonCodeMapper.insertDtlCode(comDtl);
		
	}

	@Override
	public void updateCode(CommonCode com) {
		// TODO Auto-generated method stub
		commonCodeMapper.updateCode(com);
	}

	@Override
	public void updateDtlCode(CommonDtlCode comDtl) {
		// TODO Auto-generated method stub
		commonCodeMapper.updateDtlCode(comDtl);
	}

	@Override
	public void deleteCode(CommonCode com) {
		CommonDtlCode comDtl = new CommonDtlCode();
		comDtl.setGrp_cd(com.getGrp_cd());
		commonCodeMapper.deleteDtlCode(comDtl);
		commonCodeMapper.deleteCode(com);
		
	}

	@Override
	public void deleteDtlCode(CommonDtlCode comDtl) {
		// TODO Auto-generated method stub
		commonCodeMapper.deleteDtlCode(comDtl);
	}
	
	@Override
	public int selectCommonCodePageNum() {
		return commonCodeMapper.selectCommonCodePageNum();
	}
	
	@Override
	public int selectCommonDtlCodePageNum(CommonDtlCode comDtl) {
		return commonCodeMapper.selectCommonDtlCodePageNum(comDtl);
	}
}
