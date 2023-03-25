package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.TemporaryVO;

public interface TemporaryService {

	boolean saveTemporary(TemporaryVO temporaryVO);

	ArrayList<TemporaryVO> getTemporaryList(String mo_me_id);

	TemporaryVO getTemporary(String te_num);

}
