package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.RLab.vo.TemporaryVO;

public interface TemporaryDAO {
	
	boolean insertTemporary(TemporaryVO temporary);

	ArrayList<TemporaryVO> getTemporaryList(String mo_me_id);

	TemporaryVO getTemporary(String te_num);
}
