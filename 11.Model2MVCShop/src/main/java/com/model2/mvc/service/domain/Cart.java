package com.model2.mvc.service.domain;

public class Cart {
	
	private String userId;
	private String productNames;
	private String fullCart;
		
	
	public Cart() {
		
		// TODO Auto-generated constructor stub
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getProductNames() {
		return productNames;
	}

	public void setProductNames(String productNames) {
		this.productNames = productNames;
	}

	public String getFullCart() {
		return fullCart;
	}

	public void setFullCart(String fullCart) {
		this.fullCart = fullCart;
	}
	
	@Override
	public String toString() {
		return "userid : "+userId+" <productNames : "+productNames+" <originalCart :"+fullCart;
	}

}