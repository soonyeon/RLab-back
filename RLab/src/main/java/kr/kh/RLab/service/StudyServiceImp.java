package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.dao.StudyDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.utils.UploadFileUtils;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.MissionFinishVO;
import kr.kh.RLab.vo.MissionVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TodoVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudyServiceImp implements StudyService {

	private final StudyDAO studyDao;
	String uploadPath = "D:\\uploadfiles";

	@Override
	public ArrayList<PhotoTypeVO> getListPhotoType() {
		return studyDao.getPhotoType();
	}

	@Override
	public boolean insertCB(PhotoVO photo, MultipartFile[] files, MemberVO member) {
		if (member == null)
			return false;
		photo.setPh_me_id(member.getMe_id());

		if (files != null && files.length > 0) {
			uploadFiles(files, photo.getPh_num(), photo);
		}

		return true;
	}

	private void uploadFiles(MultipartFile[] files, int st_num, PhotoVO photo) {
		if (files == null || files.length == 0)
			return;
		for (MultipartFile file : files) {
			if (file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				photo.setPh_img(fileName);
				studyDao.insertCB(photo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public ArrayList<StudyVO> getStudyByMemberId(String me_id) {
		return studyDao.getStudyByMemberId(me_id);
	}

	@Override
	public List<PhotoVO> getPhotosByStudyNum(int st_num) {
		return studyDao.getPhotosByStudyNum(st_num);
	}

	@Override
	public void insertLike(LikeVO likeVO) {
		studyDao.insertLike(likeVO);
	}

	@Override
	public void updateLikeStatus(String li_me_id, int li_ph_num, int li_state) {
		studyDao.updateLikeStatus(li_me_id, li_ph_num, li_state);
	}

	@Override
	public LikeVO getLikeByUserIdAndPhotoId(String li_me_id, int li_ph_num) {
		return studyDao.getLikeByUserIdAndPhotoId(li_me_id, li_ph_num);
	}

	@Override
	public int countLikesByPhotoId(int li_ph_num) {
		return studyDao.countLikesByPhotoId(li_ph_num);
	}

	@Override
	public ArrayList<StudyVO> getStudyListById(String memberId) {
		if (memberId == null)
			return null;
//		System.out.println(memberId+2);
		return studyDao.selectStudyListById(memberId);
	}

	@Override
	public ArrayList<StudyMemberVO> getStudyMemberList(int st_num, Criteria cri) {
		return studyDao.selectStudyMemberList(st_num, cri);
	}

	@Override
	public int getStudyTotalCount(int st_num) {
		return studyDao.selectStudyTotalCount(st_num);

	}

	@Override
	public void deleteStudyMember(int st_num, String me_name) {
		// me_id 가져오기
		String me_id = studyDao.selectStudyMemberId(me_name);
		//st_num과 me_id를 이용하여 해당 정보를 study_member에서 삭제하기
		if(studyDao.deleteStudyMember(st_num, me_id)==0)
			return;
	}

	@Override
	public List<StudyMemberVO> selectList(int st_num) {
		return studyDao.selectList(st_num);
	}

	@Override
	public List<StudyMemberVO> getOnlineMembers() {
		return studyDao.getOnlineMembers();
	}

	@Override
	public ArrayList<StudyVO> getUserStudyList(String me_id) {
		return studyDao.selectUserStudyList(me_id);
	}

	@Override
	public StudyVO getStudyByStnum(int me_study) {
		return studyDao.selectStudyByStnum(me_study);
	}

	@Override
	public void updateUserFavorite(String me_id, int st_num) {
		studyDao.updateUserFavorite(me_id, st_num);
	}
  
  @Override
	public ArrayList<StudyMemberVO> selectStudyMemberByStNum(int st_num) {
		return studyDao.selectStudyMemberByStNum(st_num);
	}

	@Override
	public void authorizeStudyMember(int sm_st_num, String me_name) {
		//me_id 구하고
		String sm_me_id = studyDao.selectStudyMemberId(me_name);
		//sm_st_num과 sm_me_id가 일치하는 스터디원의 sm_authority를 9로 변경 
		studyDao.updateStudyMemberAuthority(sm_st_num, sm_me_id);
		
		//스터디장의 id가져오기
		String leaderId = studyDao.selectStudyLeaderId(sm_st_num); 
		
		//기존 스터디장의 sm_authority를 1으로 변경
		studyDao.updateStudyLeaderAuthority(sm_st_num, leaderId);
		
		//스터디의 st_me_id를 바뀐 스터디장으로 변경
		studyDao.updateStudyLeader(sm_st_num,sm_me_id);
	}

	@Override
	public void deleteStudy(int st_num) {
		//study테이블에서 해당st_num인 행 삭제
		studyDao.deleteStudyMemberList(st_num);
		//해당 스터디의 모집글 삭제
		studyDao.deleteGatherByStNum(st_num);
		//해당 스터디로 등록된 tag_registe 전부 삭제
		studyDao.deleteTagRegisteStNum(st_num);
		//study테이블에서 해당st_num인 행 삭제
		studyDao.deleteStudy(st_num);
	}

	@Override
	public void stateUpdateStudy(int st_num, int st_state) {
		//해당 스터디의st_num을 1에서 0으로 변경
		studyDao.stateUpdateStudy(st_num,st_state);
	}

	@Override
	public int getStudyState(int st_num) {
		return studyDao.selectStudyState(st_num);
	}

	@Override
	public void stateUpdateStudyUndo(int st_num, int st_state) {
		//해당 스터디의st_num을 0에서 1으로 변경
		studyDao.stateUpdateStudyUndo(st_num,st_state);
	}

	@Override
	public ArrayList<TodoVO> getTodoList(String memberId) {
		return studyDao.selectTodoList(memberId);
	}

	@Override
	public void createTodo(String td_content, String td_me_id) {
		studyDao.insertTodo(td_content,td_me_id);
	}

	@Override
	public void deleteTodo(int td_num) {
		studyDao.deletetTodo(td_num);
	}

	@Override
	public void finishTodo(int td_num, int td_finish) {
		// 해당 스터디의 td_finish를 0에서 1로 변경
		studyDao.updateTodo(td_num, td_finish);
	}

	@Override
	public void finishTodoUndo(int td_num, int td_finish) {
		studyDao.updateTodoUndo(td_num, td_finish);
	}

	@Override
	public ArrayList<StudyMemberVO> getMyStudyList(String memberId) {
		
		return studyDao.selectMyStudyList(memberId);
	}

	@Override
	public double getTodoProgressRate(String memberId) {
		//1. memberId에 td_me_id와 일치하는 투두 개수 구하기
		int totalTodo = studyDao.selectTodoCount(memberId);
		
		//2. memberId가 td_me_id와 일치하고 td_finish가 1인 투두 개수 구하기
		int finishTodo = studyDao.selectTodoFinishCount(memberId);
		
		//3. 2의 값/ 1의 값 * 100을 해서 진척률 구하기
		double todoProgressRate = ((double) finishTodo / totalTodo) * 100;
		
		return todoProgressRate;
	}

	@Override
	public ArrayList<PhotoVO> selectPhotoPhNumTwo(int st_num) {
		return studyDao.selectPhotoPhNumTwo(st_num);
	}

	@Override
	public int selectSmAuthority(MemberVO user,int st_num) {
		return studyDao.selectSmAuthority(user,st_num);
	}

	@Override
	public boolean insertMission(MissionVO missionVO) {
		return studyDao.insertMission(missionVO);
	}

	@Override
	public MissionVO selectMission(int st_num) {
		return studyDao.selectMission(st_num);
	}

	@Override
	public int insertMissionFinishMember(MemberVO member,int st_num) {
		return studyDao.insertMissionFinishMember(member,st_num);
	}

	@Override
	public ArrayList<String> selectMissionFinishMember(int st_num) {
		return studyDao.selectMissionFinishMember(st_num);
	}

	@Override
	public boolean updateMission(MissionVO missionVO) {
		return studyDao.updateMission(missionVO);
	}
  
	@Override
	public MissionFinishVO selectTodayMissionFinsh(String me_id) {
		return studyDao.selectTodayMissionFinsh(me_id);
	}

	@Override
	public PhotoVO getPhotoByPhNum(int li_ph_num) {
		if(li_ph_num == 0)
		return null;
		return studyDao.getPhotosByPhNum(li_ph_num);
	}
  
	@Override
	public void deleteLike(String li_me_id, int li_ph_num) {
		studyDao.deleteLike(li_me_id,li_ph_num);
	}

	@Override
	public void leaveStudy(MemberVO user, int st_num) {
		studyDao.leaveStudy(user.getMe_id(),st_num);
	}

	@Override
	public ArrayList<TodoVO> getStudyMemberTodo(int st_num) {
		return studyDao.selectStudyMemberTodo(st_num);
	}
	
	@Override
	public ArrayList<StudyMemberVO> getStudyMember(int st_num) {
		return studyDao.selectStudyMember(st_num);
	}

	@Override
	public double membersTdProgRate(String td_me_id) {
		//1. memberId에 td_me_id와 일치하는 투두 개수 구하기
		int mbTodoCount = studyDao.selectMemberTodoCount(td_me_id);
		//2. memberId가 td_me_id와 일치하고 td_finish가 1인 투두 개수 구하기
		int finishTodoCount = studyDao.selectMemberFinishTodoCount(td_me_id);
		//3. 2의 값/ 1의 값 * 100을 해서 진척률 구하기
		double membersTdProgRate = ((double) finishTodoCount / mbTodoCount) * 100;
		
		return membersTdProgRate;
	}

	@Override
	public StudyVO getStudy(int st_num) {
		if(st_num == 0) {
			return null;
		}
		return studyDao.getStudy(st_num);
	}

	@Override
	public void updateStudy(StudyVO study) {
        studyDao.updateStudy(study);
	}

	@Override
	public StudyMemberVO findStudyMember(int st_num,String me_id) {
		return studyDao.findStudyMember(st_num,me_id);
	}

	@Override
	public void updateMemberStNum(String me_id, int st_num, int new_st_num) {
		studyDao.updateMemberStNum(me_id, st_num, new_st_num);
	}

}