<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<style>

</style>
<title>

카트를 보러 왔다

</title>

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
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
 <script type="text/javascript">
 
  $(function(){
	  
	  //휴지통 클릭시
	  
	  $(".removeCart").on('click', function(){
		  var count = $(".removeCart").index(this);
		  var originalCartJson = "";
		  var userIdJson = $("#userId").val();
		  
		  var productsJson = $($(".prodNo")[count]).val()+"a"+$($(".stock")[count]).val()+"n";
		  $(".productCount").each( function() {
			 originalCartJson += $($(".prodNo")[$(".productCount").index(this)]).val()+"a";
			 originalCartJson += $($(".stock")[$(".productCount").index(this)]).val()+"n"; 
		  });
		  
	
		  
			var jsoned = { userId : userIdJson , productNames : productsJson , fullCart : originalCartJson };
		
			var stringified = JSON.stringify(jsoned);
		
			  $.ajax(
						{
						type : "POST",
						url : "/purchase/json/removeCart",
						data : stringified,
						contentType: "application/json", //보내는 컨텐츠의 타입
						
						success : function(serverData, status) {
											
										
											var JSONData = JSON.stringify(serverData);	
											
											
											 $($(".productCount")[count]).remove();
											 
											 if ($(".productCount").length==0){
												  var emptyTag="<br/><div class='text-center'><h1><i class='glyphicon glyphicon-shopping-cart'></i>가 텅텅비었습니다.</h1></div>";
												  $(".table-responsive").html(emptyTag);
												  $("#allButtons").remove();
											  }
											
										},
						error : function(request,status,error){
									        alert("에러남 : "+error+"상태:"+status+"에러그자체:"+error);
									       }
						}
					);
		 
  		});
	
	
	  //전체체크 클릭시
	  $("#checkAll").on('click', function(){
		  $("[type='checkbox']").prop('checked',true);
	  });
	  
	//체크해제 클릭시  
	$("#checkNone").on('click', function(){		  
		  $("[type='checkbox']").prop('checked',false);
	  });
	  
	  //장바구니 수량감소 버튼액션
	  $(".minus").on('click', function(){
		  var count = $(".minus").index(this);	  
		  var stocked = $($(".stock")[count]).val();
		  //alert(stock);
		  var prodNoJson = $($("[type='checkbox']")[count]).val();
		  stocked = parseInt(stocked);
			 var change = stocked-1;
			 if(change==0){
				 alert("카트에 1개 미만은 담을 수 없습니다.");
			 }
			 else{
				var stockJson=change;
				var jsoned = {prodNo : prodNoJson, stock : stockJson};
				var stringified = JSON.stringify(jsoned);
				$.ajax(
				{
				type : "POST",
				url : "/purchase/json/updateCartStock",
				data : stringified,
				contentType: "application/json", //보내는 컨텐츠의 타입
				//dataType : "json",      //받아올 데이터의 타입 필요없음
				success : function(serverData, status) {
									//alert(status);
									//alert("server에서 온 Data : \n" + serverData);
									//var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									$($(".stock")[count]).val(change);
									//$("#cartingMsg").text("제품번호"+$("#prodNo").text()+"인 제품"+$("#cartIn").val()+"개가 카트에 담겼어요");
									 //$("#carting").empty();
									// $("#cartext").text("카트열기");
									
								},
				error : function(request,status,error){
							        alert("에러남 : "+error);
							       }
				}
			);
			 
			 //alert($($(".stock")[count]).val());
			// alert(prodNoJson);

			 }
	  }
	  );
	  
	  //장바구니 수량 증가 액션
	  $(".plus").on('click', function(){
		  var count = $(".plus").index(this)	
		  var stocked = $($(".stock")[count]).val();
		  var prodNoJson = $($("[type='checkbox']")[count]).val();
		  //alert(stock);
		  stocked = parseInt(stocked);
		 var change =  stocked+1;
		// alert(change);
		var stockJson=change;
		var jsoned = {prodNo : prodNoJson, stock : stockJson};
				var stringified = JSON.stringify(jsoned);
				$.ajax(
				{
				type : "POST",
				url : "/purchase/json/updateCartStock",
				data : stringified,
				contentType: "application/json", //보내는 컨텐츠의 타입
				//dataType : "json",      //받아올 데이터의 타입 필요없음
				success : function(serverData, status) {
									//alert(status);
									//alert("server에서 온 Data : \n" + serverData);
									//var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									$($(".stock")[count]).val(change);
									//$("#cartingMsg").text("제품번호"+$("#prodNo").text()+"인 제품"+$("#cartIn").val()+"개가 카트에 담겼어요");
									// $("#carting").empty();
									 //$("#cartext").text("카트열기");
									
								},
				error : function(request,status,error){
							        alert("에러남 : "+error);
							       }
				}
			);
		 
		 //alert(prodNoJson);
		// alert($($(".stock")[count]).val());
	  }
	  );
	$("#goToBuy").on('click', function(){
		//alert("눌렀어");	
		var products = "";
				$("[type='checkbox']:checked").each(function() { 
					var count = $("[type='checkbox']").index(this);
					var prodNo = $(this).val();
					products += prodNo;
					products += "a";
					products += $($(".stock")[count]).val();
					products += "n";					
					//alert(products);	
					$("#products").val(products);
				}	
			);
				
				$("form").attr("method" , "POST").attr("action" , "/purchase/purchaseAll").submit();
		}	
	);
	
	$("#multiDelete").on('click', function(){
		//var howMany = 0;
		$("[type='checkbox']:checked").each(function() { 
			var count = $("[type='checkbox']").index($("[type='checkbox']:checked")[0]);
			//alert(count);
			//count += howMany;
			$($(".removeCart")[count]).trigger('click');
			//howMany += 1;
			//alert(howMany);
		});
		//alert(howMany);
		/*
		alert($("#userId").val());
		var products = "";
		$("[type='checkbox']:checked").each(function() { 
			var count = $("[type='checkbox']").index(this);
			var prodNo = $(this).val();
			products += prodNo;
			products += "a";
			products += $($(".stock")[count]).val();
			products += "n";					
			alert(products);	
			$("#products").val(products);
		}	
	);
		*/
			
	});

});
</script>

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container-fluid">
	
		<div class="page-header text-info">
	       <h3>장바구니입니다~</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    <input type="hidden" name='products' id='products' value=''>
			    <input type="hidden" name='userId' id='userId' value='${user.userId}'>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!-- 리스트에 든게 없으면 카트가 비었다고 메시지 출력 /////////////////////////////////////-->
   	<c:if test="${empty cartList}">
   	<br/>
   	<div class="text-center">
	<h1><i class='glyphicon glyphicon-shopping-cart'></i>가 텅텅비었습니다.</h1>
	</div>
		</c:if>
      
