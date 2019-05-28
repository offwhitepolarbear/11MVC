<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>



	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

	
	function fncAddProduct() {
		//Form 유효성 검증
		alert();
		var name = $("#prodName").val();
		var detail = $("#prodDetail").val();
		var manuDate = $("#manudate").val();
		var price = $("#price").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		document.detailForm.action = '/product/updateProduct';
		document.detailForm.submit();
	}

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	

		$( "button:contains('고치기')" ).on("click" , function() {
			alert($("#manuDate").val());
			var name = $("#prodName").val();
			var detail = $("#prodDetail").val();
			var manuDate = $("#manuDate").val();
			var price = $("#price").val();

				if (name == null || name.length < 1) {
					alert("상품명은 반드시 입력하여야 합니다.");
					return;
				}
				if (detail == null || detail.length < 1) {
					alert("상품상세정보는 반드시 입력하여야 합니다.");
					return;
				}
				if (manuDate == null || manuDate.length < 1) {
					alert("제조일자는 반드시 입력하셔야 합니다.");
					return;
				}
				if (price == null || price.length < 1) {
					alert("가격은 반드시 입력하셔야 합니다.");
					return;
				}

		$("form").attr("method" , "POST").attr("enctype" , "multipart/form-data").attr("action" , "/product/updateProduct").submit();
			
		});
		
		$( "button:contains('입력사항초기화')" ).on("click" , function() {
			alert("1"); 
			$("form")[0].reset();
			});
		
////////////////////////데이트 피커 부분입니다.//////////
		$( "#manuDate" ).datepicker({
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

	});	
	
	
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">제품정보수정</h3>
	       <h5 class="text-muted">제품의<strong class="text-danger">정보를 수정</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">제품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">제품번호는 못고쳐요</strong>
		      </span>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" placeholder="변경제품명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail"  value="${product.prodDetail}" placeholder="변경주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate"  value="${product.manuDate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price"  value="${product.price}" placeholder="변경주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">기존사진</label>
		    <div class="col-sm-4">
		    <img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="width:100%;
				 background:
				 url('../images/uploadFiles/${product.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;">
		    </div>
		  </div>
		  		  
 <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">변경할 제품사진</label>
		    <div class="col-sm-4">
		      <input multiple="multiple" type="file" class="form-control" id="uploadFile" name="uploadFile"  value="${product.fileName}">
		    </div>
		  </div>

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >고치기</button>
		      <button type="button" class="btn btn-warning"  >입력사항초기화</button>
			 <!--  <a class="btn btn-primary btn" href="#" role="button">취소</a> -->
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>
</html>