<%@ page contentType="text/html; charset=euc-kr" %>

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
	<style>
	 body {
            padding-top : 50px;
        }
    </style>
    
       <!--  ///////////////////////// 데이트피커용 추가 CDN 입니다////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function(){
	
	$("#modify").on("click" , function() {
		 $("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase").submit();
	}
	);
		$(".payOption").on("click" , function() {
		var payOption = $(this).children().val();
		$("#payOption").val(payOption);
		}
		);
		
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
	
}
);

</script>
</head>



<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매정보수정</h3>
	       <h5 class="text-muted">구매정보<strong class="text-danger">수정</strong>해주세요</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
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
			<div class="col-xs-8 col-md-4"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="width:100%;
				 background:
				 url('../images/uploadFiles/${purchase.purchaseProd.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></div>
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
	  		<div class="col-xs-4 col-md-2"><strong>구매갯수</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.stock}</div>
		</div>
		<hr/>

<form>
<input type="hidden" name="tranNo" value="${purchase.tranNo}" />
<input type="hidden" name="paymentOption" id ='payOption' value="" />
		
		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자이름</strong></div>
		   <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value='${purchase.receiverName}' placeholder="이름을 입력해주세요">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자연락처</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value='${purchase.receiverPhone}' placeholder="연락처를 입력해주세요">
		    </div>
		  </div>

		 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매자 주소</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value='${purchase.divyAddr}' placeholder="주소를 입력해주세요">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>구매요청사항</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value = '${purchase.divyRequest}' placeholder="배송요청사항 입력란">
		    </div>
		  </div>
	 
 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>배송희망일자</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" value='${purchase.divyDate}' readonly>
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
	  			<button type="button" class="btn btn-primary" id ='modify'>수정하기</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>



</html>