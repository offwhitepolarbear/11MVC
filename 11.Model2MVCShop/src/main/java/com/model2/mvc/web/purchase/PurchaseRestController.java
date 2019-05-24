package com.model2.mvc.web.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public PurchaseRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@RequestMapping(
			value = "json/getPurchase/{tranNo}",
			method = RequestMethod.GET)
	public Purchase getPurchase(@PathVariable String tranNo) throws Exception {

		System.out.println("/purchase/json/getPurchase : GET");

		// Business Logic
		return purchaseService.getPurchase(Integer.parseInt(tranNo));
	}

	@RequestMapping(
			value = "json/updateTranCode",
			method = RequestMethod.POST)
	public Purchase updateTranCode(@RequestBody Purchase purchase) throws Exception {
			
		System.out.println("/purchase/json/updateTranCode : POST ȣ�⼺��");

		System.out.println(purchase);

		purchaseService.updateTranCode(purchase);
		
		purchase = purchaseService.getPurchase(purchase.getTranNo());

		return purchase;

	}
	
	@RequestMapping(value = "json/addPurchase", method = RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/addPurchase : POST ȣ�⼺��");
		System.out.println(purchase);

		purchaseService.addPurchase(purchase);
		System.out.println("addPurchase�� ������ ����Ǹ� ��µ˴ϴ�.");
		purchase.setDivyRequest("��������Ȯ�ο� ��ۿ�û���� ����");
		return purchase;

	}
	
	@RequestMapping(value = "json/updatePurchase", method = RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("purchase/json/updatePurchase : POST �����");
		purchaseService.updatePurchase(purchase);
		Purchase rePurchase = purchaseService.getPurchase(purchase.getTranNo());
		return rePurchase;
		
	}
	
	@RequestMapping(value = "json/listSalePurchase", method = RequestMethod.POST)
	public Map listSalePurchase(@RequestBody Search search) throws Exception {
		
		System.out.println("purchase/json/listSalePurchase : POST �����");
		Map map = purchaseService.getSaleList(search);
		map.put("word", "Rest��Ʈ�ѷ�json/listSalePurchase �ٳ�� ���Դϴ�.");
		return map;
	}
		
	@RequestMapping(value = "json/orderCancel", method = RequestMethod.POST)
	public Purchase orderCancel(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("purchase/json/orderCancel : POST �����");
		System.out.println(purchase);
		
		purchaseService.orderCancel(purchase);
		
		return purchase;
	}
	
	@RequestMapping( value="json/addCart", method=RequestMethod.POST )
	public Cart addCart(@RequestBody Product product, HttpSession session) throws Exception {
		
		////�۾��� �ָ��ϰ� ���� �̵��� �ٽ�Ȯ���ؾߵ˴ϴ�~
		System.out.println("īƮ�� �� ��ǰ ��ȣ : "+product.getProdNo());
		System.out.println("īƮ�� �� ��� �� : "+product.getStock());
		
		User user = (User)session.getAttribute("user");
		
		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		String carting = "";
		String beforeCart = purchaseService.getCart(cart);
		System.out.println("�ν�Ʈ�� �����ǵ� ��� ��µǴ�??"+beforeCart);
		String a = String.valueOf(product.getProdNo());
		if (beforeCart==null) {
			System.out.println("��Ʈ���� ���̸� ��µ˴ϴ�."+beforeCart);
			carting +=product.getProdNo()+"a"+product.getStock()+"n";
		}
		
		else if(beforeCart !=null) {
			
		}
		String[] parseCart = beforeCart.split("n");
		List<String> prodNos= new ArrayList<String>(); 
		List<String> stocks= new ArrayList<String>(); 
		
		for(int i = 0;i<parseCart.length;i++) {
		String[] parseProd= parseCart[i].split("a");
		prodNos.add(parseProd[0]);
		stocks.add(parseProd[1]);
		}
		
		
		
		//carting = product.getProdNo()+"a"+product.getStock()+"n����";
		System.out.println("userId Ȯ�ο�"+user.getUserId());
		
		Product[] products = {product};
		
		
		cart.setProducts(products);
		cart.setProductNames(carting);
		return cart;
	}

}