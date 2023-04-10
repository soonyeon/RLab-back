package kr.kh.RLab.dao;

import java.util.ArrayList;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.ScrapVO;

public interface ScrapDAO {
    ScrapVO findScrap(ScrapVO scrapVO);
    ScrapVO findScrap2(String me_id);
    void insertScrap(ScrapVO scrapVO);
    void updateScrap(ScrapVO scrapVO);
    int getScrapCountByBoard(int bo_num);
    
    // 아이디로 스크랩한 게시글 리스트 가져오기
	ArrayList<BoardVO> selectScrapListById(String memberId);


}
