package com.ktds.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktds.biz.model.AI_NOTICE;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.service.impl.NoticeMapper;

@Service
@Transactional
public class NoticeService implements NoticeMapper {

	@Autowired
	NoticeMapper noticeBoardMapper;

	@Override
	public List<AI_NOTICE> selectAllNoticeList() {
		return noticeBoardMapper.selectAllNoticeList();
	}

	@Override
	public List<AI_NOTICE> selectNoticeList(AI_NOTICE notice) {
		return noticeBoardMapper.selectNoticeList(notice);
	}

	@Override
	public List<AI_NOTICE> selectNoticeDetail(int code) {
		return noticeBoardMapper.selectNoticeDetail(code);
	}

	@Override
	public int insertNotice(AI_NOTICE notice) {
		return noticeBoardMapper.insertNotice(notice);
	}

	@Override
	public int deleteNotice(int code) {
		return noticeBoardMapper.deleteNotice(code);
	}

	@Override
	public List<AI_NOTICE> selectNoticePage(AI_PAGE page) {
		return noticeBoardMapper.selectNoticePage(page);
	}

	@Override
	public int selectNoticePageNum() {
		return noticeBoardMapper.selectNoticePageNum();
	}

	@Override
	public int updateNotice(AI_NOTICE notice) {
		return noticeBoardMapper.updateNotice(notice);
	}
}