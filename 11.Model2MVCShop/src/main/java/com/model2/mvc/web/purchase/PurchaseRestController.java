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

	@RequestMapping(
			value = "json/addPurchase",
			method = RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/addPurchase : POST ȣ�⼺��");
		System.out.println(purchase);

		purchaseService.addPurchase(purchase);
		System.out.println("addPurchase�� ������ ����Ǹ� ��µ˴ϴ�.");
		purchase.setDivyRequest("��������Ȯ�ο� ��ۿ�û���� ����");
		return purchase;

	}

	@RequestMapping(
			value = "json/updatePurchase",
			method = RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase) throws Exception {

		System.out.println("purchase/json/updatePurchase : POST �����");
		purchaseService.updatePurchase(purchase);
		Purchase rePurchase = purchaseService.getPurchase(purchase.getTranNo());
		return rePurchase;

	}

	@RequestMapping(
			value = "json/listSalePurchase",
			method = RequestMethod.POST)
	public Map listSalePurchase(@RequestBody Search search) throws Exception {

		System.out.println("purchase/json/listSalePurchase : POST �����");
		Map map = purchaseService.getSaleList(search);
		map.put("word", "Rest��Ʈ�ѷ�json/listSalePurchase �ٳ�� ���Դϴ�.");
		return map;
	}

	@RequestMapping(
			value = "json/orderCancel",
			method = RequestMethod.POST)
	public Purchase orderCancel(@RequestBody Purchase purchase) throws Exception {

		System.out.println("purchase/json/orderCancel : POST �����");
		System.out.println(purchase);

		purchaseService.orderCancel(purchase);

		return purchase;
	}

	@RequestMapping(
			value = "json/updateCart",
			method = RequestMethod.POST)
	public Cart updateCart(@RequestBody Product product, HttpSession session) throws Exception {

		System.out.println("īƮ�� �� ��ǰ ��ȣ : " + product.getProdNo());
		System.out.println("īƮ�� �� ��� �� : " + product.getStock());

		String againProdPosition = "none";
		String inputProdNo = String.valueOf(product.getProdNo());
		String carting = "";
		int inputStock = product.getStock();
		int stockAlready = 0;

		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();

		User user = (User) session.getAttribute("user");

		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		Cart reCart = purchaseService.getCart(cart);
		System.out.println("���ٿ� īƮ ���̵� ��� : "+cart.getUserId());
		// īƮ ����� ��� ó��//
		if (reCart.getProductNames().equals("empty")) {
			System.out.println("īƮ�� �� empty�� ��µ˴ϴ�." );
			carting += product.getProdNo() + "a" + product.getStock()+"n";
		}
		
		else if (!reCart.getProductNames().equals("empty")) {
			System.out.println("īƮ�� ����ִ°� ������ ��µ˴ϴ�.");
			String beforeCart = reCart.getProductNames();
			String[] parseCart = beforeCart.split("n");
			// �ߺ���ǰ�� ������ �ִ� ��� ã�Ƴ��ô�
			for (int i = 0; i < parseCart.length; i++) {
				if (parseCart[i].indexOf(inputProdNo) != -1) {
					againProdPosition = String.valueOf(i);
				}
			}

			// �ߺ��˻� ����� ���
			if (againProdPosition.equals("none")) {
				carting = product.getProdNo() + "a" + product.getStock() + "n" + beforeCart;
			}

			// �ߺ��� �־�!
			else {
				for (int i = 0; i < parseCart.length; i++) {
					String[] parseProd = parseCart[i].split("a");
					if (i == Integer.parseInt(againProdPosition)) {
						stockAlready = Integer.parseInt(parseProd[1]);
						continue;
					}
					prodNos.add(parseProd[0]);
					stocks.add(parseProd[1]);
				}

				int temp = inputStock + stockAlready;
				prodNos.add(0, inputProdNo);
				stocks.add(0, temp + "");

				for (int i = 0; i < prodNos.size(); i++) {
					carting += prodNos.get(i) + "a";
					carting += stocks.get(i) + "n";
				}


			}
			
		}
	
		cart.setProductNames(carting);
		System.out.println("īƮ����١ڡ١ڡ١ڡ١ڡ١�"+cart.getProductNames());
		System.out.println("īƮ���̵�١ڡ١ڡ١ڡ١�:"+cart.getUserId());
		purchaseService.updateCart(cart);
		
		return cart;
	}
}