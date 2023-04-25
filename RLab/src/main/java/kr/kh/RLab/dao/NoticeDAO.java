package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.NoticeVO;

public interface NoticeDAO {

	ArrayList<NoticeVO> selectAllNotice(@Param("cri")Criteria cri);

	Integer selectNoticeTotalCount(Criteria cri);

	NoticeVO selectNoticeByNonum(int no_num);

}
