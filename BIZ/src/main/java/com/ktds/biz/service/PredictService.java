package com.ktds.biz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.biz.model.AIPredict;
import com.ktds.biz.service.impl.PredictMapper;

@Service
public class PredictService implements PredictMapper {

	@Autowired
	PredictMapper predictMapper;

	@Override
	public List<AIPredict> selectAllPredictList(AIPredict vo) {
		return predictMapper.selectAllPredictList(vo);
	}

	@Override
	public Integer selectPredictCnt(Map<String, Object> param) {
		return predictMapper.selectPredictCnt(param);
	}

	@Override
	public List<AIPredict> selectPredictList(Map<String, Object> param) {
		return predictMapper.selectPredictList(param);
	}

	@Override
	public List<AIPredict> getPredictDown(Map<String, Object> param) {
		return predictMapper.getPredictDown(param);
	}
}
