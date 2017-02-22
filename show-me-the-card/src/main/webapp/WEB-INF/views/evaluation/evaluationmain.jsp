<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EvaluationMain</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/bootstrap/css/bootstrap.min.css">

<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/font-awesome.min.css">

<!-- Animate CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/animate.css">

<!-- Owl-Carousel -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.transitions.css">


<!-- Custom Fonts -->
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>

<!-- Materialize CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/material.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/responsive.css">

<!-- Colors CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/color/blue.css" title="blue">

<!-- Custom Fonts -->
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>

<!-- Modernizer js -->
<script src="/showmethecard/resources/assets/js/modernizr.custom.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery Version 2.1.3 -->
<script src="/showmethecard/resources/assets/js/jquery-2.1.3.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="/showmethecard/resources/assets/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/showmethecard/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/showmethecard/resources/assets/js/classie.js"></script>
<script src="/showmethecard/resources/assets/js/count-to.js"></script>
<script src="/showmethecard/resources/assets/js/jquery.appear.js"></script>
<script src="/showmethecard/resources/assets/js/owl.carousel.min.js"></script>
<script src="/showmethecard/resources/assets/js/jquery.fitvids.js"></script>

<!-- Contact Form JavaScript -->
<script
	src="/showmethecard/resources/assets/js/jqBootstrapValidation.js"></script>

<!-- Materialize js -->
<script src="/showmethecard/resources/assets/js/material.js"></script>
<script src="/showmethecard/resources/assets/js/waypoints.min.js"></script>


<style type="text/css">
#columns {
	column-width: 300px;
}

#columns figure {
	display: inline-block;
	column-width: 360.66px;
	padding: 10px;
}

textarea.autosize {
	height: 20px;
}

.box {
	background-color: rgb(220, 220, 220);
	border-radius: 4px;
	border: solid 2.5pt darkgray;
	margin: 30px 20px;
	padding: 5px 5px;
	float: left;
}

.title {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
	word-break: keep-all;
	overflow: hidden;
	text-overflow: ellipsis;
	border-bottom: dotted 2.5pt darkgray;
	padding-bottom: 5px;
}

#imgdiv {
	height: 600px;
}

.eval-item {
	height: 230px;
	padding: 25px 35px;
} 

#myeval {
	background-color: gold;
} 

.desc {
	font-size: 15px;
	letter-spacing: -0.023em;
	height: 64px;
	margin-top: 16px;
}

.div-eval {
	position: relative;
	top: 35px;
}

.div-eval-text {
	width: 70%;
	float: left;
}

#div-eval-submit {
	margin-top: 50px;
	width: 10%;
	float: right;
}

#div-eval-del {
	position: relative;
	top: -55px
}
#div-eval-del img {
	height: 40px; width: auto;
}

.img-evaluation-del {
	position: absolute;
	right: 0px;
}

.div-text {
	float: left;
}

.div-btn {
	float: right;
}

h2 {
	font-style: italic;
	margin-top: -5px;
}

.star {
	
}

.fnc-icon {
	cursor: pointer;
}
</style>

