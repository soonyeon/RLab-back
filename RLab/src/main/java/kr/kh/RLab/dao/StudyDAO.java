package kr.kh.RLab.dao;

import java.util.ArrayList;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyVO;

public interface StudyDAO {

	ArrayList<PhotoTypeVO> getPhotoType();

	void insertCB(PhotoVO photo);

	void insertFile(FileVO fileVo);

	StudyVO getStudyByMemberId(String st_me_id);

}
