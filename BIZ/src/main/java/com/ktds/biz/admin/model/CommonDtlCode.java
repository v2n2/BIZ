package com.ktds.biz.admin.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("commonDtlCode")
@NoArgsConstructor
@AllArgsConstructor
public class CommonDtlCode {
	String grp_cd;
	String grp_dtl_cd;
	String grp_dtl_name;
	String grp_dtl_desc;
	String del_yn;
	String emp_no;
	int page_st;
	int page_end;
}
