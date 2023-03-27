package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.MemberVO;

public interface MemberDAO {

	int insertMember(@Param("m")MemberVO member);

	Object selectMemberById(@Param("me_id")String me_id);

	Object selectMemberByName(@Param("me_name")String me_name);

	void updateAuthority(@Param("me_id")String me_id,@Param("me_authority") int i);

	MemberVO selectMemberById(@Param("me_id")String me_id);

}