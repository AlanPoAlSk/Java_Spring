package com.alanskrzecz.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alanskrzecz.savetravels.models.SaveTravels;
import com.alanskrzecz.savetravels.repositories.SaveTravelsRepository;

@Service
public class SaveTravelsService {
	private final SaveTravelsRepository saveTravelsRepository;
	
	public SaveTravelsService(SaveTravelsRepository saveTravelsRepository) {
		this.saveTravelsRepository = saveTravelsRepository;
	}
	
	// find all
	
	public List<SaveTravels> allSaves(){
		return saveTravelsRepository.findAll();
	}
	
	//create one
	
	public SaveTravels createExpense(SaveTravels saveTravels) {
		return saveTravelsRepository.save(saveTravels);
	}
	
	// find one
	
	public SaveTravels findOneById(Long id) {
		Optional<SaveTravels> optionalSaveTravels = saveTravelsRepository.findById(id);
		if(optionalSaveTravels.isPresent()) {
			return optionalSaveTravels.get();
		} else {
			return null;
		}
	}
	
	// update
	
	public SaveTravels updateExpense(SaveTravels saveTravels) {
		return saveTravelsRepository.save(saveTravels);
	}

	public void delete(Long id) {
		saveTravelsRepository.deleteById(id);
		
	}

}
