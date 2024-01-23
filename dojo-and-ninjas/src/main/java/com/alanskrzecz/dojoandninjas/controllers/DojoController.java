package com.alanskrzecz.dojoandninjas.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.alanskrzecz.dojoandninjas.models.Dojo;
import com.alanskrzecz.dojoandninjas.services.DojoService;
import com.alanskrzecz.dojoandninjas.services.NinjaService;

import jakarta.validation.Valid;

@Controller
public class DojoController {
	private final DojoService dojoService;
	private final NinjaService ninjaService;

	public DojoController(DojoService dojoService, NinjaService ninjaService) {
		this.dojoService = dojoService;
		this.ninjaService = ninjaService;
		
	}
	
	//create
	//1. render the form
	
	@GetMapping("/")
	public String index() {
		return "redirect:dojos/new";
	}
	
	@GetMapping("/dojos/new")
	public String newDojoForm(Model model) {
		model.addAttribute("newDojo", new Dojo());
		return "newDojo";
	}
	
	@PostMapping("/dojos/new")
	public String processNewDojo(
			@Valid @ModelAttribute("newDojo") Dojo newDojo, BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			model.addAttribute("ninjaList", ninjaService.allNinjas());
			return "newDojo";
		} else {
			dojoService.addDojo(newDojo);
			return "redirect:/dojos/new";
		}
	}
	
	@GetMapping("/dojos/{id}")
	public String dojoNinjas(@PathVariable Long id, Model model) {
		model.addAttribute("dojo", dojoService.getDojoById(id));
		model.addAttribute("ninjaList", dojoService.getNinjasByDojoId(id));
//		Dojo dojo = dojoService.getDojoById(id);
//	    List<Ninja> ninjaList = dojoService.getNinjasByDojoId(id);
//
//	    model.addAttribute("dojo", dojo);
//	    model.addAttribute("ninjaList", ninjaList);
		return "dojoNinjas";
	}
	
	
	

}
