package com.ktds.biz.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.DashboardChartData;
import com.ktds.biz.service.DashboardChartService;

@RestController
@RequestMapping(value = "/dashboardChart")
public class DashboardChartController {

	@Autowired
	private DashboardChartService dashboardChartService;

	@RequestMapping(value = "total")
	public DashboardChartData selectTotal(@RequestParam(required = false) String pers, HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		return dashboardChartService.selectTotal(baseData);
	}

	@RequestMapping(value = "type")
	public List<DashboardChartData> selectType(@RequestParam(required = false) String pers,
			@RequestParam(required = false) String type, HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		if (type != null) {
			baseData.put("type", type);
		}
		return dashboardChartService.selectType(baseData);
	}

	@RequestMapping(value = "period")
	public List<DashboardChartData> selectPeriod(@RequestParam(required = false) String pers,
			@RequestParam(required = false) String period, @RequestParam(required = false) String periodBase,
			HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (period != null) {
			baseData.put("period", period);
		}
		if (periodBase != null) {
			baseData.put("periodBase", periodBase);
		}
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		return dashboardChartService.selectPeriod(baseData);
	}

	@RequestMapping(value = "campaign")
	public List<DashboardChartData> selectCampaign(@RequestParam(required = false) String pers,
			@RequestParam(required = false) String campaign, HttpSession session) {
		HashMap<String, Object> baseData = new HashMap<>();
		if (pers != null) {
			baseData.put("sessionID", (String) session.getAttribute("sessionID"));
		}
		if (campaign != null) {
			baseData.put("campaign", campaign);
		}
		return dashboardChartService.selectCampaign(baseData);
	}
}
