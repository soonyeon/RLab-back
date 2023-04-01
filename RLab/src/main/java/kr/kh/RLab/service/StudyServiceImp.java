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
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudyServiceImp implements StudyService {

    private final StudyDAO studyDao;
    String uploadPath = "D:\\uploadfiles";

    @Override
    public ArrayList<PhotoTypeVO> getListPhotoType() {
        return studyDao.getPhotoType();
    }

    @Override
    public boolean insertCB(PhotoVO photo, MultipartFile[] files, MemberVO member) {
        if (member == null)
            return false;
        photo.setPh_me_id(member.getMe_id());

        if (files != null && files.length > 0) {
            uploadFiles(files, photo.getPh_num(), photo);
        }

        return true;
    }

    private void uploadFiles(MultipartFile[] files, int st_num, PhotoVO photo) {
        if (files == null || files.length == 0)
            return;
        for (MultipartFile file : files) {
            if (file == null || file.getOriginalFilename().length() == 0)
                continue;
            String fileName = "";
            try {
                fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
                photo.setPh_img(fileName);
                studyDao.insertCB(photo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

	@Override
	public StudyVO getStudyByMemberId(String me_id) {
		return studyDao.getStudyByMemberId(me_id);
	}
}