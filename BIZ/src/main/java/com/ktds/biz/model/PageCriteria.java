package com.ktds.biz.model;

public class PageCriteria {
	private int page;				// 페이지 번호
	private int perPageNum;			// 목록당 데이터의 수
	
	public PageCriteria() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 50) {
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getListStart() {
		return ((this.page - 1) * perPageNum) + 1;
	}
	
	public int getListEnd() {
		return this.page * perPageNum;
	}

	@Override
	public String toString() {
		return "PageCriteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
