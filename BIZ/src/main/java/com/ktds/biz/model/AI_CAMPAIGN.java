package com.ktds.biz.model;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("campaign")
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
public class AI_CAMPAIGN extends PageCriteria {
	private int page_st;
	private int page_end;
	private String cam_seq;
	private String src_id;
	private String src_name;
	private String adm_id;
	private String src_type;
	private String cam_autoyn;
	private String status_cd;
	private String cam_itype;
	private String cam_icnum;
	private String cam_ifilename;
	private String cam_idate;
	private String cam_otype;
	private String cam_ofilename;
	private String cam_rtype;
	private String cam_rfilename;
	private String created;
	private String desc_text;
	private String cam_msg;
	private String file_t_name;
	private String file_t_type;
	private String file_dir;
	private String file_p_name;
	private String file_p_type;
	private String file_r_name;
	private String file_r_type;
	private String pred_dl_file_path;
	private String pred_ml_file_path;

	public AI_CAMPAIGN(String src_name, String adm_id, String src_type, String status_cd) {
		this.src_name = src_name;
		this.adm_id = adm_id;
		this.src_type = src_type;
		this.status_cd = status_cd;
	}
}
