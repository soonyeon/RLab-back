package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.MemberVO;

public interface MemberDAO {

	int insertMember(@Param("member")MemberVO member);

	MemberVO selectMemberById(@Param("me_id")String me_id);


}
