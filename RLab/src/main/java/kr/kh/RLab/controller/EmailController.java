package kr.kh.RLab.controller;

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
import kr.kh.RLab.vo.VerificationRequest;

@Controller
public class EmailController {
	
    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    @ResponseBody
    public String sendEmail(HttpServletRequest request, @RequestParam("email") String email) {
        String verificationCode = emailService.generateVerificationCode();
        HttpSession session = request.getSession();
        session.setAttribute("verificationCode", verificationCode);
        session.setMaxInactiveInterval(300); // 코드 유효 시간 설정 (5분)

        emailService.sendEmail(email, "회원가입 인증 번호", "인증 번호: " + verificationCode);
        
        return "이메일 전송";
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
    
    
}