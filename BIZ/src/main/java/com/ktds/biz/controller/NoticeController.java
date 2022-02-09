package com.ktds.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AI_NOTICE;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.NoticeService;

@RestController
@RequestMapping(value = "/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@RequestMapping(value = "/list")
	public List<AI_NOTICE> selectAllNoticeList() {
		return noticeService.selectAllNoticeList();
	}

	@RequestMapping(value = "/detail")
	public List<AI_NOTICE> selectNoticeDetail(int code) {
		return noticeService.selectNoticeDetail(code);
	}

	@PostMapping(value = "/insert")
	public ResponseEntity<Object> insertNewNotice(String user_id, String inputNoticeName, String inputNoticeDesc,
			HttpSession session) {
		AI_NOTICE notice = new AI_NOTICE();
		notice.setTitle(inputNoticeName);
		notice.setContents(inputNoticeDesc);
		notice.setWriter(user_id);
		int result = noticeService.insertNotice(notice);
		ResponseEntity<Object> response = null;
		if (result > 0) {
			response = new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		} else {
			response = new ResponseEntity<Object>("FAIL::등록 실패", HttpStatus.OK);
		}
		return response;
	}

	@PostMapping(value = "/update")
	public ResponseEntity<String> updateNewNotice(int noticeCode, String inputNoticeName, String inputNoticeDesc,
			HttpSession session) {
		AI_NOTICE notice = new AI_NOTICE();
		notice.setTitle(inputNoticeName);
		notice.setContents(inputNoticeDesc);
		notice.setCode(noticeCode + "");
		int result = noticeService.updateNotice(notice);
		if (result > 0) {
			return new ResponseEntity<>("OK::수정 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("FAIL::수정 실패", HttpStatus.OK);
		}
	}

	@PostMapping(value = "/delete")
	public ResponseEntity<String> deleteNotice(String user_id, int noticeCode, HttpSession session) {
		int result = noticeService.deleteNotice(noticeCode);
		if (result > 0) {
			return new ResponseEntity<>("OK::삭제 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("FAIL::삭제 실패", HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/listPage")
	public List<AI_NOTICE> getNoticeListPage(AI_PAGE notice, HttpSession session) {
		return noticeService.selectNoticePage(notice);
	}

	@RequestMapping(value = "/totalPage")
	public List<String> getTotalNotice(HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = noticeService.selectNoticePageNum();
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
}
