<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
		<meta charset="utf-8" />
	<title>Show Me The Cards</title>    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/font-awesome.min.css">
    
    <!-- Animate CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/animate.css"> <!-- home header -->
    
	<!-- Owl-Carousel 
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.transitions.css" >     -->

    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/material.css">   
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/color/blue.css" title="blue"> <!-- navigator css -->
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'> <!--  폰트 -->
        
   <!--  Modernizer js
    <script src="../resources/assets/js/modernizr.custom.js"></script> -->

    <!-- jQuery Version 2.1.3 -->
    <script src="../resources/assets/js/jquery-2.1.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../resources/assets/js/jquery.easing.1.3.js"></script>
    <script src="../resources/assets/js/classie.js"></script>
    <script src="../resources/assets/js/count-to.js"></script>
    <script src="../resources/assets/js/jquery.appear.js"></script>
    <script src="../resources/assets/js/owl.carousel.min.js"></script>
    <script src="../resources/assets/js/jquery.fitvids.js"></script>

	<script type="text/javascript">
	//point -> level
		$(document).ready(function() {
			//alert(${loginuser.mPoint});
			$.ajax({
				url : "/showmethecard/member/memberLevel.action",
				data : { mPoint : ${loginuser.mPoint} } ,
				method : "post",
				dataType : "text",
				success : function(data, status, xhr) {
					$('#mPoint').attr('src', '../resources/level/'+data+'.PNG')
					$('#levelText').html("LEVEL"+ data);
				}
			});
		});
	</script>
    

</head>

<body class="index">
    
    <c:import url="/WEB-INF/views/include/header.jsp" />

    <!-- Start Contact Us Section -->
    <section id="contact" class="contact contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div id="content" class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
                        <h2>포인트 내역 조회</h2>
                        <p>Show Me The Card</p>
                    </div>
                </div>
            </div>
            
            <div>
            	<img style="width: 40px; height: 40px;" id="mPoint"></img>
            	<span id="levelText" style="font-size: 30"></span>
            	<h3> 총 ${ loginuser.mPoint } 점 </h3>
            	<table class="table">
            		<thead class="text-danger">
            			<tr>
            				<th style="width: 200">REG DATE</th>
            				<th style="width: 250">POINT</th>
            				<th>CONTENT</th>
            			</tr>
            		</thead>
            		
            		<tbody>
            		 <c:forEach var="history" items="${ history }">
            		 	<tr>
            		 		<td>${ history.regDate }</td>
            		 		<td>${ history.point }</td>
            		 		<td>${ history.content }</td>
            		 	</tr>
            		 </c:forEach>
            		</tbody>
            	</table>
            </div>              
        </div>        
    </section>
</body>
	<!-- Custom JavaScript -->
    <script src="../resources/assets/js/script.js"></script>
</html>
