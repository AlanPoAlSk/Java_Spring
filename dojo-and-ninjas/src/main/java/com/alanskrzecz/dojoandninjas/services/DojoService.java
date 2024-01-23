package com.alanskrzecz.dojoandninjas.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alanskrzecz.dojoandninjas.models.Dojo;
import com.alanskrzecz.dojoandninjas.models.Ninja;
import com.alanskrzecz.dojoandninjas.repositories.DojoRepository;
import com.alanskrzecz.dojoandninjas.repositories.NinjaRepository;

@Service
public class DojoService {
	private final DojoRepository dojoRepository;
	private final NinjaRepository ninjaRepository;

	public DojoService(DojoRepository dojoRepository , NinjaRepository ninjaRepository) {
		this.dojoRepository = dojoRepository;
		this.ninjaRepository = ninjaRepository;
	}
	
	// findAll
	public List<Dojo> allDojos(){
		return dojoRepository.findAll();
	}
	
	//findOne
	public Dojo getDojoById(Long id) {
	    return dojoRepository.findById(id).orElse(null);
	}

	
	
	//create
	public Dojo addDojo(Dojo newDojo) {
		return dojoRepository.save(newDojo);
	}
	
	//update
	public Dojo updateDojo(Dojo dojo) {
		return dojoRepository.save(dojo);
	}
	
	//delete
	public void deleteDojo(Long id) {
		dojoRepository.deleteById(id);
	}
	
	public List<Ninja> getNinjasByDojoId(Long dojoId) {
        return ninjaRepository.findByDojoId(dojoId);
    }
}
