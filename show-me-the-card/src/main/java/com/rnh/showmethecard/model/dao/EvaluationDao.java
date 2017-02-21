package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationDao {

	void insertEvaluationRating(EvaluationRating newRating);

	void insertEvaluationComment(EvaluationComment newComment);

	void insertEvaluationRatingLiked(int eRatingNo, String mId, String likedmId);

	int selectEvaluationRatingLiked(int cardNo, String mId);

	float selectEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> selectEvaluationCommentList(int cardNo);


	
	
	
	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int eRatingNo);

	boolean selectExistsEvaluationRatingOfmId(int cardNo, String mId);

	List<EvaluationRating> selectEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo);

	


	
}
