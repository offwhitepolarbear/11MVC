package com.model2.mvc.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewService;

@RestController
@RequestMapping("/review/*")
public class ReviewRestController {
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	public ReviewRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "json/showReview/{reviewNo}/{show}", method = RequestMethod.POST)
	public int showReview(@PathVariable String reviewNo,@PathVariable String show) throws Exception {
		Review review = new Review();
		review.setReviewNo(Integer.parseInt(reviewNo));
		review.setShow(Integer.parseInt(show));
		return reviewService.showReview(review);
	}
}
