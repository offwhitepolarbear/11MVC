package com.model2.mvc.service.review;

import java.util.Map;

import com.model2.mvc.service.domain.Review;

public interface ReviewService {
	
public int addReview(Review review) throws Exception;
	
	public int showReview(Review review) throws Exception;
	
	public Map<String,Object> getProductReview (int prodNo) throws Exception;

}
