
package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;

public interface GatherDAO {

	boolean insertStudy(@Param("study")StudyVO study);

	void insertFile(@Param("file")FileVO fileVo);

	void insertTag(@Param("tag")TagVO tagVO);

	void insertStudyTag(@Param("st_num")int st_num, @Param("ta_name")String ta_name);

	boolean insertGather(@Param("gather")GatherVO gather);

	ArrayList<StudyVO> selectStudyAll(@Param("cri")GatherCriteria gcri);

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();

	GatherVO selectGather(@Param("st_num")int st_num);

	StudyVO selectStudy(@Param("st_num")int st_num);

	void countViews(@Param("st_num")int st_num);

	int selectStudyTotalCount(@Param("cri")GatherCriteria gcri);

	ArrayList<Integer> selectStudyList();

	ArrayList<Integer> selectWantedStudyList(@Param("me_id")String me_id);

	ArrayList<Integer> selectStudyMemberList(@Param("me_id")String me_id);

	StudyMemberVO selelctJoinStudyMemberList(@Param("me_id")String me_id, @Param("st_num")int st_num);

	ArrayList<BoardVO> selectGatherListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);

	int selectGatherTotalCount(String memberId);

	ArrayList<StudyVO> selectStudyById(String me_id);

	ArrayList<TagVO> selectTag(@Param("tagName") String tagName);

	ArrayList<GatherVO> selectGatherAll();

	void insertStudyLeader(@Param("sm")StudyMemberVO studyMember);

	GatherVO getGatherByComment(int co_num);
	ArrayList<String> selectSearchTagList(String search);

	ArrayList<GatherVO> findGatherdById(String me_id);

	GatherVO selectGatherByGaNum(@Param("ga_num")int ga_num,@Param("user")MemberVO user);

	boolean updateGather(GatherVO gather);

	void deleteGather(int ga_num);

	void updateMeStudyNumber(@Param("st_num")int st_num, @Param("me_id")String me_id);

	StudyVO selectStudyByStNum(int st_num);

	FileVO selectFileByStNum(int st_num);

	ArrayList<String> selectTagListByStNum(@Param("st_num")int st_num);

	void updateStudy(StudyVO study,@Param("st_num") int st_num);

	void deleteTagByStNum(TagRegisterVO tagRegister,@Param("st_num") int st_num);

	void deleteFileByStNum(FileVO file, @Param("st_num")int st_num);

	

	

	

	





}