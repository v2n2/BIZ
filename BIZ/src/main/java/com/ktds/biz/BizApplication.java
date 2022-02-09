package com.ktds.biz;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
@MapperScan(basePackages = "com.ktds.biz")
public class BizApplication{

	public static void main(String[] args) {
		new SpringApplicationBuilder(BizApplication.class)
		.build()
		.run(args);
	}
}
