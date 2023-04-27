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


}
