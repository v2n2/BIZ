package com.ktds.biz.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.biz.model.AI_ACCOUNT;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.impl.AccountMapper;

@Service("AccountService")
public class AccountService implements AccountMapper{
 
	@Autowired
	AccountMapper accountmapper;
	
	@Override
	public List<AI_ACCOUNT> selectAllAccountList() { 
		return accountmapper.selectAllAccountList();
	} 

	@Override
	public List<AI_ACCOUNT> selectAccountList(AI_ACCOUNT account) {
		return accountmapper.selectAccountList(account);
	}
	
	@Override
	public List<AI_ACCOUNT> selectAccountDetail(String adm_id) {
		return accountmapper.selectAccountDetail(adm_id);
	}

	@Override
	public int insertAccount(AI_ACCOUNT account) {
		return accountmapper.insertAccount(account);
	}

	@Override
	public int deleteAccount(String adm_id) {
		return accountmapper.deleteAccount(adm_id);
	}

	@Override
	public List<AI_ACCOUNT> selectAccountPage(AI_PAGE page) {
		return accountmapper.selectAccountPage(page);
	}

	@Override
	public int selectAccountPageNum() {
		return accountmapper.selectAccountPageNum();
	}

	@Override
	public int updateAccount(AI_ACCOUNT account) {
		return accountmapper.updateAccount(account);
	}

	@Override
	public int selectCheckPK(String adm_id) {
		return accountmapper.selectCheckPK(adm_id);
	}
}
