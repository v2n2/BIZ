package com.ktds.biz.admin.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("commonCode")
@NoArgsConstructor
@AllArgsConstructor
public class CommonCode {
	String grp_cd;
	String grp_name;
	String grp_desc;
	String del_yn;
	String emp_no;
	int page_st;
	int page_end;
}
