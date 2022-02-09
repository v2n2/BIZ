package com.ktds.biz.admin.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("user")
@NoArgsConstructor
@AllArgsConstructor
public class User {
	String emp_no;
	String emp_password;
	String dept_name;
	String emp_name;
	String tel_no;
	String rgs_emp_no;
	
	int page_st;
	int page_end;
}
