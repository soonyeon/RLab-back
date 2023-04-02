package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyVO;

public interface StudyDAO {

	ArrayList<PhotoTypeVO> getPhotoType();

	void insertCB(PhotoVO photo);

	void insertFile(FileVO fileVo);

	StudyVO getStudyByMemberId(String st_me_id);
	
	List<PhotoVO> getPhotosByStudyNum(int st_num);
	
	void insertLike(LikeVO likeVO);
	
    void updateLikeStatus(@Param("li_me_id") String li_me_id, @Param("li_ph_num") int li_ph_num, @Param("li_state") int li_state);
    
    LikeVO getLikeByUserIdAndPhotoId(@Param("li_me_id") String li_me_id, @Param("li_ph_num") int li_ph_num);
    
    int countLikesByPhotoId(@Param("li_ph_num") int li_ph_num);

}
