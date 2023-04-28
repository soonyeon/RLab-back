package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int bo_num;
	private int bo_st_num;
	private String bo_title;
	private String bo_content;
	private String bo_me_id;
	private int bo_views;
	private Date bo_reg_date;
	private Date bo_upd_date;
	private String st_name;
	private String me_name;
	private int scrap_count;
	private ScrapVO scrapVO; //나의 스크랩에서 sc_num을 사용하기 위해 필요
	
	public String getBo_reg_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy.MM.dd");
		if(bo_reg_date == null) 
			return "";
			return format.format(bo_reg_date);
	}
	
	public ScrapVO getScrapVO() {
		return scrapVO;
	}
	
}
