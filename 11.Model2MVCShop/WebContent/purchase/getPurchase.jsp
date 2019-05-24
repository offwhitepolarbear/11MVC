<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>구매상세조회</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<script type="text/javascript">
$(function() {
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "td.ct_btn01:contains('수정')" ).on("click" , function() {
		 $("form").attr("method" , "GET").attr("action" , "/purchase/updatePurchase").submit();
	});
	
	 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
			$("form")[0].reset();
	});
	
});	

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">주문정보조회</h3>
	       <h5 class="text-muted">주문하신<strong class="text-danger">내역을</strong>확인해주세요</h5>
	    </div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>거래번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.tranNo}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제품번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img
					src="/images/uploadFiles/${purchase.purchaseProd.fileName}" style="width: auto; height:250px;"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodDetail}</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.price}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매 갯수</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.stock}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>결제된 금액</strong></div>
			<div class="col-xs-8 col-md-4">${totalPrice}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">
<c:if test="${purchase.paymentOption eq '1  ' }">
현금구매
</c:if>
<c:if test="${purchase.paymentOption eq '2  ' }">
신용구매
</c:if>
</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>


<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		<hr/>
<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		<hr/>

		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">수정하기</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>