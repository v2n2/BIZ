package com.ktds.biz.deal.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("deal")
@NoArgsConstructor
@AllArgsConstructor
public class Deal {
	private List<Deal_sub01> dealList;
	private int cnt;
}
