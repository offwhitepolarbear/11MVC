package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
		productDao.addStock(product);
	}
	
	@Override
	public void addStock(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.addStock(product);
	}

	@Override
	public void restock(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.restock(product);
	}
	
	@Override
	public void updateStock(Product product) throws Exception {
		productDao.updateStock(product);
	}
	
	@Override
	public int getProdNo(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productDao.getProdNo(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return productDao.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Product> list= productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		map.put("search", search);
		
		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);
	}

}