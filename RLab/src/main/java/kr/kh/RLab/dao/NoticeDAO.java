package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.NoticeTypeVO;
import kr.kh.RLab.vo.NoticeVO;

public interface NoticeDAO {

	ArrayList<NoticeVO> selectAllNotice(@Param("cri")Criteria cri);

	Integer selectNoticeTotalCount(@Param("cri")Criteria cri);

	ArrayList<NoticeTypeVO> selectAllNoticeType();

	void insertNotice(@Param("me_id")String me_id, @Param("no")NoticeVO notice);

	NoticeVO selectNoticeByNonum(int no_num);

	void updateView(int no_num);

	int updateNotice(@Param("no")NoticeVO no);

	int deleteNotice(int no_num);

}
