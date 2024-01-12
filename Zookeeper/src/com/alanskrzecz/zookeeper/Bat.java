package com.alanskrzecz.zookeeper;

public class Bat extends Mammal{
	

	public Bat() {
		this.setEnergy(this.getEnergy() + 200);
	}
	
	public Mammal fly(){
		System.out.println("Batdzilla is airborne.");
		this.setEnergy(this.getEnergy() - 50);
		return this;
	}
	
	public Mammal eatHumans(){
		System.out.println("Batdzilla is eating a human. Batdzilla is happy");
		this.setEnergy(this.getEnergy() + 25);
		return this;
	}
	
	public Mammal attackTown(){
		System.out.println("Batdzilla conquered another city.");
		this.setEnergy(this.getEnergy() - 100);
		return this;
	}

}
