package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.Map;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.ScrapVO;

public interface ScrapService {

	Map<String, Object> toggleScrap(ScrapVO scrapVO);

	int getScrapCount(int bo_num);

}
