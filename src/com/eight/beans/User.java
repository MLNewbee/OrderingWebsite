package com.eight.beans;

public class User {
	private String username;
	private String password;
	private String phonenum;
	private String company;
	private String address;
	private String Isactive;
	private int id;
	
	public User(int id,String username,String password,String phonenum,String company,String address,String Isactive ){
		this.id=id;
		this.username=username;
		this.password=password;
		this.phonenum=phonenum;
		this.company=company;
		this.address=address;
		this.setIsactive(Isactive);
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public void setUsername(String username){
		this.username=username;
	}
	
	public String getUsername(){
		return this.username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIsactive() {
		return Isactive;
	}

	public void setIsactive(String isactive) {
		Isactive = isactive;
	}
}
