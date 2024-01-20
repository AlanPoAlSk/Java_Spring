package com.alanskrzecz.burgertracker.controllers;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alanskrzecz.burgertracker.models.Burger;
import com.alanskrzecz.burgertracker.services.BurgerService;

import jakarta.validation.Valid;

@Controller
public class BurgerController {
	
	
	@Autowired
	BurgerService burgerService;
	
	@GetMapping("/")
	public String index(Model model) {
		List <Burger> burgers = burgerService.allBurgers();
		
		model.addAttribute("burgers",burgers);
		
		model.addAttribute("newBurgerReview", new Burger());
		
		return "index";
	}
	
	@PostMapping("/")
	public String processCreateBurgerReview(
			@Valid @ModelAttribute("newBurgerReview") Burger newBurgerReview, BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			List <Burger> burgers = burgerService.allBurgers();
			model.addAttribute("burgers",burgers);
			return "index";
		} else {
			burgerService.createBurgerReview(newBurgerReview);
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/burgers/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		
		Burger burger = burgerService.findOneById(id);
		
		model.addAttribute("burger",burger);
		
		return "edit";
	}
	
	
	@PutMapping("/burgers/edit/{id}")
	public String processEditBurgerReview(
			@Valid @ModelAttribute("burger") Burger burger, BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			List <Burger> burgers = burgerService.allBurgers();
			model.addAttribute("burgers",burgers);
			return "edit";
		} else {
			burgerService.updateBurgerReview(burger);
			return "redirect:/";
		}
		
	}

}