<script type="text/javascript">
		$(document).ready(function() {
			var loginId = $('#loginusermId').val();
			var cardNo = $('#cardNo').val();
			
			cardNo = 2;
			
			
			var imgDiv = $('#imgdiv');
			var img = $('#thumbnail');
			var imgWidth = img.width(); // 초기 값
			var imgHeight = img.height(); // 초기 값
			
		    var divisor = 2;
		    var ratio = 0.75;
			
		    /* 이미지 크기 결정 */
		    if (img.width() > img.height()) { // 사진의 가로가 세로보다 크면
		    	if (img.width() < imgDiv.width() / divisor) { // 그런데 div를 어떤 숫자로 나눈 값보다 작으면
		    		img.css("width", imgDiv.width() * ratio);
		    	} else { // 그런데 div를 어떤 숫자로 나눈 값보다 크거나 같으면
			    	img.css("width", imgDiv.width()); // 사진의 가로를 div에 맞추고 세로는 auto
		    	}
		    	img.css("height", 'auto');
	    		addDummyDiv();
	    		
		    } else {
		    	if (img.height() < imgDiv.height() / divisor) {
		    		img.css("height", imgDiv.height() * ratio);
		    	} else {
			    	img.css("height", imgDiv.height()); // 사진의 세로를 div에 맞추고 가로는 auto
		    	}
		    	img.css("width", 'auto');
	    		addDummyDiv();
	    		
		    }
		    
		    /* 이미지를 가운데 정렬하기 위해 더미 div 생성 */
		    function addDummyDiv() {
	    		imgDiv.prepend($('<div>', {
			    	id  : "dummybeforethumbnail",
			    	css : {
			    		height  : (imgDiv.height() - img.height()) / 2
			    		, width : imgDiv.width()
			    	}
		    	}));
	    			    		
		    }
		    
		    
		    /* show writebox or my eval */
		    if ($('.hidden-rating-isevalrating').val() === 'true') {
		    	showEvalWriteOrMine("mine");
		    } else {
		    	showEvalWriteOrMine("write");
		    }
		    
		    function showEvalWriteOrMine(keyWord) {
		    	if (keyWord == "write") {
		    		$('#div-eval-write').css('display', '');
			    	$('#div-eval-mine').css('display', 'none');
		    	} else if (keyWord == "mine") {
		    		$('#div-eval-mine').css('display', '');
			    	$('#div-eval-write').css('display', 'none');
		    	}
		    }
		    
		    
		    
		    /* 좋아요 누르면 실행 */
		    $('.div-display-liked').each(function() {
		    	var writerId = $(this).parent().parent().find($('.hidden-rating-writer')).val();
		    	var isLiked  = $(this).parent().parent().find($('.hidden-rating-isliked')).val();
    			var divLiked = $(this).parent().parent();
		    	
		    	
		    	if ( (isLiked === 'true') || (loginId == writerId) ) {
		    		showDivLikedAlready($(this));
			    } else {
			    	showDivLikedYet($(this));
			    }
		    	
		    	
		    	$(this).find($('.i-liked-sum')).click(function() {	    			
		    		if ( (loginId != writerId) && //로그인한 유저와 글쓴이 아이디가 다르고
		    				(isLiked === 'false') && //좋아요!! 를 아직 누르지 않았고
		    				(confirm("좋아요?")) ) { //확인을 눌렀다면
		    			
			    		$.ajax({
			    			url  : '/showmethecard/evaluation/addevalratingliked.action',
				    		type : 'POST',
				    		data : {
				    			eRatingNo : divLiked.find($('.hidden-rating-no')).val(),
				    			mId       : writerId
				    		},
				    		success : function() {
				    			var hiddenData = divLiked.find($('.hidden-liked-sum'));
				    			var likedSum = parseInt(hiddenData.val());
				    			hiddenData.next(find('.liked-sum')).text(likedSum + 1);
				    			showDivLikedAlready(divLiked);
						    	
			    				isLiked = true;
				    		}
				    	});

		    		}		    		
		    	});
		    		
		    });
		    
		    function showDivLikedYet(target) {
		    	target.find($('.liked-yet')).css('display', '');
		    	target.find($('.liked-already')).css('display', 'none');
		    }
		    
		    function showDivLikedAlready(target) {
		    	target.find($('.liked-yet')).css('display', 'none');
		    	target.find($('.liked-already')).css('display', '');
		    }
		    
		    
		    /* textarea auto resize */
		    /* $("textarea.autosize").on('keydown keyup', function () {
	    		$(this).height(1).height( $(this).prop('scrollHeight')+12 );
	    	}); */
		    
	    	/* submit comment */
		    $("#div-comment-submit").click(function() {
		    	var spaceTrimedContent = $.trim($('#comment-textarea').val());
		    	
		    	if (spaceTrimedContent) { // spaceTrimedContent가 not !(null || "" || NaN || 0) 
		    		
		    		$.ajax({
		    			url  : '/showmethecard/evaluation/addevalcomment.action',
		    			type : 'POST',
		    			data : {
		    				cardNo  : cardNo,
		    				content : spaceTrimedContent
		    			},
		    			dataType : 'json',
		    			success : function(data) {
		    				alert("받아온 eCommentNo" + data.eCommentNo);
		    				/* $('#div-comment-write').animate({
								opacity : '0',
								bottom  : '0px'
							}); */
							$('#comment-textarea').val("");
		    				var newDiv = $('.div-comment').first().clone(true);
		    				newDiv.find('.commentno').val(data.eCommentNo);
		    				newDiv.find('.comment-writer-id').text(loginId);
		    				newDiv.find('p').text(spaceTrimedContent);
		    				newDiv.prependTo($('.div-comment-list'));
		    			}
		    		});
		    	}
		    });

	    	
	    	
	    	
	    	/* submit evaluation */
		    $("#div-eval-submit").click(function() {
		    	var spaceTrimedContent = $.trim($('#eval-textarea').val());
		    	
		    	if (spaceTrimedContent) { // spaceTrimedContent가 not !(null || "" || NaN || 0) 
		    		
		    		$.ajax({
		    			url  : '/showmethecard/evaluation/addevalrating.action',
		    			type : 'POST',
		    			data : {
		    				cardNo  : cardNo,
		    			//	eRating : 3,
		    				content : spaceTrimedContent
		    			},
		    			dataType : 'json',
		    			success : function(data) {
		    				
							var newEvalDiv = $("#div-neweval").clone(true);
							alert("0my Evaldiv" + $("#div-neweval").html());

		    				$("#div-neweval").remove();
							showEvalWriteOrMine("mine");
							
							
							alert("my Evaldiv" + newEvalDiv.find($('#div-eval-mine')));
							
							newEvalDiv.find($('.hidden-rating-no')).val(data.eRatingNo);
							newEvalDiv.find($('.hidden-rating-writer')).val(data.mId);
							newEvalDiv.find($('.hidden-rating-isliked')).val(data.mLiked);
							newEvalDiv.find($('.eval-writer-id')).text(data.mId);
							newEvalDiv.find($('.div-eval-text-content')).text(data.content);
							newEvalDiv.find($('.hidden-liked-sum')).val(0);
							
							$('#div-neweval').prepend(newEvalDiv);
		    			}
		    		});
		    	}
		    });
	    	
	    	
	    	
	    	
	    	/* delete evaluation */
			$('.img-evaluation-del').each(function() {
				var evaluationDiv = $(this).parent().parent();
				var writermId = evaluationDiv.find($('.hidden-rating-writer')).val();
				var evaluationNo = evaluationDiv.find($('.hidden-rating-no')).val();

				$(this).click(function() {

					if ( (loginId == writermId) && 
						(confirm("삭제하시겠습니까?")) ) {
						
						$.ajax({
							url  : '/showmethecard/evaluation/delevalrating.action',
							type : 'POST',
							data : {
								eRatingNo : evaluationNo
							},
							success :
								function() {
									delWithAnimation(evaluationDiv);
									showEvalWriteOrMine("write");
								}
						});
					}
				});
				
			});
	    	
	    	/* delete comment */
			$('.img-comment-del').each(function() {
				var commentDiv = $(this).parent().parent().parent();
				var commentNo = commentDiv.find($('.commentno')).val();
				var writermId = $(this).parent().find($('.comment-writer-id')).text();
				
				$(this).click(function() {
					
					if ( (loginId == writermId) && 
						(confirm("삭제하시겠습니까?")) ) {
						
						$.ajax({
							url : '/showmethecard/evaluation/delevalcomment.action',
							type : 'POST',
							data : {
								eCommentNo : commentNo
							},
							success : delWithAnimation(commentDiv)
						});
					}
				});
				
			});

			/* delete with animation */
			function delWithAnimation(target) {
				target.animate({
					opacity : '0',
					top : '0px'
				},
				function() {
					target.remove();
				});
			}
			
			
			/* confirm with animation */
			function confirmWithAnimation(target, message) {
				target.animate({
					opacity : '0.5' 
				}, "fast",
				function() {
					if (confirm(message)) {
						isConfirm = true;
					} else {
						target.animate({
							opacity : '1.0'
						});
						isConfirm = false;
					}
				});
				return isConfirm;
			}
			
		});
	</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<input id="loginusermId" type="hidden" value="${loginuser.mId}" />
	<input id="cardNo" type="hidden" value="${requestScope.cardNo}" />
	
	<section id="client" class="client-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title text-center wow fadeInDown"
					data-wow-duration="2s" data-wow-delay="50ms">
					<h2>${title}</h2>
					<br>
					<h4 style="color: gold;">#해쉬태그 #해쉬태그 #해쉬태그</h4>
					<h2>..</h2>
					<p>${desc}</p>
				</div>
				<div class="section-title text-center wow fadeInDown"
					data-wow-duration="2s" data-wow-delay="10ms">
					<h2 style="color: gold;">
						<c:if test="${ requestScope.eRatingAvg lt 1.000 }">
							<span class="star">☆</span>
						</c:if>
						<c:if
							test="${ requestScope.eRatingAvg lt 2.000 and requestScope.eRatingAvg ge 1.000 }">
							<span class="star">★</span>
						</c:if>
						<c:if
							test="${ requestScope.eRatingAvg lt 3.000 and requestScope.eRatingAvg ge 2.000 }">
							<span class="star">★★</span>
						</c:if>
						<c:if
							test="${ requestScope.eRatingAvg lt 4.000 and requestScope.eRatingAvg ge 3.000 }">
							<span class="star">★★★</span>
						</c:if>
						<c:if
							test="${ requestScope.eRatingAvg lt 5.000 and requestScope.eRatingAvg ge 4.000 }">
							<span class="star">★★★★</span>
						</c:if>
						<c:if test="${ requestScope.eRatingAvg eq 5.000 }">
							<span class="star">★★★★★</span>
						</c:if>
						${ requestScope.eRatingAvg }
					</h2>
				</div>
				<br>
				<br>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="counter-item" id="imgdiv">
					<a id="thumbnaillink" href="${url}"> <img id="thumbnail" src="${img}" /></a>
				</div>

			</div>
		</div>





		<div class="row">
			<div class="col-md-12">
			
			<input class="hidden-rating-isevalrating" type="hidden" value="${ requestScope.isEvalRating }" />
			
			<div id="div-neweval">
		<!-- write new eval -->
					<div id="div-eval-write" class="eval-item counter-item text-center" style="display: none;">
						<div id="erating" style="position: relative; float: left; width: 100%; border-bottom: dotted 2.5pt darkgray;">
							<h2>
								<span class="star">☆</span>
							</h2>
						</div>
						<div class="div-eval">
							<div class="div-eval-text">
								<h2>
									<textarea id="eval-textarea" name="content" rows="3"
										maxlength="100"
										style="height: 100%; width: 100%; overflow: hidden; border: none; resize: none;"
										placeholder="새 품평..! (100글자까지)"></textarea>
								</h2>
							</div>
							<div id="div-eval-submit" class="div-btn waves-effect">
								<img class="fnc-icon"
									src="/showmethecard/resources/images/comment-send.png" />
							</div>
						</div>
					</div>
		<!-- new eval end -->
				
				
		
		<!-- my eval -->
					<div id="div-eval-mine" class="eval-item counter-item text-center" style="display: none;">
						<input class="hidden-rating-no" type="hidden" value="${ requestScope.myRating.eRatingNo }" />
						<input class="hidden-rating-writer" type="hidden" value="${ requestScope.myRating.mId }" />
						<input class="hidden-rating-isliked" type="hidden" value="${ requestScope.myRating.mLiked }" />
						
						<div class="div-star" style="width: 100%; border-bottom: dotted 2.5pt darkgray;">
							<h2>
								<c:if test="${ requestScope.myRating.eRating eq 0 }">
									<span class="star">☆</span>
								</c:if>
								<c:if test="${ requestScope.myRating.eRating eq 1 }">
									<span class="star">★</span>
								</c:if>
								<c:if test="${ requestScope.myRating.eRating eq 2 }">
									<span class="star">★★</span>
								</c:if>
								<c:if test="${ requestScope.myRating.eRating eq 3 }">
									<span class="star">★★★</span>
								</c:if>
								<c:if test="${ requestScope.myRating.eRating eq 4 }">
									<span class="star">★★★★</span>
								</c:if>
								<c:if test="${ requestScope.myRating.eRating eq 5 }">
									<span class="star">★★★★★</span>
								</c:if>
							</h2>
						</div>
						<div id="div-eval-del">
								<img class="fnc-icon img-evaluation-del"
									src="/showmethecard/resources/images/comment-del.png" />
						</div>
						<div class="div-eval">
							<div class="div-eval-text">
								<div class="eval-writer"
									style="float: left; margin-right: 20px;">
									<h2>
										<span class="eval-writer-id">${ requestScope.myRating.mId }</span> 님 :
									</h2>
								</div>
								<div class="div-eval-text-content" style="float: left; margin-left: 20px;">
									<h2>${ requestScope.myRating.content }</h2>
								</div>
								<%-- <div style="position:relative; bottom:0px">
										<p>
											등록일: ${ requestScope.myRating.regDate }<br>
										</p>
									</div> --%>
							</div>
							<div class="div-display-liked text-right">
								<i class="i-liked-sum service waves-effect liked-already"
									style="border: none; border-radius: 2px; padding: 10px 20px; background-color: #26a8e1; color: white;">
									<input class="hidden-liked-sum" type="hidden" value="${ requestScope.myRating.eLikedSum }" />
									<span class="liked-sum">${ requestScope.myRating.eLikedSum }</span>&nbsp;
									<img class="img-liked" src="/showmethecard/resources/images/liked-inversed.png" style="width: 30px;" />
								</i>
							</div>
						</div>
					</div>
				</div>
	<!-- my eval end -->



				<c:forEach var="ratinglist" items="${ requestScope.evalRatingList }">
					<div class="eval-item counter-item text-center" style="height: 230px; padding: 25px 35px;">
						<input class="hidden-rating-no" type="hidden" value="${ ratinglist.eRatingNo }" />
						<input class="hidden-rating-writer" type="hidden" value="${ ratinglist.mId }" />
						<input class="hidden-rating-isliked" type="hidden" value="${ ratinglist.mLiked }" />
						
						<div class="div-star" style="width: 100%; border-bottom: dotted 2.5pt darkgray;">
							<h2>
								<c:if test="${ ratinglist.eRating eq 0 }">
									<span class="star">☆</span>
								</c:if>
								<c:if test="${ ratinglist.eRating eq 1 }">
									<span class="star">★</span>
								</c:if>
								<c:if test="${ ratinglist.eRating eq 2 }">
									<span class="star">★★</span>
								</c:if>
								<c:if test="${ ratinglist.eRating eq 3 }">
									<span class="star">★★★</span>
								</c:if>
								<c:if test="${ ratinglist.eRating eq 4 }">
									<span class="star">★★★★</span>
								</c:if>
								<c:if test="${ ratinglist.eRating eq 5 }">
									<span class="star">★★★★★</span>
								</c:if>
							</h2>

						</div>
						<div class="div-eval">
							<div class="div-eval-text">
								<div class="eval-writer"
									style="float: left; margin-right: 20px;">
									<h2>
										<span class="eval-writer-id">${ ratinglist.mId }</span> 님 :
									</h2>
								</div>
								<div class="div-eval-text-content" style="float: left; margin-left: 20px;">
									<h2>${ ratinglist.content }</h2>
								</div>
								<%-- <div style="position:relative; bottom:0px">
										<p>
											등록일: ${ ratinglist.regDate }<br>
										</p>
									</div> --%>
							</div>
							<div class="div-display-liked text-right">

								<i class="i-liked-sum service waves-effect liked-yet"
									style="border: none; border-radius: 2px; padding: 10px 20px; display: none">
									<input class="hidden-liked-sum" type="hidden" value="${ ratinglist.eLikedSum }" />
									<span class="liked-sum">${ ratinglist.eLikedSum }</span>&nbsp;
									<img class="img-liked" src="/showmethecard/resources/images/liked.png" style="width: 30px;" />
								</i>
								<i class="i-liked-sum service waves-effect liked-already"
									style="border: none; border-radius: 2px; padding: 10px 20px; background-color: #26a8e1; color: white; display: none">
									<input class="hidden-liked-sum" type="hidden" value="${ ratinglist.eLikedSum }" />
									<span class="liked-sum">${ ratinglist.eLikedSum }</span>&nbsp;
									<img class="img-liked" src="/showmethecard/resources/images/liked-inversed.png" style="width: 30px;" />
								</i>

							</div>

						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>
	<!-- End Client Section -->
	<section id="about-us" class="about-us-section-1">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="section-title text-center">
					<h2>Say Comments</h2>
					<p>hello, little ones !!!</p>
				</div>
				
	<!-- write new comment -->
				<div id="columns" class="row">
					<figure class="dummy-figure">
						<div style="margin: 10px 0px;"></div>
					</figure>
					<figure class="dummy-figure">
						<div style="margin: 10px 0px;"></div>
					</figure>
					<figure>
						<div id="div-comment-write" class="service text-center"
							style="height: 220px; margin: 10px 0px;">
							<p style="padding: 0px;">
								<textarea id="comment-textarea" name="content" class="autosize"
									rows="5" maxlength="300"
									style="height: 100%; width: 100%; overflow: hidden; border: none; resize: none;"
									style='IME-MODE:active;' placeholder="새 댓글..! (300글자까지)"></textarea>
							</p>
							<div id="div-comment-submit" class="waves-effect">
								<img class="fnc-icon"
									src="/showmethecard/resources/images/comment-send.png" />
							</div>
						</div>
					</figure>
				</div>
	<!-- end write -->
	
			</div>
		</div>

		<div id="columns" class="row div-comment-list">
			<c:forEach var="commentlist"
				items="${ requestScope.evalCommentList }">
				<div class="div-comment">
					<input class="commentno" type="hidden"
						value="${ commentlist.eCommentNo }" />
					<figure>
					<div class="service text-center" style="margin: 10px 0px;">
						<h4 class="comment-writer-id">${ commentlist.mId }</h4>
						<p>${ commentlist.content }</p>
						<c:if test="${ loginuser.mId eq commentlist.mId }">
							<img class="fnc-icon img-comment-del"
								src="/showmethecard/resources/images/comment-del.png"
								style="margin-top: 10px; height: 26px; width: auto;" />
						</c:if>
					</div>
					</figure>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container --> </section>

</body>
	<!-- Custom JavaScript -->
    <script src="../resources/assets/js/script.js"></script>
</html>