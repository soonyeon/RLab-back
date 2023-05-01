package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.MissionFinishVO;
import kr.kh.RLab.vo.MissionVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TodoVO;

public interface StudyService {

	ArrayList<PhotoTypeVO> getListPhotoType();

	boolean insertCB(PhotoVO photo, MultipartFile[] files, MemberVO member);

	ArrayList<StudyVO> getStudyByMemberId(String me_id);

	List<PhotoVO> getPhotosByStudyNum(int st_num);

	void insertLike(LikeVO likeVO);

	void updateLikeStatus(String li_me_id, int li_ph_num, int li_state);

	LikeVO getLikeByUserIdAndPhotoId(String li_me_id, int li_ph_num);

	int countLikesByPhotoId(int li_ph_num);

	ArrayList<StudyVO> getStudyListById(String memberId);

	ArrayList<StudyMemberVO> getStudyMemberList(int st_num,Criteria cri);

	int getStudyTotalCount(int st_num);

	void deleteStudyMember(int st_num, String me_name);

	void authorizeStudyMember(int sm_st_num, String me_name);

	void deleteStudy(int st_num);

	void stateUpdateStudy(int st_num, int st_state);

	int getStudyState(int st_num);

	void stateUpdateStudyUndo(int st_num, int st_state);

	ArrayList<TodoVO> getTodoList(String memberId);

	void createTodo(String td_content, String td_me_id);

	void deleteTodo(int td_num);

	void finishTodo(int td_num, int td_finish);

	void finishTodoUndo(int td_num, int td_finish);

	ArrayList<StudyMemberVO> getMyStudyLis(String memberId);

	ArrayList<StudyMemberVO> getMyStudyMember(int myStudyNum);

	ArrayList<TodoVO> getTodoListByMemberId(ArrayList<String> stMeIdList);

	ArrayList<MemberVO> getTdMembersName(ArrayList<String> stMeIdList);

	double getTodoProgressRate(String memberId);
  
	List<StudyMemberVO> selectList(int st_num);

	List<StudyMemberVO> getOnlineMembers();

	ArrayList<StudyMemberVO> selectStudyMemberByStNum(int st_num);

	ArrayList<PhotoVO> selectPhotoPhNumTwo(int st_num);

	int selectSmAuthority(MemberVO user,int st_num);

	boolean insertMission(MissionVO missionVO);

	MissionVO selectMission(int st_num);
	
	int insertMissionFinishMember(MemberVO member, int st_num);

	ArrayList<String> selectMissionFinishMember(int st_num);

	boolean updateMission(MissionVO missionVO);
  
	PhotoVO getPhotoByPhNum(int li_ph_num);

	MissionFinishVO selectTodayMissionFinsh(String me_id);

	void deleteLike(String li_me_id, int li_ph_num);

	void leaveStudy(MemberVO user, int st_num);

	StudyVO getStudy(int st_num);
	
	void updateStudy(StudyVO study);

	StudyMemberVO findStudyMember(int st_num, String me_id);

	void updateMemberStNum(String me_id, int st_num, int new_st_num);


}
