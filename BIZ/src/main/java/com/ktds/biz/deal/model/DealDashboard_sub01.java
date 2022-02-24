package com.ktds.biz.deal.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("dealDashboard")
@NoArgsConstructor
@AllArgsConstructor
public class DealDashboard_sub01 {
	private int value;
	private int cnt;
	private String grp_dtl_cd;
	private String grp_dtl_name;
	private String grp_cd;
	private String biz_type;
}
