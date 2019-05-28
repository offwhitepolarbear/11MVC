package com.model2.mvc.service.purchase.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.purchase.PurchaseDao;
@Repository
public class PurchaseDaoImpl implements PurchaseDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public PurchaseDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addPurchase(Purchase purchase) throws Exception {
		return sqlSession.insert("PurchaseMapper.addPurchase", purchase);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int stockPurchase(Product product) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("PurchaseMapper.sold", product);
	}
	
	@Override
	public int orderCancel(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("PurchaseMapper.orderCancel", purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}

	@Override
	public Purchase getPurchase2(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.getPurchase2", prodNo);

	}

	@Override
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception {
		// TODO Auto-generated method stub
		search.setSearchKeyword(buyerId);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", search);
	}

	@Override
	public List<Purchase> getSaleList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PurchaseMapper.getSaleList", search);
	}

	@Override
	public int updatePurchase(Purchase purchase) throws Exception {
		return sqlSession.update("PurchaseMapper.updatePurchase", purchase);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateTranCode(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("PurchaseMapper.updateTranCode", purchase);
			
	}
	
	@Override
	public int updateTranCode2(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("PurchaseMapper.updateTranCode2", purchase);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", search);
	}
	@Override
	public int getSaleCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PurchaseMapper.getSaleCount", search);
	}
	@Override
	public int addCart(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("CartMapper.addCart", userId);
	}
	@Override
	public Cart getCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CartMapper.getCart", cart);
	}
	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CartMapper.updateCart", cart);
	}

}