package kr.kh.RLab.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ScrapDAO;
import kr.kh.RLab.vo.ScrapVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ScrapServiceImp implements ScrapService{
	
	private final ScrapDAO scrapDAO;
	
	@Override
	public Map<String, Object> toggleScrap(ScrapVO scrapVO) {
		// DB에서 기존 스크랩 정보를 조회
		ScrapVO isScrap = scrapDAO.findScrap(scrapVO);
		int newScrapState;

		// 기존 스크랩 정보가 없을 경우
		if (isScrap == null) {
		    // 새로운 스크랩 정보를 생성하고 상태를 1로 설정
		    scrapVO.setSc_state(1);
		    //DB에 새로운 스크랩 정보를 삽입
		    scrapDAO.insertScrap(scrapVO);
		    newScrapState = 1;
		} else {
		    // 기존 스크랩 정보가 있을 경우, 상태를 토글
		    if (isScrap.getSc_state() == 0) {
		        isScrap.setSc_state(1);
		        newScrapState = 1;
		    } else {
		        isScrap.setSc_state(0);
		        newScrapState = 0;
		    }
		    // DB에 스크랩 정보를 업데이트
		    scrapDAO.updateScrap(isScrap);
		}

		// 게시글에 대한 현재 스크랩 개수를 가져옴
		int currentScrapCount = scrapDAO.getScrapCountByBoard(scrapVO.getSc_bo_num());

		// 스크랩 상태와 스크랩 개수를 추가
		Map<String, Object> result = new HashMap<>();
		result.put("scrapState", newScrapState);
		result.put("scrapCount", currentScrapCount);
		return result;
	}

	@Override
	public int getScrapCount(int bo_num) {
        return scrapDAO.getScrapCountByBoard(bo_num);
	}

}
