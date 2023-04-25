package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.NoticeDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.NoticeVO;

@Service
public class NoticeServiceImp implements NoticeService {
	@Autowired
	NoticeDAO noticeDao;
	
	@Override
	public ArrayList<NoticeVO> getAllNotice(Criteria cri) {
		return noticeDao.selectAllNotice(cri);
	}

	@Override
	public int getNoticeTotalCount(Criteria cri) {
		Integer totalCount = noticeDao.selectNoticeTotalCount(cri);
		return totalCount != null ? totalCount : 0;
	}

	@Override
	public NoticeVO getNoticeByNonum(int no_num) {
		return noticeDao.selectNoticeByNonum(no_num);
	}

}
