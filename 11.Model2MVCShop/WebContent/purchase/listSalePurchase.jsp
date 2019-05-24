<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>���� �����ȸ</title>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <style>
	  body {
            padding-top : 50px;
        }
    </style>
  
  <script type="text/javascript">
  
  $(function(){
	$(".tranNo").on("click" , function() {
		var tranNo = $(this).text().trim();
		$(self.location).attr("href","/purchase/getPurchase?tranNo="+tranNo);
	}
	);
	
	$(".prodNo").on("click" , function() {
		var productNo = $(this).text().trim();
		$(self.location).attr("href","/product/updateProduct?prodNo="+productNo);	
	}
	);
	
	$(".prodName").on("click" , function() {
		var count = $(".prodName").index(this);
		$($(".prodNo")[count]).trigger('click');
	}
	);
	
  });
  
  
  
	function fncPageMove(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/purchase/listSalePurchase").submit();
	}
	
	function fncSaleFilter(status) {
	$("#listSale").val(status);
	fncPageMove(1);
	}
	
	function shipOrder(count) {
		var shipButton = "<button type='button' class='btn btn-info btn-sm btn-block'><i class='glyphicon glyphicon-send' aria-hidden='true'></i>�����</button>";
		
		var tranNoJson = $($(".tranNo")[count]).text().trim();
		var stockJson = $($(".stock")[count]).text().trim();
		var jsoned = { 	tranNo : tranNoJson ,
								tranCode : 2
								};
		var stringJSON = JSON.stringify(jsoned);
////////////////////////////////////////ajax ���뼱////////////////////////////////////////
		$.ajax( {
					url : "/purchase/json/updateTranCode",
					method : "POST" ,
					dataType : "json" ,
					data: stringJSON,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
									},
					success : function(serverData , status) {
						alert(serverData);
						$($(".tranStatus")[count]).html(shipButton);
									},
					error : function(request, status, error) {
						alert("ó���������� �����߻���");
						alert(status);
						alert(error);
									}
					
				}
			);
////////////////////////////////////////ajax ���뼱////////////////////////////////////////
	}
	
	function cancelOrder(count){
		var cancelButton = "<button type='button' class='btn btn-danger btn-sm btn-block'><i class='glyphicon glyphicon-remove-sign' aria-hidden='true'></i>�ֹ����</button>";
		var tranNoJson = $($(".tranNo")[count]).text().trim();		
		var prodNoJson = $($(".prodNo")[count]).text().trim();
		var stockJson = $($(".stock")[count]).text().trim();
		var jsoned = {	tranNo : tranNoJson ,
								stock : stockJson ,
								purchaseProd : { prodNo: prodNoJson },
								tranCode : 4
								};
		var stringJSON = JSON.stringify(jsoned);
			////////////////////////////////////////ajax ���뼱////////////////////////////////////////
		$.ajax( 
				{
					url : "/purchase/json/orderCancel",
					method : "POST" ,
					dataType : "json" ,
					data: stringJSON,
					headers : {	"Accept" : "application/json",	"Content-Type" : "application/json"},
					success : function(serverData , status) {
						alert(serverData);
						$($(".tranStatus")[count]).html(cancelButton);
						},
					error : function(request, status, error) {
						alert("ó���������� �����߻���");
						alert(status);
						alert(error);
						}
					
				}
			);
			////////////////////////////////////////ajax ���뼱////////////////////////////////////////
		
	}
  
  </script>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h2>�ŷ�����</h2>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">		    
			    <form class="form-inline" name="detailForm">
			  	<i class='glyphicon glyphicon-search' aria-hidden='true'></i>���°˻�
			  	<button type="button" class="btn btn-primary" onclick='javascript:fncSaleFilter(1);'>
				<i class ='glyphicon glyphicon-ok-sign' aria-hidden="true">
				</i>���ſϷ�</button> 
				
				<button type="button" class="btn btn-info" onclick='javascript:fncSaleFilter(2);'>
				<i class="glyphicon glyphicon-send" aria-hidden="true">
				</i>�����</button>
				
				<button type="button" class="btn btn-success" onclick='javascript:fncSaleFilter(3);'>
				<i class="glyphicon glyphicon-lock" aria-hidden="true">
				</i>��ۿϷ�</button>
				
				<button type="button" class="btn btn-danger"onclick='javascript:fncSaleFilter(4);'>
				 <i class="glyphicon glyphicon-remove-sign" aria-hidden="true">
				</i>�ֹ����</button>
			  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="listSale" name="listSale" value="${ !empty search.listSale ? search.listSale : 0}"/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
 <th align="left" >�ŷ���ȣ</th>
 <th align="left" >��ǰ��</th>
 <th align="left" >��ǰ��ȣ</th>
 <th align="left" >����</th>
 <th align="left" >���Ű���</th>
 <th align="left" >ȸ��ID</th>
 <th align="left" >����ּ�</th>
 <th align="left" >��ǰ��Ȳ</th>

          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"><span class="tranNo">${purchase.tranNo}</span></td>
			  <td align="left"><span class="prodName">${purchase.purchaseProd.prodName}</span></td>
			  <td align="left"><span class="prodNo">${purchase.purchaseProd.prodNo}</span></td>
			  <td align="left">${purchase.purchaseProd.price}</td>
			  <td align="left" class="stock">${purchase.stock}</td>
			  <td align="left">${purchase.buyer.userId}</td>
			  <td align="left">${purchase.divyAddr}</td>			  
			  <td align="left" class="tranStatus">
					<c:if test="${purchase.tranCode=='1  ' }">
						<button type="button" class="btn btn-primary btn-sm" style='width:34%;'>
						<i class ='glyphicon glyphicon-ok-sign' aria-hidden="true">
						</i>���ſϷ�</button><button
						 type="button" class="btn btn-default btn-sm" style='width:33%;' onclick='javascript:shipOrder(${i-1});'>
	  					<i class="glyphicon glyphicon-plane" aria-hidden="true">
	  					</i>����ϱ�</button><button
	  					type="button" class="btn btn-warning btn-sm" style='width:33%;' onclick='javascript:cancelOrder(${i-1});'>
	  					<i class="glyphicon glyphicon-erase" aria-hidden="true">
	  					</i>�ֹ�����ϱ�</button>
					</c:if>
					 <c:if test="${purchase.tranCode=='2  ' }">
						<button type="button" class="btn btn-info btn-sm btn-block">
						<i class="glyphicon glyphicon-send" aria-hidden="true">
						</i>�����</button>
					</c:if> 
					<c:if test="${purchase.tranCode=='3  ' }">
						<button type="button" class="btn btn-success btn-sm btn-block">
						  <i class="glyphicon glyphicon-lock" aria-hidden="true">
						  </i>��ۿϷ�</button>
					</c:if>
					<c:if test="${purchase.tranCode=='4  ' }">
						<button type="button" class="btn btn-danger btn-sm btn-block">
  					<i class="glyphicon glyphicon-remove-sign" aria-hidden="true">
  					</i>�ֹ����</button>
					</c:if>
				</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>