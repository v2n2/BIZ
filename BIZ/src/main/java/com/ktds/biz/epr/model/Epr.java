package com.ktds.biz.epr.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("epr")
@NoArgsConstructor
@AllArgsConstructor
public class Epr {
	private List<Epr_sub01> eprList;
	private int cnt;
}
