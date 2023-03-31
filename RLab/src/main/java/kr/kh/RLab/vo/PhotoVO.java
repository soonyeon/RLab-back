package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhotoVO {
	
	private int ph_num;
	private int ph_pt_num; // 포토 타입
	private String ph_me_id;
	private Date ph_register_date;
	private String ph_img;
	private String ph_content;
	private int ph_st_num; // 스터디번호
	


}
