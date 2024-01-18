package com.alanskrzecz.omikujiform.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
	@RequestMapping("/omikuji")
	public class OmikujiController {
		
		@GetMapping("")
			public String displayForm() {
				return "form";
			}
	
	
	
	//http://localhost:8080/sending?number=6&city=fdaf&person=afg&hobby=adfgad&thing=adfad
	@PostMapping("/sending")
	public String sending(
		@RequestParam("number") Integer number,
		@RequestParam("city") String city,
		@RequestParam("person") String person,
		@RequestParam("hobby") String hobby,
		@RequestParam("thing") String thing,
		@RequestParam("something") String something,
		HttpSession session
	) {
		session.setAttribute("number", number);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("hobby", hobby);
		session.setAttribute("thing", thing);
		session.setAttribute("something", something);
		
		return "redirect:/omikuji/show";
	}
	
	@GetMapping("/show")
	public String show() {
		
		return "show";
	}
		
		
	

}
