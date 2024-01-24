package com.alanskrzecz.loginregistration.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.alanskrzecz.loginregistration.models.LoginUser;
import com.alanskrzecz.loginregistration.models.User;
import com.alanskrzecz.loginregistration.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	// import Service
	private final UserService userService;
	
	
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/")
	public String loginRegistration(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLoginUser", new LoginUser());
		return "logreg";
	}
	
	@PostMapping("/register")
	public String processRegistration(
			@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session
			) {
		User registeredUser = userService.registration(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLoginUser", new LoginUser());
			return "logreg";
		} else {
			session.setAttribute("userId", registeredUser.getId());
			session.setAttribute("username", registeredUser.getUsername());
			return "redirect:/welcome";
		}
	}
	
	@PostMapping("/login")
	public String processLogin(
			@Valid @ModelAttribute("newLoginUser") LoginUser newLoginUser, BindingResult result, Model model, HttpSession session
			) {
		User loggedUser = userService.login(newLoginUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "logreg";
		}  else {
			session.setAttribute("userId", loggedUser.getId());
			session.setAttribute("username", loggedUser.getUsername());
			return "redirect:/welcome";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}	
