package com.ktds.biz.deal.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("deal_lgr_sub01")
@NoArgsConstructor
@AllArgsConstructor
public class Deal_Lgr_sub01 {
	String deal_lgr_name;
	String deal_lgr_no;
	String rm_emp_no;
	String rm_emp_name;
	String epr_name;
	String epr_no;
	String dbt_type;
	String sub_type;
	String grt_yn;
	String cur_cd;
	String isu_num;
	String tot_isu_amn;
	String isu_date;
	String lead_mgr;
	String pcp_type;
	String contract_date;
	String due_date;
	String due_year;
	String drop_yn;
	String isu_yld;
	String surf_intr_rate;
	String int_pay_mod;
	String coun_amt;
	String sal_pri;
	String conv_pri;
	String war_pri;
	String war_pri_sta_date;
	String war_pri_end_date;
	String cre_rat;
	String desc_text;
	String deal_no;
	String deal_name;
	String emp_name;
	String rgs_emp_no;
	String before_date;
	String after_date;
	int page_st;
	int page_end;
}
