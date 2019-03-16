package com.eight.beans;

import java.util.Date;

public class Order {
	private User aSupplier=new User();
	private User aConsumer=new User();
	private Goods aGoods=new Goods(null, null, 0, 0, 0, 0, null);
	private Comment aComment=new Comment();
	
	private int id;
	private Date start_time;
	private String end_time;
	private String status;
	private int amount;
	private int sum;
	private int supplier;
	private int consumer;
	private int comment;
	private int goods;
	
	public Order(int id,Date start_time,String end_time,String status,int amount,int sum,int supplier,int consumer,int comment,int goods){
		this.setId(id);
		this.setStart_time(start_time);
		this.setEnd_time(end_time);
		this.setStatus(status);
		this.setAmount(amount);
		this.setSum(sum);
		this.setSupplier(supplier);
		this.setConsumer(consumer);
		this.setComment(comment);
		this.setGoods(goods);
	}

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getConsumer() {
		return consumer;
	}

	public void setConsumer(int consumer) {
		this.consumer = consumer;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getSupplier() {
		return supplier;
	}

	public void setSupplier(int supplier) {
		this.supplier = supplier;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public int getGoods() {
		return goods;
	}

	public void setGoods(int goods) {
		this.goods = goods;
	}

}
