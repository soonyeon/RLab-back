package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;

public interface StudyDAO {

	ArrayList<PhotoTypeVO> getPhotoType();

	void insertCB(PhotoVO photo);

	void insertFile(FileVO fileVo);

	ArrayList<StudyVO> getStudyByMemberId(String st_me_id);
	
	List<PhotoVO> getPhotosByStudyNum(int st_num);
	
	void insertLike(LikeVO likeVO);
	
    void updateLikeStatus(@Param("li_me_id") String li_me_id, @Param("li_ph_num") int li_ph_num, @Param("li_state") int li_state);
    
    LikeVO getLikeByUserIdAndPhotoId(@Param("li_me_id") String li_me_id, @Param("li_ph_num") int li_ph_num);
    
    int countLikesByPhotoId(@Param("li_ph_num") int li_ph_num);
    
    ArrayList<StudyVO> selectStudyListById(@Param("memberId")String memberId);

	ArrayList<StudyMemberVO> selectStudyMemberList(@Param("st_num")int st_num,@Param("cri")Criteria cri);

	int selectStudyTotalCount(@Param("st_num")int st_num);
	
	Object deleteStudyMember(@Param("st_me_id")String st_me_id);
	
	String selectStudyMemberId(@Param("me_name")String me_name);

	void deleteStudyMember(@Param("st_num")int st_num, @Param("me_name")String me_name);
	
	List<StudyMemberVO> selectList(int st_num);
    
    List<StudyMemberVO> getOnlineMembers();

	ArrayList<StudyMemberVO> selectStudyMemberByStNum(int st_num);

	ArrayList<PhotoVO> selectPhotoPhNumTwo(int st_num);

	ArrayList<MemberVO> selectMember(int st_num);

	//ArrayList<Integer> selectStudyMemberLeader(int st_num);

}
