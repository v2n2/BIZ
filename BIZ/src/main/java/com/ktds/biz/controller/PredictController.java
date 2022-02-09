package com.ktds.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.biz.model.AIPredict;
import com.ktds.biz.model.PageCriteria;
import com.ktds.biz.model.PageMaker;
import com.ktds.biz.service.PredictService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/predict")
public class PredictController {

	@Autowired
	PredictService predictService;

	// 예측 결과 목록 조회
	@RequestMapping(value = "/list")
	public List<AIPredict> selectAllPredictList(Integer camId) {
		log.info("$$$$$캠페인 아이디:" + camId);
		AIPredict vo = new AIPredict(camId);
		List<AIPredict> predictList = predictService.selectAllPredictList(vo);
		log.info("$$$$$프레딕트 내용:" + predictList);
		return predictList;
	}

	// 파라메터 입력한 예측 결과의 총 목록 수
	@RequestMapping(value = "/count")
	public PageMaker selectPredictCnt(Integer camId, Double succProb, Integer extractCnt, PageCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		log.info("##### 예상 페이지:" + cri.getPage() + ", 예상 페이지 당 수:" + cri.getPerPageNum() + ", 예상 페이지 시작:"
				+ cri.getListStart() + ", 성공률:" + succProb + ", 건 수:" + extractCnt);
		pageMaker.setCri(cri);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("camId", camId);
		paramMap.put("succProb", succProb);
		paramMap.put("extractCnt", extractCnt);
		Integer predictCnt = predictService.selectPredictCnt(paramMap);
		pageMaker.setTotalCount(predictCnt);
		log.info("$$$$$ 예상 결과 총 목록 수:" + predictCnt + ", 예상 결과 디스플레이 페이지:" + pageMaker.getDisplayPageNum()
				+ ", 예상 결과 페이지 총 수:" + pageMaker.getRealEndPage());
		return pageMaker;
	}

	// 페이징 처리된 예측 결과 목록 조회
	@RequestMapping(value = "/paging")
	public List<AIPredict> selectPagingPredictList(Integer camId, Double succProb,
			@RequestParam(required = false) Integer page) {
		log.info("$$$$$$클릭한 페이지:" + page + ", 예측률:" + succProb);
		Map<String, Object> paramMap = new HashMap<>();
		PageCriteria cri = new PageCriteria();
		cri.setPage(page);
		cri.setPerPageNum(5);
		paramMap.put("camId", camId);
		paramMap.put("succProb", succProb);
		paramMap.put("listStart", cri.getListStart());
		paramMap.put("listEnd", cri.getListEnd());
		List<AIPredict> predictList = predictService.selectPredictList(paramMap);
		log.info("$$$$$$프레딕트 목록:" + predictList);
		return predictList;
	}
}
