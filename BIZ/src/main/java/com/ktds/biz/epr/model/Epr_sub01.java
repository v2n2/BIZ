package com.ktds.biz.epr.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("epr_sub01")
@NoArgsConstructor
@AllArgsConstructor
public class Epr_sub01 {
	String epr_no;
	String epr_type_name;
	String epr_name;
	String epr_rep_name;
	String epr_tel_no;
	String epr_biz_type_cd;
	String epr_addr;
	String bse_dt;
	String biz_num;
	String bse_emp_no;
	String bse_emp_nm;
	String epr_biz_type_cd_nm;
	String corp_regist_num;
	int page_st;
	int page_end;
}
