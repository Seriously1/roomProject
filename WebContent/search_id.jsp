<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>King &mdash; Free Website Template, Free HTML5 Template
	by gettemplates.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by gettemplates.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="gettemplates.co" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<script type="text/javascript">
	function check() {
		var name = $( '#name' ).val();
		var email = $( '#email' ).val();
		var phone = $( '#phone' ).val();
		var result =false;
		$.ajax({
			type: 'post',
			url: 'idSearch.to',
			data: {"name" : name, "email" : email, "phone" : phone},
			dataType: 'text',
			async : false,
			success: function(data) {
				if(data != "") {
					alert('찾은 아이디 : "'+data+'" 입니다.');
					result = true;
				} else {
					alert('아이디가 없습니다.');
					result = false;
				}
			}
		});
		return result;
	}
</script>
<body>
	<div class="fh5co-loader"></div>

		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo">
							<a href="index.html">2조</a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="index.html">Home</a></li>
							<li class="has-dropdown"><a href="">원룸</a>
								<ul class="dropdown">
									<li><a href="#">원룸 검색</a></li>
									<li><a href="#">상세 검색</a></li>
								</ul></li>
							<li class="has-dropdown"><a href="#">방 내놓기</a>
								<ul class="dropdown">
									<li><a href="#">매물 보기</a></li>
									<li><a href="out.html">내 방 내놓기</a></li>
								</ul></li>

							<li class="btn-cta"><a href="login.jsp"><span>로그인</span></a></li>
							<li class="btn-cta"><a href="register.html"><span>회원가입</span></a></li>
						</ul>


					</div>
				</div>

			</div>
		</nav>


		<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/img_bg_2.jpg);">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center">
               <div class="display-t">
                  <div class="display-tc animate-box" data-animate-effect="fadeIn">
                     <h1>OneRoom Planet</h1>
                     <div class="row">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </header>

		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="centered">
						<div class="card card-signin my-5">
							<div class="card-body">
								<h5 class="card-title text-center">아이디 찾기</h5>
								<form class="form-signin" method="post" action="login.to" onsubmit="return check()" autocomplete="off">

									<div class="form-label-group">
										<input type="text" id="name" name="name" class="form-control"
											placeholder="이름" required autofocus>
									</div>

									<div class="form-label-group">
										<input type="email" id="email" name="email" class="form-control"
											placeholder="이메일" required>
									</div>

									<div class="form-label-group">
										<input type="text" id="phone" name="phone" class="form-control"
											placeholder="전화번호" required>
									</div>

									<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">찾기</button>


								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>