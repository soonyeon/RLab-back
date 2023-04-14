package kr.kh.RLab.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SessionVO {

	private String ss_num;
    private String ss_me_id;
    private LocalDateTime ss_in;
    private LocalDateTime ss_out;
    private MemberVO member;
}
