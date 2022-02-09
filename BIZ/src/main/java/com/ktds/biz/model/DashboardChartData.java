package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("chartData")
@NoArgsConstructor
@AllArgsConstructor
public class DashboardChartData {
	private int dataType;
	private String totalBase;
	private String baseValue;
	private int totalCount;
	private float totalOriginal;
	private float totalSo;
	private float totalReal;
	private float totalAi;
}
