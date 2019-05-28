<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	// $( ".btn btn-primary:contains('사러가기')" ).on("click" , function() {
		 $( "#goToBuy" ).on("click" , function() {
			 var prodNo = $("#prodNo").text().trim();
	 $("form").attr("method" , "GET").attr("action" , "/purchase/addPurchase/"+prodNo).submit();
	});
		 
		 $( "#addToCart").on("click" , function() {
			 //alert("준비중입니다ㅠㅠ");
			 var cartText=$("#cartext").text();
			 if(cartText.indexOf('담기')==-1){
			 var boxTag="<div class='text-center'><label for='cartIn' class='control-label'></label><input type='text' class='form-control' id='cartIn' placeholder='숫자 입력'></div>";
			 $("#carting").html(boxTag);
			 $("#cartext").text("카트에담기");
			 $("#cartingMsg").text("");
			 }
			 else{
				 
				 if ($("#cartIn").val()<1 || $("#cartIn").val()==""){
					 $("#cartingMsg").text("유효성체크에 걸리면 이 메시지가 뜹니다");
				}				 
				else{
					//alert($("#cartIn").val());
				///ajax를 여기서 합시다~//
				
				var prodNoJson=$("#prodNo").text().trim();
				var stockJson = $("#cartIn").val();
				var jsoned = {prodNo : prodNoJson, stock : stockJson};
				var stringified = JSON.stringify(jsoned);
				$.ajax(
				{
				type : "POST",
				url : "/purchase/json/updateCart",
				data : stringified,
				contentType: "application/json", //보내는 컨텐츠의 타입
				//dataType : "json",      //받아올 데이터의 타입 필요없음
				success : function(serverData, status) {
									//alert(status);
									//alert("server에서 온 Data : \n" + serverData);
									var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									
									$("#cartingMsg").text("제품번호"+$("#prodNo").text()+"인 제품"+$("#cartIn").val()+"개가 카트에 담겼어요");
									 $("#carting").empty();
									 $("#cartext").text("카트열기");
									
								},
				error : function(request,status,error){
							        alert("에러남 : "+error);
							       }
				}
			);
				
				
				
				///////////////////ajax//////////
					
					
					
					 
					
				 }
				 
			 }
			 
		 }
		 );

	$( "td.ct_btn01:contains('이전')" ).on("click" , function() {
	 window.history.back();
	});
	
});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<form>
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품정보조회</h3>
	       <h5 class="text-muted">상품을<strong class="text-danger">사주세요</strong>제발요</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4" id ="prodNo">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img
					src="/images/uploadFiles/${product.fileName}" style="width: auto; height:250px;"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>재고</strong></div>
			<div class="col-xs-8 col-md-4">${product.stock}</div>
		</div>
		
		<br/>
		<div class="row">
	  		<div class="text-center ">
	  			<span><button type="button" class="btn btn-primary" 
	  			style="width: 35%;" id="goToBuy">사러가기</button></span>
	  			<span><button type="button" class="btn btn-success"
	  			 style="width: 35%;" id="addToCart">
	  			 <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"id='cartext'>
	  			 카트열기</i></button></span>
	  			<span id="carting" ></span>
	  			
	  		</div>
		</div>
		
		<br/>
		
		<div class="row text-center">
		<span id ='cartingMsg'></span>
		</div>
		
 	</div>
 	</form>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>