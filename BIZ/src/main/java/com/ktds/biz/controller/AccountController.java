package com.ktds.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_ACCOUNT;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.AccountService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/account")
public class AccountController {

	@Autowired
	AccountService accountService;

	@RequestMapping(value = "/list")
	public List<AI_ACCOUNT> selectAllAccountList() {
		return accountService.selectAllAccountList();
	}

	@RequestMapping(value = "/detail")
	public List<AI_ACCOUNT> selectAccountDetail(String adm_id) {
		log.info("### selectAccountDetail :: {} ", adm_id);
		return accountService.selectAccountDetail(adm_id);
	}

	@PostMapping(value = "/insert")
	public ResponseEntity<String> insertNewAccount(String inputAdmId, String inputAdmPw, String inputAdmName,
			String inputAdmEmail, String admType, HttpSession session) {
		log.info("### insertNewAccount :: {} {} {} {}", inputAdmId, inputAdmPw, inputAdmName, inputAdmEmail);
		int chk = accountService.selectCheckPK(inputAdmId);
		AI_ACCOUNT account = new AI_ACCOUNT();
		account.setAdm_id(inputAdmId);
		account.setAdm_pw(inputAdmPw);
		account.setAdm_name(inputAdmName);
		account.setAdm_email(inputAdmEmail);
		account.setAdm_type(admType);
		if (chk == 0) {
			int result = accountService.insertAccount(account);
			if (result > 0) {
				return new ResponseEntity<>("OK::등록 성공", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("FAIL::등록 실패", HttpStatus.OK);
			}
		} else {
			return new ResponseEntity<>("PK::중복 등록", HttpStatus.OK);
		}
	}

	@PostMapping(value = "/update")
	public ResponseEntity<Object> updateAccount(String inputAdmId, String inputAdmPw, String inputAdmName,
			String inputAdmEmail, String admType, HttpSession session) {
		AI_ACCOUNT account = new AI_ACCOUNT();
		account.setAdm_id(inputAdmId);
		account.setAdm_pw(inputAdmPw);
		account.setAdm_name(inputAdmName);
		account.setAdm_email(inputAdmEmail);
		account.setAdm_type(admType);
		int result = accountService.updateAccount(account);
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::수정 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::수정 실패", HttpStatus.OK);
		}
		return response;
	}

	@PostMapping(value = "/delete")
	public ResponseEntity<Object> deleteAccount(String user_id, String inputAdmId, HttpSession session) {
		int result = accountService.deleteAccount(inputAdmId);
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::삭제 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::삭제 실패", HttpStatus.OK);
		}
		return response;
	}

	@RequestMapping(value = "/listPage")
	public List<AI_ACCOUNT> getAccountListPage(AI_PAGE account, HttpSession session) {
		return accountService.selectAccountPage(account);
	}

	@RequestMapping(value = "/totalPage")
	public List<String> getTotalAccount(HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = accountService.selectAccountPageNum();
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
}