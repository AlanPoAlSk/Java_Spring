package com.alanskrzecz.dojoandninjas.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="ninjas")
public class Ninja {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	
	@NotNull
	@Size(min=2, message="Ninja's first name must be at least 2 characters")
	private String ninjaFirstName;
	
	@NotNull
	@Size(min=2, message="Ninja's last name must be at least 2 characters")
	private String ninjaLastName;
	
	@NotNull(message="Age can't be null")
    @Min(18)
    private Integer ninjaAge;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
	
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="dojo_id")
    private Dojo dojo;
    
    
    
	
	public Ninja() {}	


	public Dojo getDojo() {
		return dojo;
	}

	public void setDojo(Dojo dojo) {
		this.dojo = dojo;
	}
	
	public String getNinjaFirstName() {
		return ninjaFirstName;
	}

	public void setNinjaFirstName(String ninjaFirstName) {
		this.ninjaFirstName = ninjaFirstName;
	}

	public String getNinjaLastName() {
		return ninjaLastName;
	}

	public void setNinjaLastName(String ninjaLastName) {
		this.ninjaLastName = ninjaLastName;
	}

	public Integer getNinjaAge() {
		return ninjaAge;
	}

	public void setNinjaAge(Integer ninjaAge) {
		this.ninjaAge = ninjaAge;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

}
