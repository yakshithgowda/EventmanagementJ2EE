package com.ps.Model;

public class Feedback {
	
	private int bid;
	private String eName;
	private String cName;
	
	private int rating;
	private String comment;
	
	
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public Feedback() {
	}
	
	
	public Feedback(int bid, String eName, String cName, int rating, String comment) {
		super();
		this.bid = bid;
		this.eName = eName;
		this.cName = cName;
		this.rating = rating;
		this.comment = comment;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
