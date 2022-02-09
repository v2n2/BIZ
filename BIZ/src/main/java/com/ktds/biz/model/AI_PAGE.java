package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("page")
@NoArgsConstructor
@AllArgsConstructor
public class AI_PAGE{
	private String page;
	private String page_st;
	private String page_end;
	private String cam_id;
	private String succVal;
	private String totalVal;
}
