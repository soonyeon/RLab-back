package kr.kh.RLab.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.dao.GatherDAO;
import kr.kh.RLab.utils.UploadFileUtils;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Service
public class GatherServiceImp implements GatherService{

	private final GatherDAO gatherDao; 
	String uploadPath = "D:\\uploadfiles";
	
	@Override 
	public boolean insertStudy(StudyVO study, MemberVO member,RegionVO region,MultipartFile [] files,FileVO file) {
		System.out.println(study);
		System.out.println(member);
		System.out.println(files);
		
	    if (member == null) {
	        return false;
	    }
	    if (study.getSt_name().trim().length()==0 || study.getSt_total_people() < 1 ) {
	        return false;
	    }
	    study.setSt_me_id(member.getMe_id()); 
	    gatherDao.insertStudy(study); 
	    uploadFiles(files,study.getSt_num(),file.getFi_table());
		return true;
	}
	
	private void uploadFiles(MultipartFile [] files, int st_num,String fi_table) {
		if(files == null || files.length == 0)
			return ;
		//반복문
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			//첨부파일 서버에 업로드
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes()); 
			} catch (Exception e) {
				e.printStackTrace();
			} 
			//첨부파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName,st_num);
			fileVo.setFi_table(fi_table);
			//다오에게서 첨부파일 정보를 주면서 추가하라고 요청
			gatherDao.insertFile(fileVo);
		}
	}
    

		
}