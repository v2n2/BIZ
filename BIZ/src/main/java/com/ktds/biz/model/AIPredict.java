package com.ktds.biz.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * 예측 결과 VO
 */
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class AIPredict extends PageCriteria {
	private Integer rnum;				// 순번
	private Integer stSeq;				// 스테이징 시퀀스
	private Integer camId;				// 캠페인ID
	private String trainMethod;			// 학습모델
	private String predict;				// 예측 성공 여부
	private Double succProb;			// 성공 예측률
	private Double failProb;			// 실패 예측률
	private String stC1;				// 스테이징 컬럼1
	
	public AIPredict(Integer camId) {
		this.camId = camId;
	}
	
	public AIPredict(Integer camId, Double succProb) {
		this.camId = camId;
		this.succProb = succProb;
	};
	
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(stSeq + ",");
		sb.append(camId + ",");
		sb.append(stC1 + ",");
		sb.append(trainMethod + ",");
		sb.append(predict + ",");
		sb.append(succProb + ",");
		sb.append(failProb + ",");
		sb.append("" + ",\n");
		return sb.toString();
	}
}
