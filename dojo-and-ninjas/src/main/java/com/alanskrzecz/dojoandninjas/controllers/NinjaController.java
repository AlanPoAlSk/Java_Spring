package com.alanskrzecz.dojoandninjas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.alanskrzecz.dojoandninjas.models.Dojo;
import com.alanskrzecz.dojoandninjas.models.Ninja;
import com.alanskrzecz.dojoandninjas.services.DojoService;
import com.alanskrzecz.dojoandninjas.services.NinjaService;

import jakarta.validation.Valid;

@Controller
public class NinjaController {
	private final NinjaService ninjaService;
	private final DojoService dojoService;

	public NinjaController(NinjaService ninjaService, DojoService dojoService) {
		this.ninjaService = ninjaService;
		this.dojoService = dojoService;
	}
	
	@GetMapping("/ninjas/new")
	public String newNinjaForm(Model model) {
		model.addAttribute("newNinja", new Ninja());
		model.addAttribute("dojoList", dojoService.allDojos());
		return "newNinja";
	}
	
	@PostMapping("/ninjas/new")
	public String processNewNinja(
			@Valid @ModelAttribute("newNinja") Ninja newNinja, BindingResult result, Model model
			) {
		System.out.println("Processing new Ninja");
		 if (result.hasErrors()) {
		        model.addAttribute("dojoList", dojoService.allDojos());
		        return "newNinja";
		    } else {
		        Dojo selectedDojo = dojoService.getDojoById(newNinja.getDojo().getId());
		        newNinja.setDojo(selectedDojo);

		        ninjaService.addNinja(newNinja);
		        return "redirect:/ninjas/new";
		     }
	}
	
}
