package com.alanskrzecz.daikichipathvariables.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/daikichi")
public class DaikichiController {
	
//	@GetMapping("")
//	public String index() {
//		return "Welcome";
//	}
	
	@GetMapping("/m/travel/{city}")
	public String main1( 
			@PathVariable("city") String city)
	{
		 return "Congratulations! You will soon travel to " + city + "!";
	}
	
	@GetMapping("/m/lotto/{number}")
	public String main2( 
			@PathVariable("number") Integer number)
	{
		if(number % 2 == 0) {
			return "You will take a grand journey in the near future, but be weary of tempting offers'.";
		}
		else {
			return "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends.";			
		}
	}
	
	

}
