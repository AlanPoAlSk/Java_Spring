package com.alanskrzecz.zookeeper;

public class MammalTest {

	public static void main(String[] args) {
		
		Gorilla gorilla1 = new Gorilla();
		Bat batdzilla = new Bat();
		 
		System.out.println("Good Morning!The gorilla just woke up! His energy level is: " + gorilla1.getEnergy());
		
		gorilla1.throwSomething();
		gorilla1.displayEnergy();
		gorilla1.throwSomething();
		gorilla1.displayEnergy();
		gorilla1.throwSomething();
		gorilla1.displayEnergy();
		
		gorilla1.eatBananas();
		gorilla1.displayEnergy();
		gorilla1.eatBananas();
		gorilla1.displayEnergy();
		
		gorilla1.climb();
		
		gorilla1.displayEnergy();
		
		System.out.println("Good Morning!Batdzilla just woke up! His energy level is: " + batdzilla.getEnergy());
		
		batdzilla.attackTown();
		batdzilla.displayEnergy();
		batdzilla.attackTown();
		batdzilla.displayEnergy();
		batdzilla.attackTown();
		batdzilla.displayEnergy();
		
		batdzilla.eatHumans();
		batdzilla.displayEnergy();
		batdzilla.eatHumans();
		batdzilla.displayEnergy();
		
		batdzilla.fly();
		
		batdzilla.displayEnergy();

	}

}
