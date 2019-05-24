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
			
		System.out.println("/purchase/json/updateTranCode : POST 호출성공");

		System.out.println(purchase);

		purchaseService.updateTranCode(purchase);
		
		purchase = purchaseService.getPurchase(purchase.getTranNo());

		return purchase;

	}
	
	@RequestMapping(value = "json/addPurchase", method = RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/addPurchase : POST 호출성공");
		System.out.println(purchase);

		purchaseService.addPurchase(purchase);
		System.out.println("addPurchase가 무사히 실행되면 출력됩니다.");
		purchase.setDivyRequest("리스폰스확인용 배송요청사항 수정");
		return purchase;

	}
	
	@RequestMapping(value = "json/updatePurchase", method = RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("purchase/json/updatePurchase : POST 실행됨");
		purchaseService.updatePurchase(purchase);
		Purchase rePurchase = purchaseService.getPurchase(purchase.getTranNo());
		return rePurchase;
		
	}
	
	@RequestMapping(value = "json/listSalePurchase", method = RequestMethod.POST)
	public Map listSalePurchase(@RequestBody Search search) throws Exception {
		
		System.out.println("purchase/json/listSalePurchase : POST 실행됨");
		Map map = purchaseService.getSaleList(search);
		map.put("word", "Rest컨트롤러json/listSalePurchase 다녀온 맵입니다.");
		return map;
	}
		
	@RequestMapping(value = "json/orderCancel", method = RequestMethod.POST)
	public Purchase orderCancel(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("purchase/json/orderCancel : POST 실행됨");
		System.out.println(purchase);
		
		purchaseService.orderCancel(purchase);
		
		return purchase;
	}
	
	@RequestMapping( value="json/addCart", method=RequestMethod.POST )
	public Cart addCart(@RequestBody Product product, HttpSession session) throws Exception {
		
		////작업이 애매하게 끝남 이따가 다시확인해야됩니다~
		System.out.println("카트에 들어갈 제품 번호 : "+product.getProdNo());
		System.out.println("카트에 들어갈 재고 수 : "+product.getStock());
		
		User user = (User)session.getAttribute("user");
		
		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		String carting = "";
		String beforeCart = purchaseService.getCart(cart);
		System.out.println("널스트링 넣은건데 어떻게 출력되니??"+beforeCart);
		String a = String.valueOf(product.getProdNo());
		if (beforeCart==null) {
			System.out.println("스트링이 널이면 출력됩니다."+beforeCart);
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
		
		
		
		//carting = product.getProdNo()+"a"+product.getStock()+"n꺄악";
		System.out.println("userId 확인용"+user.getUserId());
		
		Product[] products = {product};
		
		
		cart.setProducts(products);
		cart.setProductNames(carting);
		return cart;
	}

}