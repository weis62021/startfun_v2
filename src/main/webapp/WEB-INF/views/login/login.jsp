<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

	<!--  Meta tags -->
	<meta name="keywords" content="documentation template, help desk, open source, free template, freebies, bootstrap 4, bootstrap4">
	<meta name="description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">

	<!-- Schema.org -->
	<meta itemprop="name" content="Documentation Help Desk by Htmlstream">
	<meta itemprop="description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">
	<meta itemprop="image" content="docs-ui-kit-thumbnail.jpg">

	<!-- Open Graph -->
	<meta property="og:title" content="Documentation Help Desk by Htmlstream">
	<meta property="og:type" content="article">
	<meta property="og:url" content="https://htmlstream.com/preview/docs-ui-kit/index.html">
	<meta property="og:image" content="docs-ui-kit-thumbnail.jpg">
	<meta property="og:description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">
	<meta property="og:site_name" content="Htmlstream">

	<!-- CSS font -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notosanskr.css">
	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/fontawesome-all.min.css">
	<!-- CSS Template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css">
	<!-- CSS Demo -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
		
	<!-- common JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->

<!-- main -->
<main>
	<div class="container">
		<div class="justify-content-center py-11">
			<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
		    	<h2 class="text-center">?????????</h2>
		    </div>
			<div class="col-lg-5 mx-auto">
			<div class="card">
			
			<c:url value="/startfun/login" var="loginURL"/>
			<form name="f" action="${loginURL}" method="post" style="padding-top: 25px;">
			
				<div class="row mt-4 mb-4 justify-content-center">
	          		<div class="form-group col-md-10 ">
	          			<input type="text" name="email" id="email" class="form-control form-pill-login"  placeholder="??????????????? ??????">
	          			<small id="email_check" class="text-danger"></small>
	          		</div>
					<div class="form-group col-md-10 ">
						<input type="password" name="password" id="password" class="form-control form-pill-login" placeholder="???????????? ??????">
	          			<small id="password_check" class="text-danger"></small>
	          		</div>
	          		
					<!-- Spring Login ?????? ???  -->
					<c:if test="${param.error != null}">
						<small class="text-danger">
							<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			      				<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
							</c:if>
						</small>
					</c:if>						
				</div>
				
				<div class="mx-auto col-sm-11 text-center mb-4 mt-5">
	          		<button id="submit" type="submit" class="btn btn-sm btn-block btn-primary"> ????????? </button>
	          	</div>
	          	<div class="mx-auto col-sm-11 text-center mb-4 mt-5">
	          		<small>?????? ???????????? ????????? ???????????????? <a href="/startfun/joinus/join.do"> ????????????</a> </small>
	          		<br><hr>
	          	</div>
	          	
	          	<div class="mx-auto text-center mb-5 mt-2">
	          		<a href="/startfun/searchId.do" class="mr-3">????????? ??????</a>
	          		<a href="/startfun/forgotpassword.do" class="mr-3">???????????? ??????</a>
	          	</div>

			</form>
		
<!--  			<ul>
				<li onclick="kakaoLogin()">
					<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
					</a>
				</li>
			</ul>
			
			<form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do">
				<input type="hidden" name="email" id="kakaoEmail" />
				<input type="hidden" name="id" id="kakaoId" />
				<input type="hidden" name="flag" id="flag" value="kakao" />
			</form>  -->
		
			</div>
			
			</div>
		</div>
	</div>
</main>
<!-- End main -->

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
<!-- ????????? ????????? --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script> 
<script type="text/javascript">
	
	//????????? ????????????
	$('#submit').click(function(){
		
		if($('#email').val() == '') {
			$('#email_check').text("???????????? ???????????????");
			$('#email').addClass('is-invalid');
			$('#email').focus();
			return false;
		}else {
			$('#email_check').text('');
			$('#email').removeClass('is-invalid');
		}
		
		if($('#password').val() == '') {
			$('#password_check').text('??????????????? ???????????????');
			$('#password').addClass('is-invalid');
			$('#password').focus();
			return false;
		}else {
			$('#password_check').text('');
			$('#password').removeClass('is-invalid');
		}
		
		return true;
	});
/*
	//????????? ?????????
	$(document).ready(function(){ 
		Kakao.init('87abc215385f939a079133124a532df9'); 
		Kakao.isInitialized(); 
	});
	
	//????????? ????????? ??????
	function kakaoLogin() {
		Kakao.Auth.login({
			success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function (response) {
					console.log(response);
					kakaoLoginPro(response);
				},
				fail: function (error) {
					console.log(error)
				},
			})
			},
			fail: function (error) {
				console.log(error)
			}
		})
	}
	
	//????????? ????????? ????????????
	function kakaoLoginPro(response){
		var data = {id:response.id, email:response.kakao_account.email, name:response.properties.nickname}
		$.ajax({
			type : 'POST',
			url : '/startfun/kakao/login.do',
			data : data,
			dataType : 'json',
			success : function(data){
				console.log(data)
				if(data.JavaData == "YES"){
					alert("????????????????????????.");
					//location.href = '/startfun/index.do'
				}else if(data.JavaData == "register"){
					$("#kakaoEmail").val(response.kakao_account.email);
					$("#kakaoId").val(response.id);
					$("#kakaoForm").submit();
				}else{
					swal("???????????? ??????????????????");
				}
			},
			error: function(xhr, status, error){
				alert("???????????? ??????????????????."+error);
			}
		});
	}

	function kakaoLogout() {
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(res) {
				alert('success: ' + JSON.stringify(res))
			},
			fail : function(err) {
				alert('fail: ' + JSON.stringify(err))
			},
		})
	}*/
</script>

</html>