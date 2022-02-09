package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("admin")
@NoArgsConstructor
@AllArgsConstructor
public class AI_ADMINUSER {
	private String ADM_ID;
	private String ADM_PW;
	private String ADM_TYPE;
	private String ADM_ROLE;
	private String ADM_NAME;
	private String ADM_EMAIL;
	private String ADM_CDATE;
	private String ADM_UDATE;
	private String ADM_LOGIN;
	private String CAM_CNT;
}
