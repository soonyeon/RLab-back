package kr.kh.RLab.dao;

import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.RLab.vo.TemporaryVO;

public interface TemporaryDAO {
	
	boolean insertTemporary(TemporaryVO temporary);

}
