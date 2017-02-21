package com.rnh.showmethecard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.EvaluationService;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value="/evaluation")
public class EvaluationController {

	//test code
	@Autowired
	@Qualifier("evaluationService")
	private EvaluationService service;
	
	@RequestMapping(value={"/evaluationmain.action", "/", ""}, method=RequestMethod.GET)
	public String showEvaluation(Model model, HttpServletRequest req) { //////////////////////////////////cardNo
		Member member = (Member)req.getSession().getAttribute("loginuser");		
		
		int cardNo = 2;
		
//		String url = "http://j07051.tistory.com/333";
		String url = "http://crosstheline.tistory.com/41";
//		String url = "https://www.odpia.org/main.odpia";
		HtmlParser h = new HtmlParser(url);

		model.addAttribute("url", h.getUrl());
		model.addAttribute("title", h.getTitle());
		model.addAttribute("desc", h.getDesc());
		model.addAttribute("img", h.getImg());
		
		model.addAttribute("isEvalRating", service.confirmEvaluationRatingOfmId(cardNo, member.getmId()));//////////////////////////////////cardNo
		// 전체 Point, 최초 등록일
		Card c = new Card();
		model.addAttribute("cPoint", c.getcPoint());
		model.addAttribute("regDate", c.getRegDate());
		
		// 전체 스크랩 수 // evaluation? my_card 합
		// model.addAttribute("scrapCount", e.getScrapCount());
		// model.addAttribute("", );
		
		////////////////////////////////////////////////////////////////////cardNo));
		model.addAttribute("evalCommentList", service.showEvaluationCommentList(2));

		model.addAttribute("evalRatingList", showEvaluationRatingWithPageNo(cardNo, req, 1));
		model.addAttribute("eRatingAvg", service.showEvaluationRatingAvg(cardNo));
		
		model.addAttribute("");
		
		return "evaluation/evaluationmain";
	}
	
	@RequestMapping(value="showevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public String showEvaluationRatingWithPageNo(int cardNo, HttpServletRequest req, int pageNo) {
		int cardNob = 2;
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.showEvaluationRatingListWithPageNo(cardNob, member.getmId(), 1);
		
		return null;
	}
	
	//합치기
	@RequestMapping(value="addevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationRating(HttpServletRequest req, String content) {
		int cardNo = 2;
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.addEvaluationRating(cardNo, member.getmId(), content, 5);
		
		return null;
	}

	
	@RequestMapping(value="addevalcomment.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationComment(HttpServletRequest req, String content) {
		/////////////////////////////////// int cardNo
		int cardNo = 2;
		Member member = (Member)req.getSession().getAttribute("loginuser");
//		System.out.println(member.getmId());
//		System.out.println(content);
//		HashMap<String, Object> newCommentNo = service.addEvaluationComment(2, member.getmId(), content);

		EvaluationComment newComment = new EvaluationComment();
		newComment.setCardNo(cardNo);
		newComment.setContent(content);
		newComment.setmId(member.getmId());
		
		int newCommentNo = service.addEvaluationComment(newComment).geteCommentNo();
		System.out.println("newCommentNo = " + newCommentNo);
		
		return new Gson().toJson(newComment);
	}
	

	
	@RequestMapping(value="addevalratingliked.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationRatingLiked(int eRatingNo, String mId, HttpServletRequest req) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		System.out.println("addevalrating");
		System.out.println("no " + eRatingNo );
		System.out.println("id " + mId);
		System.out.println("lid" + member.getmId());
		service.addEvaluationRatingLiked(eRatingNo, mId, member.getmId());
		return null;
	}
	
	
	
	
	
	
	
	@RequestMapping(value="showevalcommentlist.action", method=RequestMethod.GET)
	public ModelAndView showEvaluationCommentList(int cardNo) {
		List<EvaluationComment> evalCommentList = service.showEvaluationCommentList(2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("evaluation/evaluationmain");
		mav.addObject("evalCommentList", evalCommentList);
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value="delevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationRating(int eRatingNo) {
		System.out.println("eRatingNo : " + eRatingNo);
		service.deleteEvaluationRatingByeRatingNo(eRatingNo);
		return null;
	}
	
	@RequestMapping(value="delevalcomment.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationComment(int eCommentNo) {
		service.deleteEvaluationCommentByeCommentNo(eCommentNo);
		return null;
	}
	
	
}
