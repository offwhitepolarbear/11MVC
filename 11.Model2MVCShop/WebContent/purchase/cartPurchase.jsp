<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
    
       <!--  ///////////////////////// 데이트피커용 추가 CDN 입니다////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	$(".payOption").on("click" , function() {
	var payOption = $(this).children().val();
	$("#payOption").val(payOption);
	}
	);
	

	
	$("button:contains('구입')").on("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
	}
	);
	
////////////////////////데이트 피커 부분입니다.//////////
	$( "#divyDate" ).datepicker({
	    dateFormat: 'yy/mm/dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });
////////////////////////데이트 피커 부분입니다.//////////
		
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
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
   
   <hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자ID</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		<hr/>
		<hr/>
		<hr/>
<form>
<input type="hidden" name="products" value="${products}" />
<input type="hidden" name="userId" value="${user.userId}" />
<input type="hidden" name="paymentOption" id ='payOption' value="" />
		
		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자이름</strong></div>
		   <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value='${user.userName}' placeholder="이름을 입력해주세요">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자연락처</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value='${user.phone}' placeholder="연락처를 입력해주세요">
		    </div>
		  </div>

		 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자 주소</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value='${user.addr}' placeholder="주소를 입력해주세요">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매요청사항</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="배송요청사항 입력란">
		    </div>
		  </div>
	 
 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>배송희망일자</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" readonly>
		    </div>
		  </div>

 		<div class="row">
		    		<div class="col-xs-5 col-md-4"><strong>결제방법</strong></div>
		    		<div class="col-xs-8 col-md-8">
		      			<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-info payOption">
							 <input type="radio" value='1'>현금구매
							</label>
							<label class="btn btn-info payOption" >
								<input type="radio"value='2'>신용구매
							</label>
							<label class="btn btn-info payOption" >
								<input type="radio"value='3'>기타결제
							</label>
						</div>
		  		 	 </div>
		  </div>		  


</form>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구입</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>