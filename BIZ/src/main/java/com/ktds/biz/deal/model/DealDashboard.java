package com.ktds.biz.deal.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.ktds.biz.admin.model.CommonDtlCode;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("dealDashboard")
@NoArgsConstructor
@AllArgsConstructor
public class DealDashboard {
	private List<Deal_sub01> dealList;
	private List<DealDashboard_sub01> dealDashboardList;
}
