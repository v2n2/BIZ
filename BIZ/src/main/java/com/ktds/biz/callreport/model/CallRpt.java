package com.ktds.biz.callreport.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CallRpt {
	private List<CallRpt_sub01> calList;
	private int cnt;
}
