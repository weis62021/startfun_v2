<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	<style type="text/css">
		.VisualSlide_container__1lgSN {
			height: 50vh;
			display: block;
			position: relative;
			background: no-repeat 50%/cover;
		}
		.VisualSlide_wrap__11Qnk {
			padding: 0 110px;
			display: block;
			position: absolute;
			bottom: 0;
			left: 50%;
			transform: translate(-50%);
			width: 100%;
			max-width: 1440px;
			box-sizing: border-box!important;
		}
		.VisualSlide_text__1vRyr {
			padding: 40px 0 45px;
		}
		.VisualSlide_title__gELf9 {
			width: 460px;
			line-height: 40px;
			font-size: 32px;
			font-weight: 700;
			display: block;
			margin-bottom: 8px;
			word-break: break-all;
			letter-spacing: -.7px;
			color: #fff;
		}
		.VisualSlide_badge__HWnUy {
			line-height: 18px;
			font-size: 13px;
			display: inline-block;
			margin-right: 4px;
			color: #fff;
			font-weight: 500;
		}
		.project-start {
			font-weight: 500;
		}
 		.main-tag {
			font-size: 18px;
			color: #555;
		}
 		.main-tag.active {
			color: #205DA0;
		} 
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//?????? ???????????? ??????
			if(${not empty wishList}){ //?????? ??????????????? ????????? ??????
				$('input[name=commingsoonProject]').each(function(index, item){	//???????????????????????? ?????????
					<c:forEach items="${wishList}" var="list">
						if($(item).val()===String(${list.project_no})){
							$(this).next().attr('class', 'w-100 btn btn-sm btn-danger');
							$(this).next().html('<i class="fas fa-heart mr-2"></i>?????? ????????????');
						}
					</c:forEach>
				});
			}
			
			//?????? ???????????? ?????? ?????? ??????
			$('button[name=wishBtn]').on('click', function(){
				if(${pageContext.request.userPrincipal.name eq null}){
					swal({
						  text: "????????? ???????????? ?????????????????????????",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  location.href = "/startfun/login.do";
						  }
					});
				}
				var resultString = '';
				$.ajax(
						{
							type : "post",
							url : "/startfun/wishProject.do",
							data : {project_no : $(this).prev().val()},
							async: false,
							success : function(data){ 
				                if(data.result == 'success') { //????????????
				                	console.log('????????????')
				                	resultString = 'success';
				                	swal({
			                            text: "????????????????????? ???????????????.",
			                            button: false,
			                            timer: 1500
			                        }); 
				                }else if(data.result == 'cancell') { //??????????????????
				                	console.log('??????????????????')
				                	resultString = 'cancell';
				                	swal({
			                            text: "????????????????????? ???????????????.",
			                            button: false,
			                            timer: 1500
			                        }); 
			                	}
			            	} 
						}	
					);

				if(resultString=='cancell'){
					$(this).attr('class', 'w-100 btn btn-sm btn-outline-danger');
					$(this).html('<i class="far fa-heart mr-2"></i>?????? ???????????? ??????');
				}else if(resultString=='success'){
					$(this).attr('class', 'w-100 btn btn-sm btn-danger');
					$(this).html('<i class="fas fa-heart mr-2"></i>?????? ????????????');
				}
			});
			
			
			
		});
	</script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<c:set var="principal" value="${pageContext.request.userPrincipal.name}" />

  <!-- Promo Section -->
  <section class="duik-promo">
		
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="rounded active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1" class="rounded"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2" class="rounded"></li>
		  </ol>
		
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a class="d-block w-100 VisualSlide_container__1lgSN" style="background-image: url('${pageContext.request.contextPath}/resources/img-temp/1920x1280/BANNER_20210616014449243.jpg')">
			      <div class="VisualSlide_wrap__11Qnk">
			      	<div class="VisualSlide_text__1vRyr">
			      		<p class="VisualSlide_title__gELf9">???????????? ?????? ?????????<br>?????? ????????? ????????? ??????????</p>
			      		<p class="VisualSlide_badge__HWnUy">???????????? ????????? ????????? ????????? ??? ?????????</p>
			      	</div>
	        	  </div>
        	  </a>
		    </div>
			<div class="carousel-item">
		      <a class="d-block w-100 VisualSlide_container__1lgSN" style="background-image: url('${pageContext.request.contextPath}/resources/img-temp/1920x1280/BANNER_20210618112744973.jpg')">
			      <div class="VisualSlide_wrap__11Qnk">
			      	<div class="VisualSlide_text__1vRyr">
			      		<p class="VisualSlide_title__gELf9">6??? 20???, ?????? ????????? ???<br>???????????? ???????????? ??????</p>
			      		<p class="VisualSlide_badge__HWnUy">??????(Link the Heart) ????????? ??????</p>
			      	</div>
	        	  </div>
        	  </a>
		    </div>
		    <div class="carousel-item">
		      <a class="d-block w-100 VisualSlide_container__1lgSN" style="background-image: url('${pageContext.request.contextPath}/resources/img-temp/1920x1280/BANNER_20210618114004389.jpg')">
			      <div class="VisualSlide_wrap__11Qnk">
			      	<div class="VisualSlide_text__1vRyr">
			      		<p class="VisualSlide_title__gELf9">?????? ????????? ?????????<br>'?????????'??? ???????????? ???</p>
			      		<p class="VisualSlide_badge__HWnUy">#????????? ???????????? #??????????????????</p>
			      	</div>
	        	  </div>
        	  </a>
		    </div>
		  </div>
		
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span aria-hidden="true">
		      <svg class="duik-icon-svg-white duik-icon-svg-2x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
		    </span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span aria-hidden="true">
		      <svg class="duik-icon-svg-white duik-icon-svg-2x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
		    </span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>

  </section>
  <!-- End Promo Section -->

  <main>
    <!-- ?????????????????? -->
    <section class="py-10">
      <div class="container">
        <div class="w-md-100 mx-auto">
        	<div class="mb-3 text-center">
        		<h3 class="h3"><b>?????? ????????????</b></h3>
        		<!-- ??? -->
        		<ul id="hotProject_Tab" class="nav justify-content-center" role="tablist">
				  <li class="nav-item">
				    <a class="nav-link main-tag active" href="#hotSupportProject" role="tab" aria-selected="true"
				       data-toggle="tab">#?????????
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link main-tag" href="#hotInvestProject" role="tab" aria-selected="false"
				       data-toggle="tab">#?????????
				    </a>
				  </li>
				</ul>
        	</div>
        	<div id="hotProject_Content" class="card-body tab-content py-0 px-3">
        		<!-- ?????? ???????????? - ????????? -->
        		<div class="tab-pane fade show active" id="hotSupportProject" role="tabpanel">
		        	<div class="row justify-content-center py-3">
		        		<c:forEach items="${sponsorSortSupport}" var="list">
				          <div class="mx-auto col-lg-3 mb-3 ">
				            <div class="card border-1 shadow">
				              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
				             	<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/supportDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
								<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/investDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
				              </div>
				              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
				              	<!-- ????????? / ???????????? -->
								<div class="col nav justify-content-between text-center py-3">
								   <div class="row">
								     <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
								       ${list.memberVO.member_name}
								   </div>
								   <div class="row">
								     <span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
								   </div>
						        </div>
						        <!-- ?????? -->
							    <div class="col text-center mt-2" style="min-height: 72px">
							      <span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
							    </div>
				              	<c:if test="${list.dday >= '0'}">
				              	<!-- ???????????? ??????????????? ?????? -->
				              	<!-- ?????? -->
					            <div>
					              <fmt:formatNumber value="${list.total}" pattern="#,###"/>???
					               &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${list.rate}%</span>
					            </div>
					            <!-- ?????????????????? -->
					            <div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
									<div class="progress-bar" role="progressbar" style="width: ${list.rate}%; background: #ff7878;" 
									     aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
								<!-- ???????????? -->
					            <div class="text-right mt-1">
									<c:choose>
										<c:when test="${list.dday > '0'}">
										   D-${list.dday}
										</c:when>
										<c:when test="${list.dday == '0'}">
										   D-day
										</c:when>
									</c:choose>
					            </div>
								</c:if>
				              </div>
				            </div>
				          </div>
				          </c:forEach>
		        	</div>
	        	</div><!-- ?????????????????? - ????????? ??? -->
	        	<!-- ?????? ???????????? - ????????? -->
        		<div class="tab-pane fade show" id="hotInvestProject" role="tabpanel">
		        	<div class="row justify-content-center py-3">
		        		<c:forEach items="${sponsorSortInvest}" var="list">
				          <div class="mx-auto col-lg-3 mb-3 ">
				            <div class="card border-1 shadow">
				              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
				             	<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/supportDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
								<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/investDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
				              </div>
				              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
				              	<!-- ????????? / ???????????? -->
								<div class="col nav justify-content-between text-center py-3">
								   <div class="row">
								     <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
								     <c:if test="${list.project_type eq '??????'}"> 
								     ${list.memberVO.member_name}
								     </c:if>
								     <c:if test="${list.project_type eq '??????'}">
								     ${list.memberVO.member_company}
								     </c:if>
								   </div>
								   <div class="row">
								     <span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
								   </div>
						        </div>
						        <!-- ?????? -->
							    <div class="col text-center mt-2" style="min-height: 72px">
							      <span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
							    </div>
				              	<c:if test="${list.dday >= '0'}">
				              	<!-- ???????????? ??????????????? ?????? -->
				              	<!-- ?????? -->
					            <div>
					              <fmt:formatNumber value="${list.total}" pattern="#,###"/>???
					              &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${list.rate}%</span>
					            </div>
					            <!-- ?????????????????? -->
					            <div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
									<div class="progress-bar" role="progressbar" style="width: ${list.rate}%; background: #ff7878;" 
									     aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
								<!-- ???????????? -->
					            <div class="text-right mt-1">
									<c:choose>
										<c:when test="${list.dday > '0'}">
										   D-${list.dday}
										</c:when>
										<c:when test="${list.dday == '0'}">
										   D-day
										</c:when>
									</c:choose>
					            </div>
								</c:if>
				              </div>
				            </div>
				          </div>
				          </c:forEach>
		        	</div>
	        	</div><!-- ?????????????????? - ????????? ??? -->
        	</div>
        </div>
      </div>
    </section>
    <!-- End ?????????????????? -->
    
    <!-- ?????????????????? -->
    <section class="pb-10">
      <div class="container">
        <div class="w-md-100 mx-auto">
        	<div class="mb-3 text-center">
        		<h3 class="h3"><b>?????? ????????????</b></h3>
        		<!-- ??? -->
        		<ul id="newProject_Tab" class="nav justify-content-center" role="tablist">
				  <li class="nav-item">
				    <a class="nav-link main-tag active" href="#newSupportProject" role="tab" aria-selected="true"
				       data-toggle="tab">#?????????
				    </a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link main-tag" href="#newInvestProject" role="tab" aria-selected="false"
				       data-toggle="tab">#?????????
				    </a>
				  </li>
				</ul>
        	</div>
        	<div id="newProject_Content" class="card-body tab-content py-0 px-3">
        		<!-- ?????? ???????????? - ????????? -->
        		<div class="tab-pane fade show active" id="newSupportProject" role="tabpanel">
		        	<div class="row justify-content-center py-3">
		        		<c:forEach items="${startSortSupport}" var="list">
				          <div class="mx-auto col-lg-3 mb-3 ">
				            <div class="card border-1 shadow">
				              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
				             	<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/supportDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
								<c:if test="${list.project_type eq '??????'}">
				    				<a href="/startfun/investDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
				              </div>
				              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
				              	<!-- ????????? / ???????????? -->
								<div class="col nav justify-content-between text-center py-3">
								   <div class="row">
								     <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
								     <c:if test="${list.project_type eq '??????'}"> 
								     ${list.memberVO.member_name}
								     </c:if>
								     <c:if test="${list.project_type eq '??????'}">
								     ${list.memberVO.member_company}
								     </c:if>
								   </div>
								   <div class="row">
								     <span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
								   </div>
						        </div>
						        <!-- ?????? -->
							    <div class="col text-center mt-2" style="min-height: 72px">
							      <span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
							    </div>
				              	<c:if test="${list.dday >= '0'}">
				              	<!-- ???????????? ??????????????? ?????? -->
				              	<!-- ?????? -->
					            <div>
					              <fmt:formatNumber value="${list.total}" pattern="#,###"/>???
					              &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${list.rate}%</span>
					            </div>
					            <!-- ?????????????????? -->
					            <div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
									<div class="progress-bar" role="progressbar" style="width: ${list.rate}%; background: #ff7878;"  
									      aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
								<!-- ???????????? -->
					            <div class="text-right mt-1">
									<c:choose>
										<c:when test="${list.dday > '0'}">
										   D-${list.dday}
										</c:when>
										<c:when test="${list.dday == '0'}">
										   D-day
										</c:when>
									</c:choose>
					            </div>
								</c:if>
				              </div>
				            </div>
				          </div>
				          </c:forEach>
		        	</div>
	        	</div><!-- ?????????????????? - ????????? ??? -->
	        	<!-- ?????? ???????????? - ????????? -->
        		<div class="tab-pane fade show" id="newInvestProject" role="tabpanel">
		        	<div class="row justify-content-center py-3">
		        		<c:forEach items="${startSortInvest}" var="list">
				          <div class="mx-auto col-lg-3 mb-3 ">
				            <div class="card border-1 shadow">
				              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
				             	<c:if test="${list.project_type eq '??????'}">
				    				<a href="${pageContext.request.contextPath}/supportDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
								<c:if test="${list.project_type eq '??????'}">
				    				<a href="${pageContext.request.contextPath}/investDetail.do?project_no=${list.project_no}"> 
				    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
									</a>
								</c:if>
				              </div>
				              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
				              	<!-- ????????? / ???????????? -->
								<div class="col nav justify-content-between text-center py-3">
								   <div class="row">
								     <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
								     <c:if test="${list.project_type eq '??????'}"> 
								     ${list.memberVO.member_name}
								     </c:if>
								     <c:if test="${list.project_type eq '??????'}">
								     ${list.memberVO.member_company}
								     </c:if>
								   </div>
								   <div class="row">
								     <span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
								   </div>
						        </div>
						        <!-- ?????? -->
							    <div class="col text-center mt-2" style="min-height: 72px">
							      <span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
							    </div>
				              	<c:if test="${list.dday >= '0'}">
				              	<!-- ???????????? ??????????????? ?????? -->
				              	<!-- ?????? -->
					            <div>
					              <fmt:formatNumber value="${list.total}" pattern="#,###"/>???
					              &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${list.rate}%</span>
					            </div>
					            <!-- ?????????????????? -->
					            <div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
									<div class="progress-bar" role="progressbar" style="width: ${list.rate}%; background: #ff7878;" 
										 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>
								<!-- ???????????? -->
					            <div class="text-right mt-1">
									<c:choose>
										<c:when test="${list.dday > '0'}">
										   D-${list.dday}
										</c:when>
										<c:when test="${list.dday == '0'}">
										   D-day
										</c:when>
									</c:choose>
					            </div>
								</c:if>
				              </div>
				            </div>
				          </div>
				          </c:forEach>
		        	</div>
	        	</div><!-- ?????????????????? - ????????? ??? -->
        	</div>
        </div>
      </div>
    </section>
    <!-- End ?????????????????? -->
    
    <!-- ???????????????????????? -->
    <section class="pb-3">
    	<div class="container">
    		<div class="w-md-100 mx-auto">
    			<div class="mb-3 text-center">
	        		<h3 class="h3"><b>???????????? ????????????</b></h3>
	        		<small class="text-primary project-start">?????? ??????????????? ???????????? ?????? ??? ????????? ???????????????</small>
	        	</div>
	        	<div class="row justify-content-center py-3">
	        		<c:forEach items="${commingsoonProject}" var="list">
	        			<!-- ???????????? -->
	        			<div class="mx-auto col-lg-3 mb-3 ">
	        				<!-- ???????????? -->
	        				<div class="card border-1 shadow">
	        					<!-- ?????? ?????? - ?????? -->
	        					<div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden; ">
				    				<img width="100%" height="100%" style="object-fit:cover" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
	        					</div>
	        					<!-- ?????? ?????? -->
	        					<div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
		        					<!-- ????????? / ???????????? -->
						           	<div class="col nav justify-content-between text-center py-3">
						           		<div class="row">
						           			<img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
						             		<c:if test="${list.project_type eq '??????'}"> 
										    ${list.memberVO.member_name}
										    </c:if>
										    <c:if test="${list.project_type eq '??????'}">
										    ${list.memberVO.member_company}
										    </c:if>
						             	</div>
						             	<div class="row">
						             		<span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
						             	</div>
				              		</div>
				              		<!-- ?????? -->
					              	<div class="col text-center mt-2" style="min-height: 72px">
					          		 	<span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
					              	</div>
					              	<!-- ????????? -->
					              	<div class="col text-center" >
										<small class='text-primary project-start'>
											${fn:substring(list.project_start, 0, 4) }???
											${fn:substring(list.project_start, 5, 7) }???
											${fn:substring(list.project_start, 8, 11) }??? ????????????
										</small>
					              	</div>
					              	<!-- ?????? ???????????? ?????? -->
					              	<div class="col text-center border-1 mt-3 mb-2">
					              		<input type="hidden" name="commingsoonProject" value="${list.project_no }">
					              		<button name="wishBtn" type="button" class="w-100 btn btn-sm btn-outline-danger">
					              			<i class="far fa-heart mr-2"></i>?????? ???????????? ??????</button>
					              	</div>
	        					</div>
	        				</div>
	        			</div>
	        		</c:forEach>
	        	</div>
    		</div>
    	</div>
    </section>
	
	<!-- ???????????? ?????? -->
	<section class="pb-11">
      <div class="container">
        <div class="w-md-100 mx-auto">
        	<div class="row justify-content-center py-3">
        		<div class="d-block w-100 p-8" style="background-image: url('${pageContext.request.contextPath}/resources/img-temp/1920x1280/img-fundingopen-pc.51ce91c1.jpg')">
        			<div class="text-center">
        				<h2 class="text-white"><b>?????????????????? ???????????? ????????????</b></h2>
        				<p class="text-white">????????? ???????????? ???????????? ???????????? ???????????? ???????????????</p>
        				<button type="button" class="btn btn-primary"  id="applicationBtn">???????????? ???</button>
        			</div>
        		</div>
        	</div>
        </div>
   	  </div>
    </section>

</main>
<!-- End main -->

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
<script type="text/javascript">
//???????????? ?????? ???????????? ?????? ??????
$('#applicationBtn').click(function(){
	var principal = '${principal}'
	
	console.log(principal);
	if(${pageContext.request.userPrincipal.name eq null}) {
		swal({
			  text: "????????? ???????????? ?????????????????????????",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href = "/startfun/login.do";
			  }
		});
	}else {
		$.ajax(
			   {
				type : "post",
				url  : "memberType.do",
				data : {member_email : principal},
		        async: false,
		        success : function(data){ 
	                    
		        		if(data == '??????') {
		        			location.href = "/startfun/project/investProjectReg.do";
	                   }else {
	                	   location.href = "/startfun/project/supportProjectReg.do";
	                   }
	            } 
	   		});
	}			
});
</script>
</html>