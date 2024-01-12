package com.alanskrzecz.zookeeper;

public class Gorilla extends Mammal {
	
	public Gorilla() {};
	
	public Mammal throwSomething(){
		System.out.println("The gorilla has thrown something.");
		this.setEnergy(this.getEnergy() - 5);
		return this;
	}
	
	public Mammal eatBananas(){
		System.out.println("The gorilla is eating a banana. The gorilla is happy");
		this.setEnergy(this.getEnergy() + 10);
		return this;
	}
	
	public Mammal climb(){
		System.out.println("The gorilla has climbed the tree.");
		this.setEnergy(this.getEnergy() - 10);
		return this;
	}

}
