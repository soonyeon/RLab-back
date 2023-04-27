package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.InquiryDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.InquiryTypeVO;
import kr.kh.RLab.vo.InquiryVO;
import kr.kh.RLab.vo.NoticeVO;

@Service
public class InquiryServiceImp implements InquiryService {
	@Autowired
	InquiryDAO inquiryDao;
	
	@Override
	public ArrayList<InquiryVO> getAllInquiry(Criteria cri) {
		return inquiryDao.selectAllInquiry(cri);
	}

	@Override
	public int getInquiryTotalCount(Criteria cri) {
		Integer totalCount = inquiryDao.selectInquiryTotalCount(cri);
		return totalCount != null ? totalCount : 0;
	}

	@Override
	public ArrayList<InquiryTypeVO> getAllInquiryType() {
		return inquiryDao.selectAllInquiryType();
	}

	@Override
	public void insertInquiry(String me_id, InquiryVO inquiry) {
		inquiryDao.insertInquiry(me_id, inquiry);
	}

	@Override
	public NoticeVO getNoticeByNonum(int no_num) {
		return inquiryDao.selectNoticeByNonum(no_num);
	}

	@Override
	public void updateView(int no_num) {
		inquiryDao.updateView(no_num);
	}

	@Override
	public boolean updateNotice(NoticeVO no) {
		return inquiryDao.updateNotice(no)!=0;
	}

	@Override
	public boolean deleteNotice(int no_num) {
		return inquiryDao.deleteNotice(no_num)!=0;
	}

}
