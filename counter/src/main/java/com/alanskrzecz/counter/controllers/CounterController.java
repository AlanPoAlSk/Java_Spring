package com.alanskrzecz.counter.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class CounterController {
	@GetMapping("/")
	public String home(HttpSession session) {
		if (session.getAttribute("count") == null) {
			// Use setAttribute to initialize the count in session
			session.setAttribute("count", 0);
			}
			else {
			// increment the count by 1 using getAttribute and setAttribute
			Integer countSession = (Integer) session.getAttribute("count");
			session.setAttribute("count", countSession +1);
			}
		return "home";
	}
	
	
	@GetMapping("/counter")
	public String counter() {
		return "counter";
	}
	
	
	
	@GetMapping("/reset")
	public String reset(HttpSession session) {
		session.invalidate();
		return "home";
	}
	

}
