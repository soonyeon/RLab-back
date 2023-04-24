package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AlarmVO {
		private int al_num;
		private String al_me_id;
		private String al_content;
		private int al_view; //확인여부?
		private String bo_title;

}
