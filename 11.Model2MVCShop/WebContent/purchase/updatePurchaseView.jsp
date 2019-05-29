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
    
       <!--  ///////////////////////// ����Ʈ��Ŀ�� �߰� CDN �Դϴ�////////////////////// -->
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
	    prevText: '���� ��',
	    nextText: '���� ��',
	    monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
	    monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
	    dayNames: ['��','��','ȭ','��','��','��','��'],
	    dayNamesShort: ['��','��','ȭ','��','��','��','��'],
	    dayNamesMin: ['��','��','ȭ','��','��','��','��'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '��'
	  });
	
}
);

</script>
</head>



<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
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
</tr>

    
          </c:forEach>
   
          </tbody>
          </table>
         
   </div>

	  <!--  table End /////////////////////////////////////-->

<form>
<input type="hidden" name="tranNo" value="${purchase.tranNo}" />
<input type="hidden" name="paymentOption" id ='payOption' value="" />
		
		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>�������̸�</strong></div>
		   <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value='${purchase.receiverName}' placeholder="�̸��� �Է����ּ���">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>�����ڿ���ó</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value='${purchase.receiverPhone}' placeholder="����ó�� �Է����ּ���">
		    </div>
		  </div>

		 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>������ �ּ�</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value='${purchase.divyAddr}' placeholder="�ּҸ� �Է����ּ���">
		    </div>
		  </div>

		  <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>���ſ�û����</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value = '${purchase.divyRequest}' placeholder="��ۿ�û���� �Է¶�">
		    </div>
		  </div>
	 
 <div class="row">
		    <div class="col-xs-5 col-md-4"><strong>����������</strong></div>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" value='${purchase.divyDate}' readonly>
		    </div>
		  </div>

 		<div class="row">
		    		<div class="col-xs-5 col-md-4"><strong>�������</strong></div>
		    		<div class="col-xs-8 col-md-8">
		      			<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-info payOption">
							 <input type="radio" value='1'>���ݱ���
							</label>
							<label class="btn btn-info payOption" >
								<input type="radio"value='2'>�ſ뱸��
							</label>
							<label class="btn btn-info payOption" >
								<input type="radio"value='3'>��Ÿ����
							</label>
						</div>
		  		 	 </div>
		  </div>		  


</form>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id ='modify'>�����ϱ�</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>



</html>