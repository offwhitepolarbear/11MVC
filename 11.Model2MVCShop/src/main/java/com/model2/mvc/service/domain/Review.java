package com.model2.mvc.service.domain;

import java.sql.Date;

public class Review {
	
	private int tranNo;
	private int prodNo;
	private int rating;
	private String userId;
	private String review;
	private String imgFile;
	private Date regDate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	public Review(int tranNo) {
		// TODO Auto-generated constructor stub
		this.tranNo=tranNo;
	}
	
	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