<!-- 리스트에 든게 있으면  table Start /////////////////////////////////////-->
	<c:if test="${!empty cartList}">
		<div class="table-responsive">
			<table class='table table-hover'>
						
<thead>
    <tr>
     <!-- <th scope="col" class="success">#</th> -->
     <th scope="col" class="success">체크박스</th>
      <th scope="col" class="active">이미지</th>
      <th scope="col" class="warning">제품명</th>
      <th scope="col" >가격</th>
      <th scope="col" class="info">갯수</th>
      <th scope="col" class='danger'>삭제</th>
    </tr>
  </thead>
  <tbody>
<!-- 				
<tr class="active">회색</tr>
<tr class="success">초록</tr>
<tr class="warning">주황노랑</tr>
<tr class="danger">빨강</tr>
<tr class="info">파랑</tr>
 -->
	
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${cartList}">
			<c:set var="i" value="${ i+1 }" />
		

<!-- On cells (`td` or `th`) -->

<tr class='productCount' id='${product.prodNo}'>
  <!-- <td class="success col-md-1">${i}</td> -->
  <td class="success col-sm-1 col-md-1"><input type="checkbox" class='prodNo' value="${product.prodNo}"></td>
  <td class="active col-sm-3 col-md-3"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="height: 100px;
				 background:
				 url('../images/uploadFiles/${product.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></td>
  <td class="warning col-md-2">${product.prodName}</td>
  <td class="col-xs-2 col-sm-2 col-md-2"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i> ${product.price}</td>
  <td class="info col-xs-2 col-sm-2 col-md-2"> 
  <div class="input-group">
      	<span class="input-group-btn">
	        <button class="btn btn-default minus" type="button" style="height: 100%;" name='minus'>
	        <i class=' glyphicon glyphicon-minus-sign'></i>
	        </button>
      	</span>
      <input type="text" class="form-control stock" value='${product.stock}' placeholder="갯수를 입력해주세요" style="width: 100%;" readonly>
		<span class="input-group-btn">
	        <button class="btn btn-default plus" type="button" style="height: 100%;"name ='plus'>
	        <i class=' glyphicon glyphicon-plus-sign'></i>
	        </button>
      	</span>
    </div>
    </td>
  <td class="danger col-md-1"><button type="button" class="btn btn-danger removeCart" style='width:100%;height:100px;'><i class='glyphicon glyphicon-trash'></i></button></td>
</tr>

    
          </c:forEach>
   
          </tbody>
          </table>
         
   </div>
 </c:if>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	<br/>
 	<c:if test="${!empty cartList}">
 	<div id='allButtons'>
 	 &nbsp; <button type="button" class="btn btn-success" id='checkAll'><i class='glyphicon glyphicon-ok-circle'></i>전체선택</button>
 	 <button type="button" class="btn btn-danger"  id='checkNone'><i class='glyphicon glyphicon-remove-circle'></i>전체해제</button>
 	<br/>
 	  <div class="row text-center"><button type="button" class="btn btn-primary btn-lg" style="width: 30%" id='goToBuy'>선택한 거 살게</button>
 	  &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning btn-lg" style="width: 20%" id='multiDelete'>선택한 거 삭제</button></div>
	</div>
	</c:if>
</body>
</html>