package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("login")
@NoArgsConstructor
@AllArgsConstructor
public class Login_CRM {
	private String emp_no;
	private String emp_password;
	private String dept_no;
	private String emp_name;
	private String tel_no;
	private String auth_no;
	private String auth_name;
}
