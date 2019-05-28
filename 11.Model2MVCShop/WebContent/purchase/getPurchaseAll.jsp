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
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    <input type="hidden" name='products' id='products' value=''>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      
<!-- table Start /////////////////////////////////////-->

		<div class="table-responsive">
			<table class='table table-hover'>
						
<thead>
    <tr>
     <!-- <th scope="col" class="success">#</th> -->
     
      <th scope="col" class="active">이미지</th>
      <th scope="col" class="warning">제품명</th>
      <th scope="col" >가격</th>
      <th scope="col" class="info">갯수</th>
      
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
		  <c:forEach var="product" items="${purchaseList}">
			<c:set var="i" value="${ i+1 }" />
		

<!-- On cells (`td` or `th`) -->

<tr class='productCount' id='${product.prodNo}'>
  <!-- <td class="success col-md-1">${i}</td> -->
  <td class="success col-sm-1 col-md-1"><input type="checkbox" value="${product.prodNo}"></td>
  <td class="active col-sm-3 col-md-3"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="height: 100px;
				 background:
				 url('../images/uploadFiles/${product.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></td>
  <td class="warning col-md-2">${product.prodName}</td>
  <td class="col-xs-2 col-sm-2 col-md-2"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i> ${product.price}</td>
  <td class="info col-xs-2 col-sm-2 col-md-2">${product.stock} 개</td>
</tr>

    
          </c:forEach>
   
          </tbody>
          </table>
         
   </div>

	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	<button type="button" class="btn btn-primary center-block btn-block" style="width: 50%" id='goToBuy'>선택한 거 살게</button>

</body>
</html>