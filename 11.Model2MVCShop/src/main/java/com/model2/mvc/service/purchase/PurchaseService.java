package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;



public interface PurchaseService {

	public int addPurchase(Purchase purchase) throws Exception;
	
	public int stockPurchase(Purchase purchase) throws Exception;
	
	public int orderCancel(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	
	public Purchase getPurchase2(int ProdNo) throws Exception;
	
	public Map<String,Object> getPurchaseList(Search search,String buyerId) throws Exception;
	
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	public int updatePurchase(Purchase purchase) throws Exception;
	
	public int updateTranCode(Purchase purchase) throws Exception;
	
	public int updateTranCode2(Purchase purchase) throws Exception;
	
	public int addCart(String userId) throws Exception ;
	
	public Cart getCart(Cart cart) throws Exception ; 
	
	public void updateCart (Cart cart) throws Exception ;

}