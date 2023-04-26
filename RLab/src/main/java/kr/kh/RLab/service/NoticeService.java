package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.NoticeTypeVO;
import kr.kh.RLab.vo.NoticeVO;

public interface NoticeService {

	ArrayList<NoticeVO> getAllNotice(Criteria cri);

	int getNoticeTotalCount(Criteria cri);

	ArrayList<NoticeTypeVO> getAllNoticeType();

	void insertNotice(String me_id, NoticeVO notice);

	NoticeVO getNoticeByNonum(int no_num);

}
