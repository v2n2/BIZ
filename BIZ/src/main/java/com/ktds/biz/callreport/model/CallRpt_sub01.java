package com.ktds.biz.callreport.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("CallRpt")
@NoArgsConstructor
@AllArgsConstructor
public class CallRpt_sub01 {
	private String rpt_no;
	private String rpt_name;
	private String rpt_type;
	private String rpt_type_name;
	private String biz_type;
	private String conn_per_type;
	private String biz_dt;
	private String inv_obj;
	private String tobe_desc;
	private String sug_desc;
	private String cus_desc;
	private String biz_etc_desc;
	private String before_date;
	private String after_date;
	private String biz_sta_date;
	private String biz_end_date;
	private String bse_emp_no;
	private String bse_emp_name;
	private String emp_no;
	private String epr_no;
	private String epr_name;
	private String moc_no;
	private String moc_name;
	private String emp_name;
	private String dept_name;
	private String bse_dt;
	
}
