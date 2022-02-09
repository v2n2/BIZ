package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("menu")
@NoArgsConstructor
@AllArgsConstructor
public class MenuList {
	private String menu_no;
	private String par_menu_no;
	private String menu_name;
	private String level;
	private String yn;
	private String menu_url;
	private String emp_no;
}
