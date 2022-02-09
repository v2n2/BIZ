package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@Alias("staging")
@NoArgsConstructor
public class AI_STAGING extends PageCriteria {
	private String st_seq;
	private String cam_id;
	private String st_c1;
	private String st_c2;
	private String st_c3;
	private String st_c4;
	private String st_c5;
	private String st_c6;
	private String st_c7;
	private String st_c8;
	private String st_c9;
	private String st_c10;
	private String st_c200;
	private String train_method;
	private String predict;
	private String succ_prob;
	private String fail_prob;
	private String result;
	private Integer statusFlag; // 학습 데이터, 대상자 데이터 구분필드

	public AI_STAGING(String st_seq, String cam_id, String st_c1, String st_c2, String st_c3, String st_c4,
			String st_c5, String st_c6, String st_c7, String st_c8, String st_c9, String st_c10, String st_c200,
			String train_method, String predict, String succ_prob, String fail_prob, String result) {
		this.st_seq = st_seq;
		this.cam_id = cam_id;
		this.st_c1 = st_c1;
		this.st_c2 = st_c2;
		this.st_c3 = st_c3;
		this.st_c4 = st_c4;
		this.st_c5 = st_c5;
		this.st_c6 = st_c6;
		this.st_c7 = st_c7;
		this.st_c8 = st_c8;
		this.st_c9 = st_c9;
		this.st_c10 = st_c10;
		this.st_c200 = st_c200;
		this.train_method = train_method;
		this.predict = predict;
		this.succ_prob = succ_prob;
		this.fail_prob = fail_prob;
		this.result = result;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(st_seq + ",");
		sb.append(cam_id + ",");
		sb.append(st_c1 + ",");
		sb.append(train_method + ",");
		sb.append(predict + ",");
		sb.append(succ_prob + ",");
		sb.append(fail_prob + ",");
		sb.append("" + ",\n");
		return sb.toString();
	}
}
