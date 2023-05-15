package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SeatVO {
	private int se_num;
	private int se_br_num;
	private int se_ki_num;
	private String se_name;
	private int se_spot;
	private int se_usable;
}