package com.ktds.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AIStatistics;
import com.ktds.biz.service.StatisticsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/statistics")
public class StatisticsController {

	@Autowired
	StatisticsService statisticsService;

	// 캠페인 조회
		@RequestMapping(value = "/camlist")
		public List<AIStatistics> selectCamList(@RequestParam(required = false) String camName,
				@RequestParam(required = false) String camType, @RequestParam(required = false) String camStatus,
				@RequestParam(required = false) String beforeDate, @RequestParam(required = false) String afterDate,
				@RequestParam(required = false) Boolean realAccFlag, HttpSession session) {
			if ("ALL".equals(camType)) {
				camType = "";
			}
			if ("ALL".equals(camStatus)) {
				camStatus = "";
			}
			String admId = (String) session.getAttribute("sessionID");
			log.info("$$$$$$$$세션 아이디:" + admId);
			AIStatistics aiVO = new AIStatistics(camName, camStatus, admId, camType, beforeDate, afterDate, realAccFlag);
			return statisticsService.selectCamList(aiVO);
		}
	
	// 모델 여부가 'Y'인 통계 조회
	@RequestMapping(value = "/list")
	public List<AIStatistics> selectSttModelYList(@RequestParam(required = false) String camName,
			@RequestParam(required = false) String camType, @RequestParam(required = false) String camStatus,
			@RequestParam(required = false) String beforeDate, @RequestParam(required = false) String afterDate,
			@RequestParam(required = false) Boolean realAccFlag, HttpSession session) {
		if ("ALL".equals(camType)) {
			camType = "";
		}
		if ("ALL".equals(camStatus)) {
			camStatus = "";
		}
		String admId = (String) session.getAttribute("sessionID");
		log.info("$$$$$$$$세션 아이디:" + admId);
		AIStatistics aiVO = new AIStatistics(camName, camStatus, admId, camType, beforeDate, afterDate, realAccFlag);
		return statisticsService.selectSttModelYList(aiVO);
	}

	// 통계 평균 조회
	@RequestMapping(value = "/average")
	public Map<String, AIStatistics> selectStatisticsAvgList(@RequestParam(required = false) String camName,
			@RequestParam(required = false) String camType, @RequestParam(required = false) String camStatus,
			@RequestParam(required = false) String beforeDate, @RequestParam(required = false) String afterDate,
			@RequestParam(required = false) Boolean realAccFlag, HttpSession session) {
		if ("ALL".equals(camType)) {
			camType = "";
		}
		if ("ALL".equals(camStatus)) {
			camStatus = "";
		}
		String admId = (String) session.getAttribute("sessionID");
		log.info("$$$파라메터 캠페인명:" + camName + ", 캠페인 타입:" + camType + ", 캠페인 상태:" + camStatus + ", 아이디:" + admId
				+ ", 전 날짜:" + beforeDate + ", 후 날짜:" + afterDate);
		AIStatistics aiVO = new AIStatistics(camName, camStatus, admId, camType, beforeDate, afterDate, realAccFlag);
		AIStatistics dTreeVO = statisticsService.selectDTreeAvg(aiVO);
		AIStatistics rfVO = statisticsService.selectRFavg(aiVO);
		AIStatistics svmVO = statisticsService.selectSVMavg(aiVO);
		AIStatistics dnnVO = statisticsService.selectDNNavg(aiVO);
		AIStatistics lRVO = statisticsService.selectLRavg(aiVO);
		log.info("###정확도:" + dTreeVO.getOriginalAccAvg() + ", 예측:" + dTreeVO.getSoAccAvg() + ", 실측:"
				+ dTreeVO.getRealAccAvg());
		Map<String, AIStatistics> trainMethodMap = new HashMap<>();
		trainMethodMap.put("dTreeVO", dTreeVO);
		trainMethodMap.put("rfVO", rfVO);
		trainMethodMap.put("svmVO", svmVO);
		trainMethodMap.put("dnnVO", dnnVO);
		trainMethodMap.put("lRVO", lRVO);
		return trainMethodMap;
	}
}
