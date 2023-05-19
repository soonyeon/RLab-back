package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.dao.GatherDAO;
import kr.kh.RLab.dao.MypageDAO;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.utils.UploadFileUtils;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class GatherServiceImp implements GatherService {

	private final GatherDAO gatherDao;
	String uploadPath = "D:\\uploadfiles";

	//[모집게시판 > 스터디생성]
	/** @param study : 스터디 
	 * 	@param member : 회원 가져옴 
	 *  @param region : 지역 지정하기 위해 지역 가져옴
	 *  @param files : 파일을 저장하기 위해 mutlipartFile 필요
	 *  @param file : 선택한 파일을 db에 저장하기 위해
	 *  @param tag : tag 저장
	 *  @tagRegister : 스터디 번호로 해시태그 저장하기 위해 
	 *  @studyMember : 스터디멤버에 등록하기 위해 
	 */
	@Override
	public boolean insertStudy(StudyVO study, MemberVO member, RegionVO region, MultipartFile[] files, FileVO file,
			TagVO tag, TagRegisterVO tagRegister, StudyMemberVO studyMember) {
		if (member == null) {
			return false;
		}
		//study를 생성할때 스터디명 길이가 0 또는 총인원 설정을 1보다 작게 하면 return false		
		if (study.getSt_name().trim().length() == 0 || study.getSt_total_people() < 1) {
			return false;
		}
		study.setSt_me_id(member.getMe_id());
		gatherDao.insertStudy(study);
		studyMember.setSm_me_id(member.getMe_id());
		studyMember.setSm_st_num(study.getSt_num());
		gatherDao.insertStudyLeader(studyMember);
		
		//태그는 , 로 구분
		String[] tags = tag.getTa_name().split(",");
		ArrayList<TagVO> tagList = new ArrayList<>();
		
		
		//[태그 추가]
			//태그를 작성하지 않아도 넘어가게끔
		for (String tagName : tags) {
			tagName = tagName.trim();
			if (tagName.isEmpty()) {
				continue;
			}
			ArrayList<TagVO> tagVOList = gatherDao.selectTag(tagName);
			//tagVO에서 태그가 없으면 태그 tag테이블에 추가
			if (tagVOList.isEmpty()) {
				TagVO tagVO = new TagVO();
				tagVO.setTa_name(tagName);
				gatherDao.insertTag(tagVO);
				tagVOList.add(tagVO);
			}
			TagVO tagVO = tagVOList.get(0);
			tagList.add(tagVO);
			gatherDao.insertStudyTag(study.getSt_num(), tagVO.getTa_name());
		}

		// 파일 추가(null이 아니고 파일길이가 0이상일때)
		if (files != null && files.length > 0) {
			uploadFiles(files, study.getSt_num(), file.getFi_table());
		}
		
		//me_study가 비어있으면 추가되도록, 비어있지않으면 그냥 넘어감
		if (member.getMe_study() == 0) {
		    gatherDao.updateMeStudyNumber(study.getSt_num(),member.getMe_id());
		    member.setMe_study(study.getSt_num());
		}
		return false;
	}
	
	//[모집게시판 > 스터디생성 > 파일 업로드]
	private void uploadFiles(MultipartFile[] files, int st_num, String fi_table) {
		if (files == null || files.length == 0)
			return;
		// 파일 업로드 반복
		for (MultipartFile file : files) {
			if (file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			// 실제 파일 없로드
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 업로드된 파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, st_num);
			fileVo.setFi_table(fi_table);
			// 파일객체의 st_num을 fi_ex_num으로 설정
			fileVo.setFi_ex_num(st_num);
			//파일 추가
			gatherDao.insertFile(fileVo);
		}
	}

	//[모집게시판 > 모집글 작성]
	/**@param member : 로그인 되어있는 회원 아이디가져옴
	 * @param gather : gather에 저장
	 * @param study : 멤버
	 * 
	 */
	@Override
	public boolean insertGather(MemberVO member, GatherVO gather) {
		if (member == null)
			return false;
		if (!checkGather(gather))
			return false;
		gather.setGa_me_id(member.getMe_id());

		return gatherDao.insertGather(gather);
	}

	//[모집게시판 > 모집글 작성할때 게시글 다작성되었는지 확인하기]
	private boolean checkGather(GatherVO gather) {
		if (gather == null || gather.getGa_title() == null || gather.getGa_title().trim().length() == 0
				|| gather.getGa_content() == null || gather.getGa_content().trim().length() == 0)
			return false;
		return true;
	}

	
	//[모집게시판 > 메인]
		//스터디 & 모집글 불러오기
	@Override
	public ArrayList<StudyVO> selectStudyAll(GatherCriteria gcri) {
		return gatherDao.selectStudyAll(gcri);
	}

	@Override
	public ArrayList<FileVO> selectFileList() {
		return gatherDao.selectFileList();
	}
	
	@Override
	public ArrayList<TagRegisterVO> selectTagList() {
		ArrayList<TagRegisterVO> tagList = gatherDao.selectTagList();
		return tagList;
	}
	
	@Override
	/**@param st_num : 모집글 상세보기로 들어갔을 때 st_num을 통해 조회수증가
	 */
	public GatherVO getGather(int st_num) {
		gatherDao.countViews(st_num);
		return gatherDao.selectGather(st_num);
	}

	@Override
	public StudyVO getStudy(int st_num) {
		return gatherDao.selectStudy(st_num);
	}

	
	@Override
	public int getStudyTotalCount(GatherCriteria gcri) {
		Integer totalCount = gatherDao.selectStudyTotalCount(gcri);
		return totalCount != null ? totalCount : 0;
	}

	
	@Override
	public ArrayList<Integer> selectWantedStudyList(MemberVO user) {
		if (user == null)
			return null;
		return gatherDao.selectWantedStudyList(user.getMe_id());
	}

	@Override
	public ArrayList<Integer> selectStudyMemberList(MemberVO user) {
		if (user == null)
			return null;
		return gatherDao.selectStudyMemberList(user.getMe_id());
	}

	@Override
	public StudyMemberVO selelctJoinStudyMemberList(MemberVO user, int st_num) {
		if (user == null)
			return null;
		return gatherDao.selelctJoinStudyMemberList(user.getMe_id(), st_num);
	}

	@Override
	public ArrayList<StudyVO> selectStudyById(MemberVO member) {
		if (member == null)
			return null;
		return gatherDao.selectStudyById(member.getMe_id());
	}

	@Override
	public ArrayList<GatherVO> selectGatherAll() {
		return gatherDao.selectGatherAll();
	}

	@Override
	public GatherVO getGatherByComment(int co_num) {
		if (co_num == 0)
			return null;
		return gatherDao.getGatherByComment(co_num);
	}
	
	//[모집게시판 > 메인 > 검색]
		//태그검색
	@Override
	public ArrayList<String> getSearchTagList(String search) {
		return gatherDao.selectSearchTagList(search);
	}
		
	@Override
	public ArrayList<GatherVO> findGatherdById(String me_id) {
		return gatherDao.findGatherdById(me_id);
	}
	
	//[모집게시판 > 모집글 수정]
	@Override
	public GatherVO selectGather(int ga_num, MemberVO user) {
		return gatherDao.selectGatherByGaNum(ga_num,user);
	}

	@Override
	public boolean updateGather(GatherVO gather) {
		if(!checkGather(gather))
			return false;
		return gatherDao.updateGather(gather);
	}
	
	//[모집게시판 > 모집글 삭제]
	@Override
	public void deleteGather(int ga_num) {
		gatherDao.deleteGather(ga_num);
		
	}
	
	@Override
	public StudyVO selectStudy(int st_num) {
		return gatherDao.selectStudyByStNum(st_num);
	}

	@Override
	public FileVO selectFileByStNum(int st_num) {
		return gatherDao.selectFileByStNum(st_num);
	}

	@Override
	public ArrayList<String> selectTagListByStNum(int st_num) {
		return gatherDao.selectTagListByStNum(st_num);
	}

	/**[스터디관리 > 스터디 수정]
	 * @param : fileNums : 기존에 있던 파일을 삭제하기 위해 fi_num을 가져옴
	 */
	@Override
	public boolean editStudy(StudyVO study, MemberVO member, RegionVO region, MultipartFile[] files,FileVO file, Integer fileNums,
			TagVO tag, TagRegisterVO tagRegister,int st_num) {
		if (member == null) {
			return false;
		}
		//study를 생성할때 스터디명 길이가 0 또는 총인원 설정을 1보다 작게 하면 return false		
		if (study.getSt_name().trim().length() == 0 || study.getSt_total_people() < 1) {
			return false;
		}
		//study테이블 업데이트(스터디VO와 , 스터디번호)
		gatherDao.updateStudy(study,st_num);
		//기존 tagRegister에 스터디번호로 있던 태그들 삭제
		gatherDao.deleteTagByStNum(tagRegister,st_num);
		
		String[] tags = tag.getTa_name().split(",");
		ArrayList<TagVO> tagList = new ArrayList<>();
			
		// 새롭게 다시 태그 추가
		for (String tagName : tags) {
			tagName = tagName.trim();
			if (tagName.isEmpty()) {
				continue;
			}
			ArrayList<TagVO> tagVOList = gatherDao.selectTag(tagName);
			if (tagVOList.isEmpty()) {
				TagVO tagVO = new TagVO();
				tagVO.setTa_name(tagName);
				gatherDao.insertTag(tagVO);
				tagVOList.add(tagVO);
			}
			TagVO tagVO = tagVOList.get(0);
			tagList.add(tagVO);
			gatherDao.insertStudyTag(study.getSt_num(), tagVO.getTa_name());
		}
		//파일을 바꾸면 기존 파일 삭제
		if(fileNums != null)
			gatherDao.deleteFileByStNum(fileNums);
		
		// 파일 추가
		if (files != null && files.length > 0) {
			uploadFiles(files, study.getSt_num(), file.getFi_table());
		}
		
		
		return true;
	}
	


}
