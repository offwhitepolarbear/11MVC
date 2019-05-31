package com.model2.mvc.service.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ReviewDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addReview(Review review) throws Exception {
		return sqlSession.insert("ReviewMapper.addReview", review);
	}

	@Override
	public int showReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("ReviewMapper.showReview", review);
	}

	@Override
	public List<Review> getProductReview(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReviewMapper.getProductReview", prodNo);
	}
	
	@Override
	public int getProductReviewCount(int prodNo)  throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ReviewMapper.getProductReviewCount", prodNo);
	}

}
