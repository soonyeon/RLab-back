package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BranchVO {
	int br_num;
	String br_name;
	String br_address;
	String br_road_address;
	String br_tel;
	int br_capacity;
	String br_re_name;
	String br_img;
}
