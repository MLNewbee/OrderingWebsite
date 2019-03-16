package com.eight.beans;

public class Goods {
	private String kinds;
	private String name;
	private int price;
	private int number;
	private int id;
	private int supplier;
	private String img;
	
	public Goods(String kinds,String name,int price,int number,int id,int supplier,String path){
		this.kinds=kinds;
		this.name=name;
		this.price=price;
		this.number=number;
		this.id=id;
		this.supplier=supplier;
		this.img=path;
	}
	
	public String getKinds(){
		return this.kinds;
	}
	
	public void setKinds(String kinds){
		this.kinds=kinds;
	}
	
	public String getName(){
		return this.name;
	}

	public void setName(String name){
		this.name=name;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSupplier() {
		return supplier;
	}

	public void setSupplier(int supplier) {
		this.supplier = supplier;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
