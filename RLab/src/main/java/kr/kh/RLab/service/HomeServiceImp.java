package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


import kr.kh.RLab.dao.HomeDAO;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class HomeServiceImp implements HomeService {
	
	private final HomeDAO homeDao;
	
	@Override
	public ArrayList<StudyVO> selectStudyAll() {
		return homeDao.selectStudyAll();
	}

	@Override
	public ArrayList<GatherVO> selectGatherAll() {
		return homeDao.selectGatherAll();
	}

	@Override
	public ArrayList<FileVO> selectFileList() {
		return homeDao.selectFileList();
	}

	@Override
	public ArrayList<TagRegisterVO> selectTagList() {
		return homeDao.selectTagList();
	}

	@Override
	public ArrayList<Integer> selectWantedStudyList(MemberVO user) {
		if (user == null)
			return null;
		return homeDao.selectWantedStudyList(user.getMe_id());
	}
	

	
}
