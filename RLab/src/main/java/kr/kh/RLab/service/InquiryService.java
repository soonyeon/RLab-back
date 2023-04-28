package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.InquiryTypeVO;
import kr.kh.RLab.vo.InquiryVO;
import kr.kh.RLab.vo.NoticeVO;

public interface InquiryService {

	ArrayList<InquiryVO> getAllInquiry(Criteria cri);

	int getInquiryTotalCount(Criteria cri);

	ArrayList<InquiryTypeVO> getAllInquiryType();

	ArrayList<Integer> getAnsweredInNum();

	void insertInquiry(String me_id, InquiryVO inquiry);

	InquiryVO getInquiryByInnum(int in_num);

	boolean updateInquiry(InquiryVO in);

	boolean deleteInquiry(int in_num);

}
