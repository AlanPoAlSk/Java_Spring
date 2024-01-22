package com.alanskrzecz.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alanskrzecz.savetravels.models.SaveTravels;

@Repository
public interface SaveTravelsRepository extends CrudRepository<SaveTravels, Long>{
	
	List<SaveTravels> findAll();

}
