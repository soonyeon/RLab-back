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

	void insertInquiry(String me_id, InquiryVO inquiry);

	NoticeVO getNoticeByNonum(int no_num);

	void updateView(int no_num);

	boolean updateNotice(NoticeVO no);

	boolean deleteNotice(int no_num);

}
