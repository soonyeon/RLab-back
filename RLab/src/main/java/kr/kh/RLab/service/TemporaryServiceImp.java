package kr.kh.RLab.service;

import java.util.ArrayList;

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
		return temporaryDao.insertTemporary(temporaryVO);
	}

	@Override
	public ArrayList<TemporaryVO> getTemporaryList(String mo_me_id) {
		return temporaryDao.getTemporaryList(mo_me_id);
	}
	
	@Override
    public TemporaryVO getTemporary(String te_num) {
        return temporaryDao.getTemporary(te_num);
    }

	@Override
	public void deleteAll() {
		temporaryDao.deleteAll();
	}

	@Override
	public void delete(int te_num) {
		temporaryDao.delete(te_num);
	}

}
