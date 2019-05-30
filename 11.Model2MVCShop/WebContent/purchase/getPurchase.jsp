<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<style>

</style>
<title>

�������� Ȯ��

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  

  
 <script type="text/javascript">
 
 $(function() {
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#modify" ).on("click" , function() {
			 //alert("���Ⱦ�");
			 $("form").attr("method" , "GET").attr("action" , "/purchase/updatePurchase").submit();
		});
		
 });
 
</script>

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container-fluid">
	
		<div class="page-header text-info">
	       <h3>�������� Ȯ�� ������</h3>
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
			    <input type="hidden" name='tranNo' id='tranNo' value='${purchase.tranNo}'>
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      
<!-- table Start /////////////////////////////////////-->

		<div class="table-responsive">
			<table class='table table-hover'>
						
<thead>
    <tr>
     <!-- <th scope="col" class="success">#</th> -->
     
      <th scope="col" class="active">�̹���</th>
      <th scope="col" class="warning">��ǰ��</th>
      <th scope="col" >����</th>
      <th scope="col" class="info">����</th>
      <c:if test="${user.role eq 'user' }">
      <th scope="col" class="info">�����ۼ�</th>
      </c:if>
      
    </tr>
  </thead>
  <tbody>
<!-- 				
<tr class="active">ȸ��</tr>
<tr class="success">�ʷ�</tr>
<tr class="warning">��Ȳ���</tr>
<tr class="danger">����</tr>
<tr class="info">�Ķ�</tr>
 -->
	
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${purchaseList}">
			<c:set var="i" value="${ i+1 }" />
		

<!-- On cells (`td` or `th`) -->

<tr class='productCount' id='${product.prodNo}'>
  <!-- <td class="success col-md-1">${i}</td> -->
  <td class="active col-xs-2 col-sm-2 col-md-2"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="height: 100px;
				 background:
				 url('../images/uploadFiles/${product.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></td>
  <td class="warning col-xs-2 col-sm-2 col-md-2">${product.prodName}</td>
  <td class="col-xs-2 col-sm-2 col-md-2"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i> ${product.price}</td>
  <td class="info col-xs-2 col-sm-2 col-md-2">${product.stock} ��</td>
  <c:if test="${user.role eq 'user' }">
  <td class="info col-xs-1 col-sm-1 col-md-1"><button type="button" class="btn btn-success" id='review'>���侲������</button></td>
  </c:if>
</tr>

    
          </c:forEach>
   
          </tbody>
          </table>
         
   </div>

	  <!--  table End /////////////////////////////////////-->
		<div class="row">

	  		<div class="col-xs-4 col-md-2"><strong>�ŷ���ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.tranNo}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
<c:if test="${purchase.paymentOption eq '1  ' }">
���ݱ���
</c:if>
<c:if test="${purchase.paymentOption eq '2  ' }">
�ſ뱸��
</c:if>
</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>

		<hr/>
<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		<hr/>
<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		<hr/>

<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		<hr/>

		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id='modify'>�����ϱ�</button>
	  		</div>
		</div>
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>