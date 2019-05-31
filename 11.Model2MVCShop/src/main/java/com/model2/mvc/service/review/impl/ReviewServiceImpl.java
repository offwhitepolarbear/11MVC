package com.model2.mvc.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;

	public ReviewServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.addReview(review);
	}

	@Override
	public int showReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		return reviewDao.showReview(review);
	}

	@Override
	public Map<String, Object> getProductReview(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		List<Review> reviewList = reviewDao.getProductReview(prodNo);
		int totalCount = reviewDao.getProductReviewCount(prodNo);
		Map<String,Object> map = new HashMap<>();
		map.put("productReview", reviewList);
		map.put("totalCount", totalCount);
		return map;
	}

}
