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

import com.ktds.biz.model.AI_BOARD;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.BoardService;

@RestController
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/list")
	public List<AI_BOARD> selectAllBoardList() {
		List<AI_BOARD> list = boardService.selectAllBoardList();
		return list;
	}

	@RequestMapping(value = "/detail")
	public List<AI_BOARD> selectBoardDetail(int code) {
		return boardService.selectBoardDetail(code);
	}

	@PostMapping(value = "/insert")
	public ResponseEntity<String> insertNewBoard(String user_id, String inputBoardName, String inputBoardDesc,
			HttpSession session) {
		AI_BOARD board = new AI_BOARD();
		board.setWriter(user_id);
		board.setTitle(inputBoardName);
		board.setContents(inputBoardDesc);
		int result = boardService.insertBoard(board);
		if (result > 0) {
			return new ResponseEntity<>("OK::등록 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("FAIL::등록 실패", HttpStatus.OK);
		}
	}

	@PostMapping(value = "/update")
	public ResponseEntity<String> updateBoard(int boardCode, String inputBoardName, String inputBoardDesc,
			HttpSession session) {
		AI_BOARD board = new AI_BOARD();
		board.setCode(boardCode + "");
		board.setTitle(inputBoardName);
		board.setContents(inputBoardDesc);
		int result = boardService.updateBoard(board);
		if (result > 0) {
			return new ResponseEntity<>("OK::수정 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("FAIL::수정 실패", HttpStatus.OK);
		}
	}

	@PostMapping(value = "/delete")
	public ResponseEntity<String> deleteBoard(String user_id, int boardCode, HttpSession session) {
		int result = boardService.deleteBoard(boardCode);
		if (result > 0) {
			return new ResponseEntity<>("OK::삭제 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("FAIL::삭제 실패", HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/listPage")
	public List<AI_BOARD> getBoardListPage(AI_PAGE board, HttpSession session) {
		return boardService.selectBoardPage(board);
	}

	@RequestMapping(value = "/totalPage")
	public List<String> getTotalBoard(HttpSession session) {
		List<String> response = new ArrayList<>();
		int maxRowNum = boardService.selectBoardPageNum();
		if (maxRowNum == 0) {
			response.add("0");
		} else {
			response.add(maxRowNum + "");
		}
		return response;
	}
}