package com.ktds.biz.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 통계 VO
@Getter @Setter 
@NoArgsConstructor
@AllArgsConstructor
public class AIStatistics {
	private String src_id;
	private String src_name;
	private String src_type;
	private String status_cd;
	private String adm_id;
	private String adm_type;
	private String created;
	private String modelFlg;		
	private Integer camId;				// 캠페인 ID
	private String camName;				// 캠페인명
	private String camType;				// 캠페인 목적
	private String camStatus;			// 캠페인 상태
	private String admId;				// 생성자 ID
	private String admName;				// 생성자명
	private Integer admType;			// 산업군
	private String camCdate;			// 캠페인 생성일자
	private String trainMethod;			// 학습모델
	private Integer testCnt;			// 대상자 건수
	private String originalAcc;		// 정확도
	private String soAcc;				// 예측
	private String realAcc;			// 실측, 결과
	private String aiAcc;			// 예측
		// 선택된 모델 여부
	
	// 파라메터 방식으로만 사용
	private String beforeDate;			// 기간(이전)
	private String afterDate;			// 기간(이후)
	private BigDecimal originalAccAvg;		// 정확도 평균
	private BigDecimal soAccAvg;			// 예측 평균
	private BigDecimal realAccAvg;			// 결과 평균
	private BigDecimal aiAccAvg;			// 예측 평균
	private Boolean realAccFlag = false;	// 통계 화면에서 실측 파라메터 추가할지 말지 여부(초기는 없는 걸로 함)
	
	public AIStatistics(String camName, String camStatus, String admId, String camType, String beforeDate,
			String afterDate, Boolean realAccFlag) {
		this.camName = camName;
		this.camStatus = camStatus;
		this.admId = admId;
		this.camType = camType;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
		this.realAccFlag = realAccFlag;
	}
}
