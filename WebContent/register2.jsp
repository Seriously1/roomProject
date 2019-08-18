<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>King &mdash; Free Website Template, Free HTML5 Template by gettemplates.co</title>
	<meta name="viewport" content="width
	=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" ></script>

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
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
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
	
	<script type="text/javascript">
		var randomNum;
		var checkId = 0;
		var idOK;
		var numCheck = 0;
		var emailOK;
		var numOK;
		
		function nameCheck() {
			var name = $( '#name' ).val();
			if(name != ""){
				$("#name").css("background-color", "#B0F6AC");
			} else {
				$("#name").css("background-color", "#FFCECE");
			}
		}
		
		function idCheck() {
			var id = $( '#id' ).val();
			$.ajax({
				type: 'post',
				url: 'idCheck.to',
				data: {id : id},
				success: function(result) {
					if(result == 1 && id != "") {
						$('#idCheckMessage').html('?�용가?�한 ?�이?�입?�다.').css("color", "green");
						$("#id").css("background-color", "#B0F6AC");
						idOK = id;
						/* document.getElementById('id').readOnly = true; */
						checkId = 1;
					} else {
						$('#idCheckMessage').html('?��? ?�는 ?�이?�입?�다.').css("color", "red");
						$("#id").css("background-color", "#FFCECE");
						checkId = 0;
					}
				}
			})
		}
		
		function emailOK() {
			randomNum = Math.floor(Math.random() * 100000001) + 1000000;;
			var email = $('#email').val();
			$.ajax({
				type: 'post',
				url: 'EmailAction.to',
				data: {"email" : email, "randomNum" : randomNum},
				success: function(result) {
					if(result == 0) {	
						alert('?��? ?�증???�메???�니??');
					} else {
						alert('?�메?�이 발송?�었?�니??');
						emailOK = email;
						document.getElementById('incl').style.display = 'block';
					}
				}
			})
			document.getElementById('incl').style.display = 'block';
		}
		
		function randomCheck() {
			var inputNum = $('#inputNum').val();

			if(inputNum == randomNum) {
				alert('?�증?�었?�니??');
				numOK = inputNum;
				$("#email").css("background-color", "#B0F6AC");
				$("#inputNum").css("background-color", "#B0F6AC");
				numCheck = 1;

			} else {
				alert('?�증번호가 ?�릅?�다.');
				$("#email").css("background-color", "#FFCECE");
				$("#inputNum").css("background-color", "#FFCECE");
				numCheck = 0;
			}
		} 
		
		function pwdCheck() {
			var pwd1 = $( '#pwd1' ).val();
			var pwd2 = $( '#pwd2' ).val();
			if(pwd1 == pwd2) {
				$('#pwdCheckMessage').html('');
				$("#pwd1").css("background-color", "#B0F6AC");
				$("#pwd2").css("background-color", "#B0F6AC");
			} else {
				$('#pwdCheckMessage').html('비�?번호가 ?�로 ?�치?��? ?�습?�다.');
				$("#pwd1").css("background-color", "#FFCECE");
				$("#pwd2").css("background-color", "#FFCECE");
			}
		}
		
		function phoneCheck() {
			var phone = $( '#phone' ).val();
			if(phone != ""){
				$("#phone").css("background-color", "#B0F6AC");
			} else {
				$("#phone").css("background-color", "#FFCECE");
			}
		}
		
		function check() {
			var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var getPhone = RegExp(/^01([0|1|6|7|8|9]?)+-([0-9]{3,4})+-([0-9]{4})$/);
			
			if(!getCheck.test($("#id").val())) {
			      alert("?�식??맞춰???�력?�주?�요.");
			      $("#id").val("");
			      $("#id").focus();
			      return false;
			}
			if(!getCheck.test($("#pwd1").val())) {
			      alert("?�식??맞춰???�력?�주?�요.");
			      $("#pwd1").val("");
			      $("#pwd1").focus();
			      return false;
			}
			if ($("#id").val()==($("#pwd1").val())) {
			      alert("비�?번호가 ?�이?�랑 같습?�다.");
			      $("#pwd1").val("");
			      $("#pwd1").focus();
			      return false;
			}
			if ($("#pwd1").val()!=($("#pwd2").val())) {
			      alert("비�?번호가 ?�릅?�다.");
			      $("#pwd1").val("");
			      $("#pwd2").val("");
			      $("#pwd1").focus();
			      return false;
			}
			if(!getMail.test($("#email").val())){
		        alert("?�바�??�메??주소�??�력?�주?�요.");
		        $("#email").val("");
		        $("#email").focus();	
		        return false;
		    }
			if(!getPhone.test($("#phone").val())){
		        alert("?�드???�식?�로 ?�주?�요.");
		        $("#phone").val("");
		        $("#phone").focus();
		        return false;
		    }
			if(checkId == 0) {
				alert("?�이??중복?�인???�주?�요.");
				return false;
			}
			if(idOK != ($("#id").val())){
				alert("?�이??중복?�인???�러주세??");
				return false;
			}
			if($.trim($("#name").val()) !== $("#name").val()){
				alert("공백?� ?�력??불�??�합?�다.");
				$("#name").val("");
		        $("#name").focus();
				return false;
			}
			if(emailOK != ($("#email").val())){
				alert("?�메???�증???�러주세??");
				return false;
			}
			if(numOK != ($("#inputNum").val())){
				alert("?�메???�증???�러주세??");
				return false;
			}
			if(numCheck == 0) { // ?�증???�면 ?�어�?
				alert("?�메???�증?�인???�주?�요.");
				return false;
			}
			
			return true;
		}
		
			
	</script>
	
	</head>
	<body>
	
	<div class="fh5co-loader"></div>
	

	 <nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo"><a href="index.jsp">2�?/a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li class="has-dropdown">
							<a href="">?�룸</a>
							<ul class="dropdown">
								<li><a href="kakaomap_test/kakaomap_v1.09_reply11.jsp">?�룸 검??/a></li>
								<li><a href="#">?�세 검??/a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="">�??�놓�?/a>
							<ul class="dropdown">
								<li><a href="#">매물 보기</a></li>
								<li><a href="out.jsp">??�??�놓�?/a></li>
							</ul>
						</li>

                  
               <c:if test="${sessionScope.sessionID==null}">
                  <li class="btn-cta"><a href="login.to"><span>로그??/span></a></li>
               
                        <li class="btn-cta"><a href="register.to"><span>?�원가??/span></a></li> 
                    </c:if>
                    
                    <c:if test="${sessionScope.sessionID!=null}">
                         
                  <li class="btn-cta"><span style="font-size: 30px">${sessionScope.sessionID }??/span></li> 
                  <li class="btn-cta"><a href="logout.to"><span>로그?�웃</span></a></li>
               
                    </c:if>
                     
               </ul>
               
               
               
            </div>
         </div>
         
      </div>
   </nav>




	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Contact Us</h1>
							<h2>Free html5 templates Made by <a href="http://freehtml5.co" target="_blank">freehtml5.co</a></h2>
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
            <h5 class="card-title text-center">?�반 ?�원가??/h5>
            <form class="form-signin" action="JoinAction.to" method="post" onsubmit="return check();" autocomplete="off">
             
             <div class="form-label-group">
                <input type="text" name="name" id="name" oninput="nameCheck()" class="form-control" placeholder="?�름" required autofocus>
              </div>
             
              <div class="form-label-group">

                <input type="text" name="id" id="id" class="form-control" placeholder="?�이????~12?�의 ?�문 ?�?�문?��? ?�자" maxlength="12" required>
                <button type="button" onclick="idCheck()">중복?�인</button><h3 id="idCheckMessage"></h3	>

              </div>

              <div class="form-label-group">
                <input type="password" oninput="pwdCheck()" id="pwd1" name="pwd1" class="form-control" placeholder="비�?번호 ??~12?�의 ?�문 ?�?�문?��? ?�자" maxlength="12" required>
              </div>
              
              <div class="form-label-group">
                <input type="password" oninput="pwdCheck()" id="pwd2" name="pwd2" class="form-control" placeholder="비�?번호 ?�인" maxlength="12" required>
              </div>
              
              <div class="form-label-group">
                <input type="email" name="email" id="email" class="form-control" placeholder="?�메??" required>
                <button type="button" onclick="emailOK()">?�메???�증</button>

              </div>
              
              <div class="form-label-group" id="incl" style="display:none">
                <input type="text" name="inputNum" id="inputNum" class="form-control">
                <button type="button" onclick="randomCheck()">?�증?�인</button>
             </div>
              
              <div class="form-label-group">
                <input type="text" name="phone" id="phone" oninput="phoneCheck()" class="form-control" placeholder="?�화번호 ??10-1111-1111" required>

              </div>
              
              <div class="form-label-group">
              <h5 style="color: red;" id="pwdCheckMessage"></h5>
              </div>

              <button id="button" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" >?�원가??/button>

             
            </form>
          </div>
           </div>
        </div>
      </div>
    </div>
  </div>

	</div>
	


	<div id="fh5co-started">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Lets Get Started</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<form class="form-inline">
						<div class="col-md-6 col-md-offset-3 col-sm-6">
							<button type="submit" class="btn btn-default btn-block">Get In Touch</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h3>King.</h3>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p><a href="#">Learn More</a></p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Shop</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Testimonials</a></li>
						<li><a href="#">Handbook</a></li>
						<li><a href="#">Held Desk</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Find Designers</a></li>
						<li><a href="#">Find Developers</a></li>
						<li><a href="#">Teams</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">API</a></li>
					</ul>
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
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

