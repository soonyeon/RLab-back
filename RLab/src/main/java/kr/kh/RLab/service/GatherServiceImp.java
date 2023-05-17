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
	private final MypageDAO mypageDao;
	String uploadPath = "D:\\uploadfiles";

	@Override
	public boolean insertStudy(StudyVO study, MemberVO member, RegionVO region, MultipartFile[] files, FileVO file,
			TagVO tag, TagRegisterVO tagRegister, StudyMemberVO studyMember) {
		if (member == null) {
			return false;
		}
		
		
		if (study.getSt_name().trim().length() == 0 || study.getSt_total_people() < 1) {
			return false;
		}
		study.setSt_me_id(member.getMe_id());
		gatherDao.insertStudy(study);
		studyMember.setSm_me_id(member.getMe_id());
		studyMember.setSm_st_num(study.getSt_num());
		gatherDao.insertStudyLeader(studyMember);
		
		String[] tags = tag.getTa_name().split(",");
		ArrayList<TagVO> tagList = new ArrayList<>();
		
		
		// 태그 추가
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

		// 파일 추가
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

	private void uploadFiles(MultipartFile[] files, int st_num, String fi_table) {
		if (files == null || files.length == 0)
			return;
		// 諛섎났臾�
		for (MultipartFile file : files) {
			if (file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			// 泥⑤��뙆�씪 �꽌踰꾩뿉 �뾽濡쒕뱶
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 泥⑤��뙆�씪 媛앹껜瑜� �깮�꽦
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, st_num);

			fileVo.setFi_table(fi_table);
			// �뙆�씪 媛앹껜�쓽 st_num �냽�꽦 媛믪쓣 fi_ex_num�쑝濡� �닔�젙
			fileVo.setFi_ex_num(st_num);
			// �떎�삤�뿉寃뚯꽌 泥⑤��뙆�씪 �젙蹂대�� 二쇰㈃�꽌 異붽��븯�씪怨� �슂泥�
			gatherDao.insertFile(fileVo);
		}
	}

	// 紐⑥쭛湲�
	@Override
	public boolean insertGather(MemberVO member, GatherVO gather, StudyVO study) {
		if (member == null)
			return false;
		if (!checkGather(gather))
			return false;
		gather.setGa_me_id(member.getMe_id());
		// gather.setGa_st_num(study.getSt_num());

		return gatherDao.insertGather(gather);
	}

	private boolean checkGather(GatherVO gather) {
		if (gather == null || gather.getGa_title() == null || gather.getGa_title().trim().length() == 0
				|| gather.getGa_content() == null || gather.getGa_content().trim().length() == 0)
			return false;
		return true;
	}

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
	public ArrayList<Integer> selectStudyList() {
		return gatherDao.selectStudyList();
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
	
	@Override
	public ArrayList<String> getSearchTagList(String search) {
		return gatherDao.selectSearchTagList(search);
	}

	@Override
	public ArrayList<GatherVO> findGatherdById(String me_id) {
		return gatherDao.findGatherdById(me_id);
	}

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

	//스터디 수정
	@Override
	public boolean editStudy(StudyVO study, MemberVO member, RegionVO region, MultipartFile[] files,FileVO file, Integer fileNums,
			TagVO tag, TagRegisterVO tagRegister,int st_num) {
		if (member == null) {
			return false;
		}
		if (study.getSt_name().trim().length() == 0 || study.getSt_total_people() < 1) {
			return false;
		}

		gatherDao.updateStudy(study,st_num);
		gatherDao.deleteTagByStNum(tagRegister,st_num);
		
		String[] tags = tag.getTa_name().split(",");
		ArrayList<TagVO> tagList = new ArrayList<>();
			
		// 태그 추가
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
		if(fileNums != null)
			gatherDao.deleteFileByStNum(fileNums);
		
		// 파일 추가
		if (files != null && files.length > 0) {
			uploadFiles(files, study.getSt_num(), file.getFi_table());
		}
		
		
		return true;
	}
	


}
