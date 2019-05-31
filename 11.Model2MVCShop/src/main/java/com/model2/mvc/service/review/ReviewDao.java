package com.model2.mvc.service.review;

import java.util.List;

import com.model2.mvc.service.domain.Review;

public interface ReviewDao {
	
	public int addReview(Review review) throws Exception;
	
	public int showReview(Review review) throws Exception;
	
	public List<Review> getProductReview (int prodNo) throws Exception;
	
	public int getProductReviewCount(int prodNo)  throws Exception;

}
