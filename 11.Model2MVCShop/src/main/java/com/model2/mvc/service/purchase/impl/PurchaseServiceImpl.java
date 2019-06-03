package com.model2.mvc.service.purchase.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;
@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addPurchase(Purchase purchase) throws Exception {
		
		System.out.println("addPurchaseüĿ 01");
		Cart cart = new Cart();
		cart.setUserId(purchase.getBuyer().getUserId());
		cart = purchaseDao.getCart(cart);
		String ogCart = cart.getProductNames();
		String removeProducts = purchase.getProducts();	
		
		purchase.setDivyDate(purchase.getDivyDate().substring(2).replace("-", "/"));
		
		System.out.println("addPurchaseüĿ 02");
		
		String[] splitCart = ogCart.split("n");
		String[] splitProducts =removeProducts.split("n");
		List<String> cartString = new ArrayList<String>(Arrays.asList(splitCart));
		String reCarting = "";
		
		System.out.println("addPurchaseüĿ 03");
		
		if (cartString.size()==1) {
			reCarting="empty";
			String[] stocking = splitProducts[0].split("a");
			Product product = new Product();
			product.setProdNo(Integer.parseInt(stocking[0]));
			product.setStock(Integer.parseInt(stocking[1]));
			purchaseDao.stockPurchase(product);
		}
		
		else {
			
			for(int a=0; a<cartString.size();a++) {
				for (int b=0; b<splitProducts.length;b++) {
					if(cartString.get(a).indexOf(splitProducts[b])!=-1) {
					cartString.remove(a);
					String[] stocking = splitProducts[b].split("a");
					Product product = new Product();
					product.setProdNo(Integer.parseInt(stocking[0]));
					product.setStock(Integer.parseInt(stocking[1]));
					purchaseDao.stockPurchase(product);
					}
				}
			}
			
			System.out.println("addPurchaseüĿ 04");
			for(int a=0; a<cartString.size();a++) {
				reCarting += cartString.get(a)+"n" ;
			}
			
		}
		
		cart.setProductNames(reCarting);
		cart.setUserId(purchase.getBuyer().getUserId());
		System.out.println("addPurchaseüĿ 05");
		purchaseDao.updateCart(cart);
		System.out.println("addPurchaseüĿ 06");
		return purchaseDao.addPurchase(purchase);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int stockPurchase(Product product) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.stockPurchase(product);
	}
		
	@Override
	public int orderCancel(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		
		int cancelProd = 0;
		
		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		String[] parseProducts = purchase.getProducts().split("n");

			for (int i = 0; i < parseProducts.length; i++) {
				String[] parseProd = parseProducts[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product product = new Product();
				product.setProdNo(Integer.parseInt(prodNos.get(i)));
				product.setStock(Integer.parseInt(stocks.get(i)));
				purchaseDao.orderCancel(product);
				cancelProd += 1;
			}
		
		return purchaseDao.updateTranCode(purchase);
	}
	
	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.getPurchase(tranNo);
	}

	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.getPurchase2(ProdNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		// TODO Auto-generated method stub
		List<Purchase> list= purchaseDao.getPurchaseList(search, buyerId);
		int totalCount = purchaseDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}

	@Override
	public Map<String, Object> getSaleList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Purchase> list= purchaseDao.getSaleList(search);
		int saleCount = purchaseDao.getSaleCount(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("saleCount", new Integer(saleCount));
		
		return map;
		}

	@Override
	public int updatePurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.updatePurchase(purchase);
		
		
	}
	
	@Override
	public int updateTranCode2(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.updateTranCode2(purchase);
	}

	@Override
	public int updateTranCode(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.updateTranCode(purchase);
	}

	@Override
	public int addCart(String userId) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.addCart(userId);
	}

	@Override
	public Cart getCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.getCart(cart);
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		purchaseDao.updateCart(cart);
	}

	/*
	private Map removeCartString(String cartString) {
		cartString += "";
		Map map = new HashMap<>();
		List prodList = new ArrayList<String>();
		List stockList = new ArrayList<String>();
		
		return map;
	}
	*/

	@Override
	public String removeCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		
		String ogCart = cart.getFullCart();
		String removeProducts = cart.getProductNames();
		String[] splitCart = ogCart.split("n");
		String[] splitProducts =removeProducts.split("n");
		List<String> cartString = new ArrayList<String>(Arrays.asList(splitCart));
		String reCarting = "";
		
		if (cartString.size()==1) {
			reCarting="empty";
		}
		
		else {
			
			for(int a=0; a<cartString.size();a++) {
				for (int b=0; b<splitProducts.length;b++) {
					if(cartString.get(a).indexOf(splitProducts[b])!=-1) {
					cartString.remove(a);
					}
				}
			}
			
			
			for(int a=0; a<cartString.size();a++) {
				reCarting += cartString.get(a)+"n" ;
			}
			
		}
		
		cart.setProductNames(reCarting);
		
		purchaseDao.updateCart(cart);
		
		return cart.getProductNames();
		
	}

}