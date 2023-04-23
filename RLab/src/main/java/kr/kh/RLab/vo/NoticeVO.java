package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	private int no_num;
	private String no_title;
	private String no_me_id;
	private String no_content;
	private Date bo_register_date;
	private int bo_views;
}
