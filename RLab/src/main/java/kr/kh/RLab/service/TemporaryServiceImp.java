package kr.kh.RLab.service;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.TemporaryDAO;
import kr.kh.RLab.vo.TemporaryVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TemporaryServiceImp implements TemporaryService {
	
	private final TemporaryDAO temporaryDao;

	@Override
	public boolean saveTemporary(TemporaryVO temporaryVO) {
		System.out.println(temporaryVO);
		return temporaryDao.insertTemporary(temporaryVO);
	}

}
