package com.model2.mvc.web.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 구현 않음
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping( value="addPurchase", method=RequestMethod.GET )
	public String addPurchaseView(@PathVariable String prodNo, Model model, HttpSession session) throws Exception {

		User user = (User)session.getAttribute("user");
		System.out.println("/purchase/addPurchase :GET ");
		model.addAttribute("product", productService.getProduct(Integer.parseInt(prodNo)));
		model.addAttribute("user", user);
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping( value="addPurchase", method=RequestMethod.POST )
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		purchase.setBuyer(user);
		purchaseService.addPurchase(purchase);
				
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
	}
	
	//@RequestMapping("/getPurchase.do")
	@RequestMapping( value="getPurchase")
	public String getPurchase( @RequestParam("tranNo") String tranNo , Model model ) throws Exception {
		
		System.out.println("/getPurchase/tranNo");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(Integer.parseInt(tranNo));
		purchase.setDivyDate(purchase.getDivyDate().substring(0,10));
		// Model 과 View 연결
		
		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		List<Product> purchaseList = new ArrayList<Product>();

		String products = purchase.getProducts();
		
		String[] parseProducts = products.split("n");

			for (int i = 0; i < parseProducts.length; i++) {
				String[] parseProd = parseProducts[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product product = productService.getProduct(Integer.parseInt(prodNos.get(i)));
				product.setStock(Integer.parseInt(stocks.get(i)));
				purchaseList.add(product);
			}
		
		model.addAttribute("purchase", purchase);
		model.addAttribute("purchaseList", purchaseList);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	//@RequestMapping("/updatePurchaseView.do")
	@RequestMapping( value="updatePurchase", method=RequestMethod.GET )
	public String updatePurchaseView( @RequestParam("tranNo") String tranNo , Model model ) throws Exception{

		System.out.println("/purchase/updatePurchase : POST");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(Integer.parseInt(tranNo));
		purchase.setDivyDate(purchase.getDivyDate().substring(0,10));
		// Model 과 View 연결
		
		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		List<Product> purchaseList = new ArrayList<Product>();

		String products = purchase.getProducts();
		
		String[] parseProducts = products.split("n");

			for (int i = 0; i < parseProducts.length; i++) {
				String[] parseProd = parseProducts[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product product = productService.getProduct(Integer.parseInt(prodNos.get(i)));
				product.setStock(Integer.parseInt(stocks.get(i)));
				purchaseList.add(product);
			}
		
		model.addAttribute("purchase", purchase);
		model.addAttribute("purchaseList", purchaseList);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	//@RequestMapping("/updatePurchase.do")
	@RequestMapping( value="updatePurchase", method=RequestMethod.POST )
	public String updatePurchase( @ModelAttribute("purchase") Purchase purchase) throws Exception{

		System.out.println("/purchase/updatePurchase : POST");
		System.out.println("컨트롤로 넘어온 퍼체이스 봅시다."+purchase);
		//Business Logic
		purchaseService.updatePurchase(purchase);
		
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
	}
		
	//@RequestMapping("/updateTranCode.do")
	@RequestMapping( value="updateTranCode/{prodNo}/{tranCode}/{menu}" )
	public String updateTranCode(@PathVariable String prodNo, @PathVariable String tranCode, @PathVariable String menu) throws Exception{

			System.out.println("/purchase/updateTranCode : service");
			System.out.println("menu부분으로 들어온 것 : "+menu);
			Purchase purchase = new Purchase();
			purchase.setTranCode(tranCode);
			if (menu.equals("manage")) {
			
			Product product = new Product();
			product.setProdNo(Integer.parseInt(prodNo));
			purchase.setPurchaseProd(product);
			purchaseService.updateTranCode2(purchase);
			
			return "redirect:/purchase/listSalePurchase";
			}
			else {
				purchase.setTranCode(tranCode);
				purchase.setTranNo(Integer.parseInt(prodNo));
				purchaseService.updateTranCode(purchase);
				return "redirect:/purchase/listPurchase";
			}
				
	}
	/*
	@RequestMapping( value="orderCancel/{tranNo}/{role}" )
	public String orderCancel(@PathVariable String tranNo, @PathVariable String role) throws Exception{

			System.out.println("/purchase/orderCancel : service");
			Purchase purchase = purchaseService.getPurchase(Integer.parseInt(tranNo));
			purchase.setTranCode("4");
			
			purchaseService.orderCancel(purchase);

			if (role.equals("admin")) {
			
			return "redirect:/purchase/listSalePurchase";
			}
			else {
				return "redirect:/purchase/listPurchase";
			}
				
	}
	*/
	
		
	//@RequestMapping("/listPurchase.do")
	@RequestMapping( value="listPurchase" )
	public String listPurchase( @ModelAttribute("search") Search search, HttpSession session,  Model model) throws Exception{
		
		System.out.println("/purchase/listPurchase");
		User user = (User)session.getAttribute("user");
		System.out.println("userId추출되는가"+user.getUserId());
		search.setSearchKeyword(user.getUserId());
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search, search.getSearchKeyword());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/purchase/listPurchase.jsp";
	}
	
	//@RequestMapping("/listSalePurchase.do")
	@RequestMapping( value="listSalePurchase" )
	public String listSalePurchase( @ModelAttribute("search") Search search, HttpSession session,  Model model) throws Exception{
		
		System.out.println("/purchase/listSalePurchase : Service");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getSaleList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("saleCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/purchase/listSalePurchase.jsp";
	}
	
	@RequestMapping(value = "getCart", method = RequestMethod.GET)
	public String getCart(HttpSession session, Model model) throws Exception {

		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		List<Product> cartList = new ArrayList<Product>();

		User user = (User) session.getAttribute("user");

		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		Cart reCart = purchaseService.getCart(cart);

		String beforeCart = reCart.getProductNames();
		
		if(!beforeCart.equals("empty")) {
		String[] parseCart = beforeCart.split("n");

			for (int i = 0; i < parseCart.length; i++) {
				String[] parseProd = parseCart[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product cartingProduct = productService.getProduct(Integer.parseInt(prodNos.get(i)));
				cartingProduct.setStock(Integer.parseInt(stocks.get(i)));
				cartList.add(cartingProduct);
			}
			
		}
	
		model.addAttribute("cartList",cartList);			
		
		return "forward:/purchase/getCart.jsp";
	}
	
	@RequestMapping(value = "cartPurchase", method = RequestMethod.POST)
	public String cartPurchase(@RequestParam String products,HttpSession session, Model model) throws Exception {
		System.out.println("이거만 제대로 찍히면 된다☆★☆★☆★☆★ : "+products);
		//inputname을 프로덕츠로 해서 던져줍시다.
		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		List<Product> cartList = new ArrayList<Product>();

		String beforeCart = products;
		
		if(!beforeCart.equals("empty")) {
		String[] parseCart = beforeCart.split("n");

			for (int i = 0; i < parseCart.length; i++) {
				String[] parseProd = parseCart[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product cartingProduct = productService.getProduct(Integer.parseInt(prodNos.get(i)));
				cartingProduct.setStock(Integer.parseInt(stocks.get(i)));
				cartList.add(cartingProduct);
			}
			
		}
	
		model.addAttribute("cartList",cartList);			
		
		return "forward:/purchase/cartPurchase.jsp";
	}
	
	
	/////구매확인 로직 갑시다.
	@RequestMapping(value = "purchaseAll", method = RequestMethod.POST)
	public String purchaseAll(@RequestParam String products, Model model) throws Exception {
		//inputname을 프로덕츠로 해서 던져줍시다.
		List<String> prodNos = new ArrayList<String>();
		List<String> stocks = new ArrayList<String>();
		List<Product> purchaseList = new ArrayList<Product>();

		
		String[] parseProducts = products.split("n");

			for (int i = 0; i < parseProducts.length; i++) {
				String[] parseProd = parseProducts[i].split("a");
				prodNos.add(parseProd[0]);
				stocks.add(parseProd[1]);
			}
			
			for (int i=0; i<prodNos.size();i++) {
				Product product = productService.getProduct(Integer.parseInt(prodNos.get(i)));
				product.setStock(Integer.parseInt(stocks.get(i)));
				purchaseList.add(product);
			}
		
		model.addAttribute("purchaseList", purchaseList);	
		model.addAttribute("products", products);	
		
		return "forward:/purchase/cartPurchase.jsp";
	}
	
}