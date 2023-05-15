package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AlarmVO {
	public enum AlarmType {
        LIKE, //좋아요
        MEMBER, // 스터디 가입,탈퇴 등
        STUDY, //스터디 댓글
        GATHER //모집글 댓글
    }

	private int al_num;
	private String al_me_id;
	private String al_content;
	private int al_view; //확인여부?
	private AlarmType al_type;
	
	public AlarmVO(String al_me_id, String al_content, int al_view, AlarmType al_type) {
		this.al_me_id = al_me_id;
		this.al_content = al_content;
		this.al_view = al_view;
		this.al_type = al_type;
	}

	
}
