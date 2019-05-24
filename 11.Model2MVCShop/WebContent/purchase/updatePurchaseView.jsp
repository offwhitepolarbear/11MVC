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
	
		<div class="page-header">
	       <h3 class=" text-info">������������</h3>
	       <h5 class="text-muted">��������<strong class="text-danger">����</strong>���ּ���</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="width:100%;
				 background:
				 url('../images/uploadFiles/${purchase.purchaseProd.fileName}'), 
				 url('../images/uploadFiles/noimg.JPG');
				  no-repeat center center; background-size:cover;"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.price}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ű���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.stock}</div>
		</div>
		<hr/>

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