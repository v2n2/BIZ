package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_ACCOUNT;
import com.ktds.biz.model.AI_PAGE;

public interface AccountMapper {

	List<AI_ACCOUNT> selectAllAccountList();

	List<AI_ACCOUNT> selectAccountList(AI_ACCOUNT account);

	int insertAccount(AI_ACCOUNT account);

	int updateAccount(AI_ACCOUNT account);

	List<AI_ACCOUNT> selectAccountDetail(String adm_id);

	int deleteAccount(String adm_id);

	List<AI_ACCOUNT> selectAccountPage(AI_PAGE page);

	int selectAccountPageNum();

	int selectCheckPK(String adm_id);
}
