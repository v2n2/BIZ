package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("learning_info")
@NoArgsConstructor
@AllArgsConstructor
public class Learning_Info{
	private String train_method;
	private String original_acc;
	private String so_acc;
	private String model_dir;
	private String model_name;
}
