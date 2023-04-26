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
		System.out.println(me_id);
		// st_num과 me_id를 이용하여 해당 정보를 study_member에서 삭제하기
		studyDao.deleteStudyMember(st_num, me_id);

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
	public ArrayList<StudyMemberVO> selectStudyMemberByStNum(int st_num) {
		
		return studyDao.selectStudyMemberByStNum(st_num);
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



	



}