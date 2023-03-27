package kr.kh.RLab.service;

public interface EmailService {
    void sendEmail(String to, String subject, String message);
    String generateVerificationCode();
}
