package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.biz.model.AI_BOARD;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.impl.BoardMapper;

@Service("BoardService")
public class BoardService implements BoardMapper {

	@Autowired
	BoardMapper boardmapper;

	@Override
	public List<AI_BOARD> selectAllBoardList() {
		return boardmapper.selectAllBoardList();
	}

	@Override
	public List<AI_BOARD> selectBoardList(AI_BOARD board) {
		return boardmapper.selectBoardList(board);
	}

	@Override
	public List<AI_BOARD> selectBoardDetail(int code) {
		return boardmapper.selectBoardDetail(code);
	}

	@Override
	public int insertBoard(AI_BOARD board) {
		return boardmapper.insertBoard(board);
	}

	@Override
	public int deleteBoard(int code) {
		return boardmapper.deleteBoard(code);
	}

	@Override
	public List<AI_BOARD> selectBoardPage(AI_PAGE page) {
		return boardmapper.selectBoardPage(page);
	}

	@Override
	public int selectBoardPageNum() {
		return boardmapper.selectBoardPageNum();
	}

	@Override
	public int updateBoard(AI_BOARD board) {
		return boardmapper.updateBoard(board);
	}
}
