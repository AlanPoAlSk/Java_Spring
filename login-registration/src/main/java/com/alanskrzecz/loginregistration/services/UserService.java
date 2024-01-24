package com.alanskrzecz.loginregistration.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.alanskrzecz.loginregistration.models.LoginUser;
import com.alanskrzecz.loginregistration.models.User;
import com.alanskrzecz.loginregistration.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public User registration(User newUser, BindingResult result) {
		Optional<User> optionalUser = userRepository.findByEmail(newUser.getEmail());
		
		if(optionalUser.isPresent()) {
			result.rejectValue("email", "unique" , "Email already registered");
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "Matches", "Confirm Password must match the Password");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		
		
		return userRepository.save(newUser);
	}
	
	public User login(LoginUser newLoginUser, BindingResult result) {
		
		Optional<User> potentialUser = userRepository.findByEmail(newLoginUser.getEmail());
		
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "Invalid credentials");
			return null;
		}
		
		User user = potentialUser.get();
		
		if(!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid credentials");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		return user;
	}
	
}
