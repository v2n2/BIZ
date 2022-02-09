package com.ktds.biz.service.impl;

import java.util.List;

import com.ktds.biz.model.AI_BOARD;
import com.ktds.biz.model.AI_PAGE;

public interface BoardMapper {

	List<AI_BOARD> selectAllBoardList();

	List<AI_BOARD> selectBoardList(AI_BOARD board);

	List<AI_BOARD> selectBoardDetail(int code);

	int insertBoard(AI_BOARD board);

	int deleteBoard(int code);

	List<AI_BOARD> selectBoardPage(AI_PAGE page);

	int selectBoardPageNum();

	int updateBoard(AI_BOARD board);
}
