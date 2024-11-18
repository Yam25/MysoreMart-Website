package com.info.MysoreMart.Service;

import com.info.MysoreMart.Model.Userprofile;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class OtpService {

    public String generateOtp(Userprofile user) {
    	
        String otp = String.valueOf(new Random().nextInt(999999));
        
        otp = String.format("%06d", Integer.parseInt(otp));  

        // Send OTP to user
        sendOtpToUser(user, otp);

        return otp;  
    }

    private void sendOtpToUser(Userprofile user, String otp) {
        if (user.getEmail() != null) {
            sendOtpEmail(user.getEmail(), otp);  
        } else if (user.getPhone() != null) {
            sendOtpSms(user.getPhone(), otp);  
        }
    }

    private void sendOtpEmail(String email, String otp) {
        System.out.println("Sending OTP to email: " + otp); 
    }

    private void sendOtpSms(String phone, String otp) {
        System.out.println("Sending OTP to phone: " + otp);  
    }
}
