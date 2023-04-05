package kr.kh.RLab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/study")
public class StudyController {
	
	private final StudyService StudyServcie;
	
	@GetMapping("/certificationBoard")
	public String certificationBoard(HttpServletRequest request,Model model) {
		ArrayList<PhotoTypeVO> phototypeList = StudyServcie.getListPhotoType();
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		StudyVO study = StudyServcie.getStudyByMemberId(member.getMe_id());
		int st_num = study.getSt_num();
		List<PhotoVO> photos = StudyServcie.getPhotosByStudyNum(st_num);
		//좋아요
		Map<Integer, Integer> likeCounts = new HashMap<>();
	    Map<Integer, Boolean> userLikes = new HashMap<>();
	    for (PhotoVO photo : photos) {
	        int li_ph_num = photo.getPh_num();
	        int likeCount = StudyServcie.countLikesByPhotoId(li_ph_num);
	        LikeVO userLike = StudyServcie.getLikeByUserIdAndPhotoId(member.getMe_id(), li_ph_num);

	        likeCounts.put(li_ph_num, likeCount);
	        userLikes.put(li_ph_num, userLike != null && userLike.getLi_state() == 1);
	    }
		
		model.addAttribute("memberId", member);
		model.addAttribute("ptList", phototypeList );
	    model.addAttribute("photos", photos);
	    model.addAttribute("likeCounts", likeCounts);
	    model.addAttribute("userLikes", userLikes);
		return "/study/certification_board";
	}
	
	@PostMapping("/insertCB")
	@ResponseBody
	public String insertCB(@RequestParam("photo") MultipartFile[] files,
	                       @RequestParam("content") String content,
	                       @RequestParam("ph_pt_num") String ph_pt_num,
	                       HttpServletRequest request) {
	    MemberVO member = (MemberVO) request.getSession().getAttribute("user");
	    StudyVO study = StudyServcie.getStudyByMemberId(member.getMe_id());
	    PhotoVO photoVO = new PhotoVO();
	    photoVO.setPh_content(content);
	    photoVO.setPh_pt_num(Integer.parseInt(ph_pt_num));
	    photoVO.setPh_st_num(study.getSt_num()); //스터디 번호 가져오기
	    
	    
	    if (StudyServcie.insertCB(photoVO, files, member)) {
	        return "success";
	    } else {
	        return "error";
	    }
	}
	
	 @PostMapping("/toggleLike")
	    @ResponseBody
	    public String toggleLike(@RequestParam("li_ph_num") int li_ph_num, HttpServletRequest request) {
	        MemberVO member = (MemberVO) request.getSession().getAttribute("user");
	        String li_me_id = member.getMe_id();

	        LikeVO likeVO = StudyServcie.getLikeByUserIdAndPhotoId(li_me_id, li_ph_num);

	        if (likeVO == null) {
	            // 좋아요가 존재하지않으면,
	            LikeVO newLike = new LikeVO();
	            newLike.setLi_me_id(li_me_id);
	            newLike.setLi_ph_num(li_ph_num);
	            newLike.setLi_state(1);
	            StudyServcie.insertLike(newLike);
	            return "inserted";
	        } else {
	            // 좋아요가 존재하면, 
	            int new_li_state = likeVO.getLi_state() == 1 ? 0 : 1;
	            StudyServcie.updateLikeStatus(li_me_id, li_ph_num, new_li_state);
	            return new_li_state == 1 ? "updated" : "canceled";
	        }
	    }
	 
	 @RequestMapping(value = "/management")
		public ModelAndView management(ModelAndView mv) {
			mv.setViewName("study/management_study");
			return mv;
		}

	 
	 
	 
	 
	 
	 
	 

	
}
