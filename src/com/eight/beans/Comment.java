package com.eight.beans;

public class Comment {
	
	private int star;
	private String comment;
	
	public Comment(){}
	public Comment(int star,String comment)
	{
		setStar(star);
		setComment(comment);
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

}
