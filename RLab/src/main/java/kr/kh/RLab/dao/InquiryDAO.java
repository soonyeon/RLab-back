package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.InquiryTypeVO;
import kr.kh.RLab.vo.InquiryVO;
import kr.kh.RLab.vo.NoticeVO;

public interface InquiryDAO {

	ArrayList<InquiryVO> selectAllInquiry(@Param("cri")Criteria cri);

	Integer selectInquiryTotalCount(@Param("cri")Criteria cri);

	ArrayList<InquiryTypeVO> selectAllInquiryType();

	ArrayList<Integer> selectAnsweredInNum();

	InquiryVO selectInquiryAnswer(@Param("in_num")int in_num);

	void insertInquiry(@Param("me_id")String me_id, @Param("in")InquiryVO inquiry);

	InquiryVO selectInquiryByInnum(int in_num);

	int updateInquiry(@Param("in")InquiryVO in);

	int deleteInquiry(int in_num);

	void insertInquiryAnswer(@Param("me_id")String me_id, @Param("in")InquiryVO inquiry);

}
