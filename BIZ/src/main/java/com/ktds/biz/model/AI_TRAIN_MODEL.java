package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("model")
@NoArgsConstructor
@AllArgsConstructor
public class AI_TRAIN_MODEL {
	private String cam_id;
	private String src_id;
	private String train_method;
	private String original_acc;
	private String ai_acc;
	private String so_acc;
	private String model_dir;
	private String model_name;
	private String train_start;
	private String train_end;
	private String model_flg;
	private String desc_text;
}
