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
	public ArrayList<Integer> getAnsweredInNum() {
		return inquiryDao.selectAnsweredInNum();
	}

	@Override
	public InquiryVO getInquiryAnswer(int in_num) {
		return inquiryDao.selectInquiryAnswer(in_num);
	}

	@Override
	public void insertInquiry(String me_id, InquiryVO inquiry) {
		inquiryDao.insertInquiry(me_id, inquiry);
	}

	@Override
	public InquiryVO getInquiryByInnum(int in_num) {
		return inquiryDao.selectInquiryByInnum(in_num);
	}

	@Override
	public boolean updateInquiry(InquiryVO in) {
		return inquiryDao.updateInquiry(in)!=0;
	}

	@Override
	public boolean deleteInquiry(int in_num) {
		return inquiryDao.deleteInquiry(in_num)!=0;
	}

	@Override
	public void insertInquiryAnswer(String me_id, InquiryVO inquiry) {
		inquiryDao.insertInquiryAnswer(me_id, inquiry);
	}

	@Override
	public void updateInquiryAnswer(InquiryVO inquiry) {
		inquiryDao.updateInquiryAnswer(inquiry);
	}

}
