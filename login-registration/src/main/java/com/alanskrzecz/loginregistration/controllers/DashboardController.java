package com.alanskrzecz.loginregistration.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class DashboardController {
	
	
	@GetMapping("/welcome")
	public String welcomeBoard(HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		return "welcome";
	}
}
