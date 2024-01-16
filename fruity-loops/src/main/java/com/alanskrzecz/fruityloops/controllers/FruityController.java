package com.alanskrzecz.fruityloops.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.alanskrzecz.fruityloops.models.Item;

@Controller
public class FruityController {
	@GetMapping("/")
	 public String index(Model model) {
	        
	   ArrayList<Item> fruits = new ArrayList<Item>();
	   fruits.add(new Item("Kiwi", 1.50));
	   fruits.add(new Item("Mango", 2.00));
	   fruits.add(new Item("Goji Berries", 4.00));
	   fruits.add(new Item("Guava", 0.75));
	        
	   model.addAttribute("fruits", fruits);     
	        
	   return "home";
	    
	}



}
