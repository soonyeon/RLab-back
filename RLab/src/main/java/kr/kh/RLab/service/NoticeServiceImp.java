package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.NoticeDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.NoticeTypeVO;
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
	public ArrayList<NoticeTypeVO> getAllNoticeType() {
		return noticeDao.selectAllNoticeType();
	}

	@Override
	public void insertNotice(String me_id, NoticeVO notice) {
		noticeDao.insertNotice(me_id, notice);
	}

	@Override
	public NoticeVO getNoticeByNonum(int no_num) {
		return noticeDao.selectNoticeByNonum(no_num);
	}

	@Override
	public void updateView(int no_num) {
		noticeDao.updateView(no_num);
	}

	@Override
	public boolean updateNotice(NoticeVO no) {
		return noticeDao.updateNotice(no)!=0;
	}

	@Override
	public boolean deleteNotice(int no_num) {
		return noticeDao.deleteNotice(no_num)!=0;
	}

}
