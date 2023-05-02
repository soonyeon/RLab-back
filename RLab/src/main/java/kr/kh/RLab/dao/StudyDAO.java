package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.MissionFinishVO;
import kr.kh.RLab.vo.MissionVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TodoVO;

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

	int deleteStudyMember(@Param("st_num")int st_num, @Param("me_id")String me_id);

	void updateStudyMemberAuthority(@Param("sm_st_num")int sm_st_num, @Param("sm_me_id")String sm_me_id);

	String selectStudyLeaderId(@Param("sm_st_num")int sm_st_num);

	void updateStudyLeaderAuthority(@Param("sm_st_num")int sm_st_num, @Param("leaderId")String leaderId);

	void updateStudyLeader(@Param("sm_st_num")int sm_st_num, @Param("sm_me_id")String sm_me_id);
	
	void deleteStudyMemberList(@Param("st_num")int st_num);

	void deleteGatherByStNum(@Param("st_num")int st_num);

	void deleteTagRegisteStNum(@Param("st_num")int st_num);
    
	void deleteStudy(@Param("st_num")int st_num);

	void stateUpdateStudy(@Param("st_num")int st_num, @Param("st_state")int st_state);

	int selectStudyState(@Param("st_num")int st_num);

	void stateUpdateStudyUndo(@Param("st_num")int st_num, @Param("st_state")int st_state);

	ArrayList<TodoVO> selectTodoList(@Param("memberId")String memberId);

	void insertTodo(@Param("td_content")String td_content,@Param("td_me_id")String td_me_id );

	void deletetTodo(@Param("td_num")int td_num);

	void updateTodo(@Param("td_num")int td_num, @Param("td_finish") int td_finish);

	void updateTodoUndo(@Param("td_num")int td_num, @Param("td_finish") int td_finish);

	ArrayList<StudyMemberVO> selectMyStudyList(@Param("memberId")String memberId);

	int selectTodoCount(@Param("memberId")String memberId);

	int selectTodoFinishCount(@Param("memberId")String memberId);

	//void deleteStudyMember(@Param("st_num")int st_num, @Param("me_name")String me_name);
	
	List<StudyMemberVO> selectList(int st_num);
    
  List<StudyMemberVO> getOnlineMembers();

	PhotoVO getPhotosByPhNum(int li_ph_num);

	ArrayList<StudyMemberVO> selectStudyMemberByStNum(int st_num);

	ArrayList<PhotoVO> selectPhotoPhNumTwo(int st_num);

	ArrayList<MemberVO> selectMember(int st_num);

	int selectSmAuthority(@Param("user")MemberVO user,@Param("st_num")int st_num);

	boolean insertMission(MissionVO missionVO);

	MissionVO selectMission(int st_num);

	int insertMissionFinishMember(@Param("user")MemberVO member,@Param("st_num")int st_num);

	ArrayList<String> selectMissionFinishMember(int st_num);

	boolean updateMission(MissionVO missionVO);

  MissionFinishVO selectTodayMissionFinsh(String me_id);
  
	void deleteLike(@Param("li_me_id")String li_me_id, @Param("li_ph_num")int li_ph_num);

	void leaveStudy(@Param("me_id")String me_id, @Param("st_num")int st_num);

	StudyVO getStudy(int st_num);
	
	void updateStudy(StudyVO study);

	StudyMemberVO findStudyMember(@Param("st_num")int st_num,@Param("me_id")String me_id);

	void updateMemberStNum(@Param("me_id")String me_id,@Param("st_num") int st_num, @Param("new_st_num")int new_st_num);


	ArrayList<TodoVO> selectStudyMemberTodo(@Param("st_num")int st_num);

	ArrayList<StudyMemberVO> selectStudyMember(@Param("st_num")int st_num);

	int selectMemberTodoCount(@Param("td_me_id")String td_me_id);

	int selectMemberFinishTodoCount(@Param("td_me_id")String td_me_id);


}
