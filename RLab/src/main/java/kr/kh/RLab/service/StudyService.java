package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;

public interface StudyService {

	ArrayList<PhotoTypeVO> getListPhotoType();

	boolean insertCB(PhotoVO photo, MultipartFile[] files, MemberVO member);

	StudyVO getStudyByMemberId(String me_id);

	List<PhotoVO> getPhotosByStudyNum(int st_num);

	void insertLike(LikeVO likeVO);

	void updateLikeStatus(String li_me_id, int li_ph_num, int li_state);

	LikeVO getLikeByUserIdAndPhotoId(String li_me_id, int li_ph_num);

	int countLikesByPhotoId(int li_ph_num);

	ArrayList<StudyVO> getStudyListById(String memberId);

	ArrayList<StudyMemberVO> getStudyMemberList(int st_num,Criteria cri);

	int getStudyTotalCount(int st_num);

	void deleteStudyMember(int st_num, String me_name);



}
