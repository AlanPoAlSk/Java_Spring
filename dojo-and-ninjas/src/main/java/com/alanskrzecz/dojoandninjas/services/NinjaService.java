package com.alanskrzecz.dojoandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alanskrzecz.dojoandninjas.models.Ninja;
import com.alanskrzecz.dojoandninjas.repositories.NinjaRepository;

import jakarta.transaction.Transactional;

@Service
public class NinjaService {
	private final NinjaRepository ninjaRepository;

	public NinjaService(NinjaRepository ninjaRepository) {
		this.ninjaRepository = ninjaRepository;
	}
	
	// findAll
	public List<Ninja> allNinjas(){
		return ninjaRepository.findAll();
	}
		
	//findOne
	public Ninja oneNinja(Long id) {
		Optional <Ninja> optionalNinja = ninjaRepository.findById(id);
		if(optionalNinja.isPresent()) {
			return optionalNinja.get();
		} else {
			return null;
		}
	}
	
	
	
	@Transactional
	public Ninja addNinja(Ninja newNinja) {
	    return ninjaRepository.save(newNinja);
	}
	//update
	//delete
	
}
