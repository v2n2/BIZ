package com.ktds.biz.deal.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("deal_sub01")
@NoArgsConstructor
@AllArgsConstructor
public class Deal_sub01 {
	String deal_no;
	String deal_type;
	String deal_type_name;
	String deal_name;
	String biz_type;
	String biz_type_name;
	String proc_type;
	String proc_name;
	String bse_dt;
	String con_dt;
	String end_dt;
	String deal_proc_per;
	String exp_pri;
	String exp_rev;
	String deal_souc;
	String emp_name;
	String dept_name;
	String rgs_emp_no;
	String drop_yn;
	String before_date;
	String after_date;
	String epr_no;
	String epr_name;
	int page_st;
	int page_end;
}
