package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudyVO {
	private int st_num;
	private String st_name;
	private String st_me_id;
	private String st_info;
	private int st_now_people;
	private int st_total_people;
	private String st_re_name;
	private String st_image;
}
