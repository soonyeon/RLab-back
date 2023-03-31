package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.dao.StudyDAO;
import kr.kh.RLab.utils.UploadFileUtils;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudyServiceImp implements StudyService{
	
	private final StudyDAO studyDao;
	String uploadPath = "D:\\uploadfiles";

	@Override
	public ArrayList<PhotoTypeVO> getListPhotoType() {
		return studyDao.getPhotoType();
	}

	@Override
	public boolean insertCB(PhotoVO photo, MemberVO member,MultipartFile[] files,FileVO file) {
		if(member == null)
			return false;
		photo.setPh_me_id(member.getMe_id());
		
		//게시글 등록
		studyDao.insertCB(photo);
	    if (files != null && files.length > 0) {
	        uploadFiles(files, photo.getPh_num(), file.getFi_table());
	    }
	    

	    return true;
	}
	
	private void uploadFiles(MultipartFile[] files, int st_num, String fi_table) {
	    if (files == null || files.length == 0)
	        return;
	    // 반복문
	    for (MultipartFile file : files) {
	        if (file == null || file.getOriginalFilename().length() == 0)
	            continue;
	        String fileName = "";
	        // 첨부파일 서버에 업로드
	        try {
	            fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        // 첨부파일 객체를 생성
	        FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, st_num);
	        
	        fileVo.setFi_table(fi_table);
	        // 파일 객체의 st_num 속성 값을 fi_ex_num으로 수정
	        fileVo.setFi_ex_num(st_num);
	        // 다오에게서 첨부파일 정보를 주면서 추가하라고 요청
	        studyDao.insertFile(fileVo);
	    }
	}



			
}
