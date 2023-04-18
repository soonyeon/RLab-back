package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScrapVO {
	private int sc_num;
	private String sc_me_id;
	private int sc_bo_num;
	private int sc_state;
}
