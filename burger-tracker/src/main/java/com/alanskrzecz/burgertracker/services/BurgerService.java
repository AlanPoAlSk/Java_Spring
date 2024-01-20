package com.alanskrzecz.burgertracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alanskrzecz.burgertracker.models.Burger;
import com.alanskrzecz.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {
	private final BurgerRepository burgerRepository;
	
	public BurgerService(BurgerRepository burgerRepository) {
		this.burgerRepository = burgerRepository;
	}
	
	public List<Burger> allBurgers(){
		return burgerRepository.findAll();
	}
	
	public Burger createBurgerReview(Burger burger) {
		return burgerRepository.save(burger);
	}

//	// find one
	public Burger findOneById(Long id) {
		Optional<Burger> optionalBurger = burgerRepository.findById(id);
		if(optionalBurger.isPresent()) {
			return optionalBurger.get();
		}else {
			return null;
		}	
	}
	
	// update
	public Burger updateBurgerReview(Burger burger) {
		return burgerRepository.save(burger);
	}

}
