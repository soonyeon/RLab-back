package kr.kh.RLab.dao;


import kr.kh.RLab.vo.WantVO;

public interface WantDAO {

	WantVO findWant(WantVO wantVO);

	void insertScrap(WantVO wantVO);

	void updateWant(WantVO isWant);

	int selectGaNumByStNum();


}
