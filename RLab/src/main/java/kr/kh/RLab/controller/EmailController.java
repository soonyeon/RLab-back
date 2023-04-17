package kr.kh.RLab.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.RLab.service.EmailService;
import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.VerificationRequest;

@Controller
public class EmailController {
	
    @Autowired
    private EmailService emailService;
    @Autowired
	private MemberService memberService;

    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    @ResponseBody
    public byte[] sendEmail(HttpServletRequest request, @RequestParam("email") String email) throws UnsupportedEncodingException {
        String verificationCode = emailService.generateVerificationCode();
        HttpSession session = request.getSession();
        session.setAttribute("verificationCode", verificationCode);
        session.setMaxInactiveInterval(300); // 코드 유효 시간 설정 (5분)

        emailService.sendEmail(email, "회원가입 인증 번호", "인증 번호: " + verificationCode);
        
        return "인증번호가 이메일로 전송 되었습니다.".getBytes("UTF-8");
    }
    
    @PostMapping("/check")
    @ResponseBody
    public boolean checkVerificationCode(@RequestBody VerificationRequest request, HttpSession session) {
        String storedVerificationCode = (String) session.getAttribute("verificationCode");
        boolean isVerified = request.getVerificationCode().equals(storedVerificationCode);

        if (isVerified) {
            session.setAttribute("isVerified", true);
            return true;
        } else {
            return false;
        }
    }
    
    @PostMapping("/findID")
	@ResponseBody
	public String findID(@RequestParam("email") String email) {
		String foundID = memberService.findIDByEmail(email);
		if (foundID != null) {
			emailService.sendEmail(email, "회원님의 아이디 찾기 결과", "회원님이 요청하신 아이디는 다음과 같습니다: " + foundID);
			return "found";
		} else {
			return "not found";
		}
	}

	@PostMapping("/findPW")
	@ResponseBody
	public String findPW(@RequestParam("id") String id, @RequestParam("email") String email) {
		MemberVO memberVO = memberService.findPWByEmail(id, email);
		if (memberVO != null) {
			String tempPW = memberService.generateTempPW();
			memberService.updatePW(memberVO, tempPW);
			emailService.sendEmail(email, "회원님의 비밀번호 찾기 결과",
					"회원님이 요청하신 아이디의 임시비밀번호는 다음과 같습니다: " + tempPW + " 로그인 후 회원정보 수정에서 비밀번호를 수정해주세요.");
			return "found";
		} else {
			return "not found";
		}
	}
    
    
}