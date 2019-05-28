<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	// $( ".btn btn-primary:contains('�緯����')" ).on("click" , function() {
		 $( "#goToBuy" ).on("click" , function() {
			 var prodNo = $("#prodNo").text().trim();
	 $("form").attr("method" , "GET").attr("action" , "/purchase/addPurchase/"+prodNo).submit();
	});
		 
		 $( "#addToCart").on("click" , function() {
			 //alert("�غ����Դϴ٤Ф�");
			 var cartText=$("#cartext").text();
			 if(cartText.indexOf('���')==-1){
			 var boxTag="<div class='text-center'><label for='cartIn' class='control-label'></label><input type='text' class='form-control' id='cartIn' placeholder='���� �Է�'></div>";
			 $("#carting").html(boxTag);
			 $("#cartext").text("īƮ�����");
			 $("#cartingMsg").text("");
			 }
			 else{
				 
				 if ($("#cartIn").val()<1 || $("#cartIn").val()==""){
					 $("#cartingMsg").text("��ȿ��üũ�� �ɸ��� �� �޽����� ��ϴ�");
				}				 
				else{
					//alert($("#cartIn").val());
				///ajax�� ���⼭ �սô�~//
				
				var prodNoJson=$("#prodNo").text().trim();
				var stockJson = $("#cartIn").val();
				var jsoned = {prodNo : prodNoJson, stock : stockJson};
				var stringified = JSON.stringify(jsoned);
				$.ajax(
				{
				type : "POST",
				url : "/purchase/json/updateCart",
				data : stringified,
				contentType: "application/json", //������ �������� Ÿ��
				//dataType : "json",      //�޾ƿ� �������� Ÿ�� �ʿ����
				success : function(serverData, status) {
									//alert(status);
									//alert("server���� �� Data : \n" + serverData);
									var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									
									$("#cartingMsg").text("��ǰ��ȣ"+$("#prodNo").text()+"�� ��ǰ"+$("#cartIn").val()+"���� īƮ�� �����");
									 $("#carting").empty();
									 $("#cartext").text("īƮ����");
									
								},
				error : function(request,status,error){
							        alert("������ : "+error);
							       }
				}
			);
				
				
				
				///////////////////ajax//////////
					
					
					
					 
					
				 }
				 
			 }
			 
		 }
		 );

	$( "td.ct_btn01:contains('����')" ).on("click" , function() {
	 window.history.back();
	});
	
});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<form>
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ������ȸ</h3>
	       <h5 class="text-muted">��ǰ��<strong class="text-danger">���ּ���</strong>���߿�</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4" id ="prodNo">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img
					src="/images/uploadFiles/${product.fileName}" style="width: auto; height:250px;"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���</strong></div>
			<div class="col-xs-8 col-md-4">${product.stock}</div>
		</div>
		
		<br/>
		<div class="row">
	  		<div class="text-center ">
	  			<span><button type="button" class="btn btn-primary" 
	  			style="width: 35%;" id="goToBuy">�緯����</button></span>
	  			<span><button type="button" class="btn btn-success"
	  			 style="width: 35%;" id="addToCart">
	  			 <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"id='cartext'>
	  			 īƮ����</i></button></span>
	  			<span id="carting" ></span>
	  			
	  		</div>
		</div>
		
		<br/>
		
		<div class="row text-center">
		<span id ='cartingMsg'></span>
		</div>
		
 	</div>
 	</form>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>