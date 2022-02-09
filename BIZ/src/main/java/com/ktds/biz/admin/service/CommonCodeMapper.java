package com.ktds.biz.admin.service;

import java.util.List;

import com.ktds.biz.admin.model.CommonCode;
import com.ktds.biz.admin.model.CommonDtlCode;

public interface CommonCodeMapper {

	List<CommonCode> searchCode(CommonCode com);

	List<CommonDtlCode> searchDtlCode(CommonDtlCode comDtl);
	List<CommonDtlCode> searchDtlCode2(CommonDtlCode comDtl);
	
	void insertCode(CommonCode com);
	void insertDtlCode(CommonDtlCode comDtl);
	void updateCode(CommonCode com);
	void updateDtlCode(CommonDtlCode comDtl);
	void deleteCode(CommonCode com);
	void deleteDtlCode(CommonDtlCode comDtl);
	int selectCommonCodePageNum();
	int selectCommonDtlCodePageNum(CommonDtlCode comDtl);
}
