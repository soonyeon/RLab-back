package kr.kh.RLab.service;

import java.util.Map;

import kr.kh.RLab.vo.ScrapVO;

public interface ScrapService {

	Map<String, Object> toggleScrap(ScrapVO scrapVO);

	int getScrapCount(int bo_num);

}
