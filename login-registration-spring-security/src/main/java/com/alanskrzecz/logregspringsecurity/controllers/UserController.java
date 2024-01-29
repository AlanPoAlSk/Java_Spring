package com.alanskrzecz.logregspringsecurity.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alanskrzecz.logregspringsecurity.models.User;
import com.alanskrzecz.logregspringsecurity.services.UserService;
import com.alanskrzecz.logregspringsecurity.validator.UserValidator;


import jakarta.validation.Valid;

@Controller
public class UserController {
	private UserService userService;
    
	private UserValidator userValidator;
	
	public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
        // 1
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "homePage";
    }
    
    @RequestMapping("/register")
    public String registerForm(@ModelAttribute("user") User user) {
        return "registrationPage";
    }
    
    @PostMapping("/register")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
    	userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registrationPage";
        }
        userService.saveUserWithAdminRole(user);
        return "redirect:/login";
    }
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "adminPage";
    }
    
 // 1
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage";
    }
}
