package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.MemberOKVO;
import kr.kh.RLab.vo.MemberVO;

public interface MemberDAO {

	int insertMember(@Param("member")MemberVO member);

	Object selectMemberById(@Param("me_id")String me_id);

	Object selectMemberByName(@Param("me_name")String me_name);

	MemberOKVO selectMemberOK(@Param("mok")MemberOKVO mok);

	void deleteMemberOK(@Param("mok")MemberOKVO mok);

	void updateAuthority(@Param("me_id")String me_id,@Param("me_authority") int i);

	void insertMemberOK(@Param("mok")MemberOKVO mok);
	



}
