<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

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
	 $( "#modify" ).on("click" , function() {
		 //alert("눌렸어");
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
	
   	<!-- 거래번호 담을부분 /////////////////////////////////////-->

		<form>
		<input type='hidden' name = 'tranNo' value='${purchase.tranNo}'>
		</form>		
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header text-info">
	       <h3>구매정보 확인 페이지예요</h3>
	    </div>
	
		<div class="table-responsive">
			<table class='table table-hover'>
						
<thead>
    <tr>
     <!-- <th scope="col" class="success">#</th> -->
	
      <th scope="col" class="active">이미지</th>
      <th scope="col" class="warning">제품명</th>
       <th scope="col" class="success">상세정보</th>  
      <th scope="col" >가격</th>
      <th scope="col" class="info">갯수</th>
    </tr>
  </thead>
  <tbody>
	
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${purchaseList}">
			<c:set var="i" value="${ i+1 }" />
		

<!-- On cells (`td` or `th`) -->

<tr class='productCount' id='${product.prodNo}'>
  <!-- <td class="success col-md-1">${i}</td> -->
  <td class="active col-sm-3 col-md-3"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="height: 100px;
				 background:
				 url('../images/uploadFiles/${product.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></td>
  <td class="warning col-md-2">${product.prodName}</td>
    <td class="success col-md-2">${product.prodDetail}</td>
  <td class="col-xs-2 col-sm-2 col-md-2"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i> ${product.price}</td>
  <td class="info col-xs-1 col-sm-1 col-md-1">${product.stock} 개</td>
</tr>

    
          </c:forEach>
   
          </tbody>
          </table>
         
   </div>

		<div class="row">

	  		<div class="col-xs-4 col-md-2"><strong>거래번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.tranNo}</div>
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

		<hr/>
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
	  			<button type="button" class="btn btn-primary" id='modify'>수정하기</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>