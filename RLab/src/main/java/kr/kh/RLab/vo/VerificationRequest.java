package kr.kh.RLab.vo;

public class VerificationRequest {
    private String verificationCode;

    public VerificationRequest() {
    }

    public VerificationRequest(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }
}