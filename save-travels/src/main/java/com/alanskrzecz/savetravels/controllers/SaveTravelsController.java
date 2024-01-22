package com.alanskrzecz.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alanskrzecz.savetravels.models.SaveTravels;
import com.alanskrzecz.savetravels.services.SaveTravelsService;

import jakarta.validation.Valid;

@Controller
public class SaveTravelsController {
	
	@Autowired
	SaveTravelsService saveTravelsService;
	
	
	@GetMapping("/")
	public String page() {
		return "redirect:expenses";
	}
	
	@GetMapping("/expenses")
	public String index(Model model) {
		List <SaveTravels> saveTravels = saveTravelsService.allSaves();
		
		model.addAttribute("saveTravels", saveTravels);
		
		model.addAttribute("newExpense", new SaveTravels());
		
		return "index";
	}
	
	@PostMapping("/expenses")
	public String processCreateExpense(
			@Valid @ModelAttribute("newExpense") SaveTravels newExpense, BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			List <SaveTravels> saveTravels = saveTravelsService.allSaves();
			model.addAttribute("saveTravels", saveTravels);
			return "index";
		} else {
			saveTravelsService.createExpense(newExpense);
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/expenses/{id}")
	public String details(@PathVariable("id") Long id,  Model model) {
		SaveTravels expense = saveTravelsService.findOneById(id);
		model.addAttribute("expense", expense);
		return "details";
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		
		SaveTravels expense = saveTravelsService.findOneById(id);
		
		model.addAttribute("expense", expense);
		
		return "edit";
	}
	
	@PutMapping("/expenses/edit/{id}")
	public String processEditExpense(
			@Valid @ModelAttribute("expense") SaveTravels expense, BindingResult result, Model model
			) {
		if(result.hasErrors()) {
			List <SaveTravels> saveTravels = saveTravelsService.allSaves();
			model.addAttribute("saveTravels",saveTravels);
			return "edit";
		} else {
		saveTravelsService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@DeleteMapping("expenses/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		saveTravelsService.delete(id);
		return "redirect:/";
	}
	
	

}
