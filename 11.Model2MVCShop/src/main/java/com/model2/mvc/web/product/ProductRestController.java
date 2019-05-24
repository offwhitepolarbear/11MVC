package com.model2.mvc.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable String prodNo ) throws Exception{
		
		System.out.println("/user/json/getProduct : GET");
		
		//Business Logic
		return productService.getProduct(Integer.parseInt(prodNo));
		}
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addProduct( @RequestBody Product product) throws Exception{
	
		System.out.println("/product/json/addProduct : POST");
		
		System.out.println("product ���Գ� üũ����");
		System.out.println(product);
		
		productService.addProduct(product);
		System.out.println("�ڡڡ�addProduct ���� üũ����١١�");
		
		product.setProTranCode("addProd ���ϰ� Ȯ�ο� �ӽ� Ʈ���ڵ�.");
		return product;
		
	}
	
	@RequestMapping( value="json/listProduct", method=RequestMethod.POST )
	public Map listProduct(@RequestBody Search search) throws Exception {
		System.out.println("json/listProduct : Post ����ƽ��ϴ�.");
		return productService.getProductList(search);
	}
	
	
	@RequestMapping( value="json/restock", method=RequestMethod.POST )
	public Product restock(@RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/restock : POST");
		productService.restock(product);
		Product reProd = productService.getProduct(product.getProdNo());
		return reProd;
	}
	
	@RequestMapping( value="json/updateStock", method=RequestMethod.POST )
	public Product updateStock(@RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/updateStock : POST");
		productService.updateStock(product);
		Product reProd = productService.getProduct(product.getProdNo());
		return reProd;
	}	
}