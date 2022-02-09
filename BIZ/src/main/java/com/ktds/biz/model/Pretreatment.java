package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("pretreatment")
@NoArgsConstructor
@AllArgsConstructor
public class Pretreatment{
	private String cam_id;
	private String name;
	private String gender;
	private String age;
	private String iptv_com_fig;
	private String non_pay_flg;
	private String internet_join_flg;
	private String mem_grade;
	private String agree_flg;
	private String res_1;
}
