<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.png">

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
      <div class="row justify-content-center py-8">
        <div class="col-lg-6">
		  <div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
            <h2 class="h3 text-center">??????????????????</h2>
          </div>
          <div class="card">
          <br>
            <!-- Form -->
			<form method="post" action="/startfun/joinus/register.do" id="join" name="join">
			  <div class="row mb-4 justify-content-center">
				<div class="form-group col-md-10 ">
					<label for="member_email">?????????</label>
					<div class="input-group">
						<input type="text"name="member_email" id="member_email" value="${param.member_email}" class="form-control form-pill" readonly />
					</div>
					<small id="emailCheck"></small> 
				</div>
				<!-- End of Form -->
				<div class="form-group col-md-10 ">
				  <label for="member_name">??????</label>
				    <div class="input-group">
					  <input type="text"name="member_name" id="member_name" class="form-control form-pill" required />
					</div>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="phone">????????????</label>
					<div class="input-group">
						<input type="text" name="member_phone" id="member_phone" class="form-control form-pill" />
					</div>
					<small id="phoneCheck"></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="password">????????????</label>
					<div class="input-group">
						<input type="password"name="member_password" id="member_password"class="form-control form-pill" />
					</div>
				  <small id=lengthCheck></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="password">???????????? ??????</label>
					<div class="input-group"> 
						<input type="password"name="passwordheck" id="passwordCheck"class="form-control form-pill" /> 
					</div>
					<small id="pwdCheck"></small>
				</div>
			  </div>
			  <button type ="submit" class="btn btn-primary btn-block" id="submit">????????????</button>
			</form>
		</div>
      </div>
    </div>
  </div>
</main>
	
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>


<script type="text/javascript">
<!-- ????????? ???????????? -->
$(document).ready(function(){
	$('#idCheck').click(function(){
		var email = $('#member_email').val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$.ajax({
			type : "post", 	
			url : "idcheck.do",
			data : {"member_email" : email},
			success : function(data){
				console.log(data);
				var responsedata = JSON.parse(data);
				if(email == ""){
					swal({
						icon:'warning',
                        text: "???????????? ??????????????????."
                   }); 
					return false;
				}
				
				if(responsedata == 1){
					swal({
						icon:'warning',
                        text: "????????? ??????????????????."
                   });
					return false;
				}else if(responsedata == 0){
					swal({
                        text: "??????????????? ??????????????????.",
                        button: false,
                        timer: 1500
                   }); 
				}
			}
		})
	})
})

<!-- ????????? ???????????? -->
$('#member_email').keyup(function(){
	emailCheck();
});
function emailCheck(){
		let email = $('#member_email').val();
		console.log(email)
		let regExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(regExp.test(email)){
			$('#emailCheck').text('');
		}else if(!regExp.test(email)){
			$('#emailCheck').text('????????? ????????? ???????????? ??????(@??????)');
			$('#emailCheck').css('color','red');
			return false;
		}
};

<!-- ???????????? ?????? -->
$('#passwordCheck').keyup(function(){
	passwordCheck();
});
function passwordCheck(){
	
		let pwd1 = $('#member_password').val();
		let pwd2 = $('#passwordCheck').val();
		
		if(pwd1 !=''|| pwd2 !=''){
			if(pwd1==pwd2){
				$('#pwdCheck').text('??????');
				$('#pwdCheck').css('color','blue');
			}else if(pwd1 != pwd2){
				$('#pwdCheck').text('????????? ????????????');
				$('#pwdCheck').css('color','red');
				return false;
			}else{
				$('#pwdCheck').text('');
			}
		}
		if(pwd1.length < 8){
			$('#lengthCheck').text('8?????? ?????? 14?????? ?????? ??????');
			$('#lengthCheck').css('color','red');
			return false;
		}else if(pwd1.length > 14){
			$('#lengthCheck').text('8?????? ?????? 14?????? ?????? ??????');
			$('#lengthCheck').css('color','red');
			return false;
			
		}else{
			$('#lengthCheck').text('');
		
		}
};

<!-- ????????? ?????? ???????????? -->
$('#member_phone').keyup(function(){
	phoneCheck();
});
function phoneCheck(){
	let phonenum = $('#member_phone').val();
	let regExp =/^\d{3}-\d{3,4}-\d{4}$/;
		if(regExp.test(phonenum)){
			$('#phoneCheck').text('');
			
		}else if(!regExp.test(phonenum)){
			$('#phoneCheck').css('color','red');
			$('#phoneCheck').text("????????? ???????????? ???????????? ??????(-??????)");
			return false;
		}
};

<!-- ???????????? -->
function joinCheck(){
	if(!join.member_email.value){
		swal({
			icon:'warning',
            text: "???????????? ??????????????????."
        }); 
		return false;
	}
	if(!join.member_name.value){
		swal({
			icon:'warning',
            text: "????????? ??????????????????."
        }); 
		return false;
	}
	if(!join.member_phone.value){
		swal({
			icon:'warning',
            text: "???????????? ??????????????????."
        }); 
		return false;
	}
	if(!join.member_password.value){
		swal({
			icon:'warning',
            text: "??????????????? ??????????????????."
        }); 
		return false;
	}
	
}
$('#submit').click(function(){
	if(emailCheck() == false) return false;
	if(phoneCheck() == false) return false;
	if(passwordCheck()== false) return false;
	if(joinCheck() == false) return false;
	return true;
});
</script>
</html>
