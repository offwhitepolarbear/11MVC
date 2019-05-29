<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
	  body {
            padding-top : 50px;
        }
    </style>
<!-- ToolBar Start /////////////////////////////////////-->

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/index.jsp"><i class="glyphicon glyphicon-gift">${user.userId}</i></a>
    </div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div class="collapse navbar-collapse"  id="target">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	             
	               <!-- 운영자 전용메뉴 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >관리자 전용</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<li><a href="#">회원정보조회</a></li>
		                     	<li class="divider"></li>
		                        <li><a href="#">신규상품등록</a></li>
		                        <li><a href="#">상품관리메뉴</a></li>
		                        <li class="divider"></li>		                        
	                         	<li><a href="#">거래관리</a></li>
		                        <li><a href="#">ETC</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	             
	             
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                        
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	            
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품관련</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상 품 검 색</a></li>    
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">구매이력조회</a></li>
	                           <li><a href="#">장바구니</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">최근본상품</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 
	                 <li><a href="#">etc...</a></li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>

</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		//============= 회원정보조회 Event  처리 =============			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		//=============  개인정보조회회 Event  처리 =============	
		 	$( "a:contains('개인정보조회')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		
		 	$( "a:contains('신규상품등록')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/addProductView.jsp");
		 	});
		 	$( "a:contains('상품관리메뉴')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/listProductManager");
		 	});
		 	$( "a:contains('거래관리')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/listSalePurchase");
		 	});
		 	$( "a:contains('상 품 검 색')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/listProduct");
		 	});
		 	$( "a:contains('구매이력조회')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/listPurchase");
		 	});
		 	$( "a:contains('장바구니')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/getCart"); 	 		
		 	});
		 	
		 	$( "a:contains('최근')" ).on("click" , function() {
		 		alert("그런게 왜 궁금하시죠");
		 	});
		 	
		 	$( "a:contains('etc...')" ).on("click" , function() {
		 		
		 	});
		 	
		 	
		
		 });	
	</script> 