	package com.info.MysoreMart.Controller;

import com.info.MysoreMart.Model.Userprofile;
import com.info.MysoreMart.Service.CartService;
import com.info.MysoreMart.Service.OtpService;
import com.info.MysoreMart.Service.UserProfileService;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserProfileController {

    @Autowired
    private UserProfileService ups;
    
    @Autowired
    private CartService cartService;
    
    @Autowired
    private OtpService otpService;

   
    @GetMapping("/success")
    public String success() {
        return "success";  
    }

    

    // User Dashboard after login
    @GetMapping("/userDashboard")
    public String userDashboard( ) {
        return "userDashboard";  // Return userDashboard.jsp or userDashboard.html
    }
    
    // Registration endpoint
    @PostMapping("/register")
    @ResponseBody
    public String registerUser(
        @RequestParam(name = "fullName") String fullName,
        @RequestParam(name = "email") String email,
        @RequestParam(name = "phone") String phone,
        @RequestParam(name = "password") String password
    ) {
        // Check if full name already exists
        if (ups.isFullNameExists(fullName)) {
            return "Full name already exists. Please choose a different name.";
        }

        // Check if email already exists
        if (ups.isEmailExists(email)) {
            return "Email already exists. Please log in.";
        }

        // Check if phone already exists
        if (ups.isPhoneExists(phone)) {
            return "Phone number already exists. Please log in.";
        }

        // Create Userprofile object and set the fields
        Userprofile user = new Userprofile();
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setFullName(fullName);

        // Save user to the database
        ups.save(user);

        return "redirect:/login";  // Redirect to dashboard after successful registration
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<String> loginUser(
            @RequestParam(name = "emailOrPhone") String emailOrPhone,
            @RequestParam(name = "password") String password,
            HttpSession session
    ) {
        // Find the user by email or phone
        Userprofile user = null;
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);
        } else {
            user = ups.findByPhone(emailOrPhone);
        }

        // Validate user credentials
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);       // Store the user object in session
            session.setAttribute("userId", user.getId());  // Store user ID in session
            session.setAttribute("userLoggedIn", "true");
            
            
            int cartItemCount = cartService.getItemCountForUser(user.getId()); // Ensure this method works correctly
            session.setAttribute("cartItemCount", cartItemCount); // Set it in the session
            
            

            return ResponseEntity.ok("success");       
        } else {
            return ResponseEntity.status(401).body("Invalid email or password."); // Return failure message
        }
    }


    
    // Display password change form after checking if user exists
    @PostMapping("/forgot")
    public String forgotPassword(
            @RequestParam(name = "emailOrPhone") String emailOrPhone,
            HttpSession session
    ) {
        Userprofile user = null;
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);  // Check by email
        } else {
            user = ups.findByPhone(emailOrPhone);  // Check by phone
        }

        if (user != null) {
            // Generate OTP and send it to the user
            String otp = otpService.generateOtp(user);
            session.setAttribute("otp", otp);  // Store OTP in session
            session.setAttribute("userToChangePassword", user);  // Store user object in session

            return "passwordChange";  // Redirect to OTP verification page
        } else {
            return "redirect:/forgot?error=true";  // User not found
        }
    }
    
    @PostMapping("/verifyOtp")
    @ResponseBody
    public String verifyOtp(@RequestParam("otp") String otpEntered, HttpSession session) {
        String otpSession = (String) session.getAttribute("otp");
        if (otpSession != null && otpSession.equals(otpEntered)) {
            return "success"; // OTP is correct
        } else {
            return "error"; // OTP is incorrect
        }
    }

    @PostMapping("/passwordChange")
    @ResponseBody
    public String changePassword(@RequestParam("newPassword") String newPassword, HttpSession session) {
        Userprofile user = (Userprofile) session.getAttribute("userToChangePassword");
        if (user != null) {
            user.setPassword(newPassword); // Set new password
            boolean updateSuccess = ups.updatePassword(user); // Update password in the database
            if (updateSuccess) {
                return "Password updated successfully!";
            } else {
                return "Error updating password. Please try again.";
            }
        }
        return "User not found.";
    }



    @PostMapping("/checkEmailOrPhone")
    @ResponseBody
    public String checkEmailOrPhone(@RequestParam("emailOrPhone") String emailOrPhone) {
        // Check if it's an email or phone number
        Userprofile user = null;
        
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);  // Check by email
        } else {
            user = ups.findByPhone(emailOrPhone);  // Check by phone number
        }

        // If user is found, return "found", else return "not_found"
        if (user != null) {
            return "redirect:/passwordChange";  // User exists
        } else {
            return "not_found";  // User doesn't exist
        }
    }
    
    
    // Logout functionality
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // Invalidate the session to log out
        return "redirect:/";  // Redirect to index page after logout
    }
}// WORKING 
