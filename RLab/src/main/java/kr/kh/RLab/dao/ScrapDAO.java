package kr.kh.RLab.dao;

import kr.kh.RLab.vo.ScrapVO;

public interface ScrapDAO {
    ScrapVO findScrap(ScrapVO scrapVO);
    void insertScrap(ScrapVO scrapVO);
    void updateScrap(ScrapVO scrapVO);
    int getScrapCountByBoard(int bo_num);
}
