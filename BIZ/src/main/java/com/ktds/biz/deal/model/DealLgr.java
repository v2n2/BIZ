package com.ktds.biz.deal.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("deallgr")
@NoArgsConstructor
@AllArgsConstructor
public class DealLgr {
	private List<Deal_Lgr_sub01> lgrList;
	private int cnt;
}
