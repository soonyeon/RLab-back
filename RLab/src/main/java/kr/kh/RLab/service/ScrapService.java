package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.Map;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.ScrapVO;

public interface ScrapService {

	Map<String, Object> toggleScrap(ScrapVO scrapVO);

	int getScrapCount(int bo_num);
	
	// 아이디로 스크랩한 게시글 목록 가져오기
	ArrayList<BoardVO> getScrapListById(String memberId);

}
