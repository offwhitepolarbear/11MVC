<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<style>

</style>
<title>

īƮ�� ���� �Դ�

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
 
  $(function(){
	  
	  //������ Ŭ����
	  
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
						contentType: "application/json", //������ �������� Ÿ��
						
						success : function(serverData, status) {
											
										
											var JSONData = JSON.stringify(serverData);	
											
											
											 $($(".productCount")[count]).remove();
											 
											 if ($(".productCount").length==0){
												  var emptyTag="<br/><div class='text-center'><h1><i class='glyphicon glyphicon-shopping-cart'></i>�� ���ֺ�����ϴ�.</h1></div>";
												  $(".table-responsive").html(emptyTag);
												  $("#allButtons").remove();
											  }
											
										},
						error : function(request,status,error){
									        alert("������ : "+error+"����:"+status+"��������ü:"+error);
									       }
						}
					);
		 
  		});
	
	
	  //��üüũ Ŭ����
	  $("#checkAll").on('click', function(){
		  $("[type='checkbox']").prop('checked',true);
	  });
	  
	//üũ���� Ŭ����  
	$("#checkNone").on('click', function(){		  
		  $("[type='checkbox']").prop('checked',false);
	  });
	  
	  //��ٱ��� �������� ��ư�׼�
	  $(".minus").on('click', function(){
		  var count = $(".minus").index(this);	  
		  var stocked = $($(".stock")[count]).val();
		  //alert(stock);
		  var prodNoJson = $($("[type='checkbox']")[count]).val();
		  stocked = parseInt(stocked);
			 var change = stocked-1;
			 if(change==0){
				 alert("īƮ�� 1�� �̸��� ���� �� �����ϴ�.");
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
				contentType: "application/json", //������ �������� Ÿ��
				//dataType : "json",      //�޾ƿ� �������� Ÿ�� �ʿ����
				success : function(serverData, status) {
									//alert(status);
									//alert("server���� �� Data : \n" + serverData);
									//var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									$($(".stock")[count]).val(change);
									//$("#cartingMsg").text("��ǰ��ȣ"+$("#prodNo").text()+"�� ��ǰ"+$("#cartIn").val()+"���� īƮ�� �����");
									 //$("#carting").empty();
									// $("#cartext").text("īƮ����");
									
								},
				error : function(request,status,error){
							        alert("������ : "+error);
							       }
				}
			);
			 
			 //alert($($(".stock")[count]).val());
			// alert(prodNoJson);

			 }
	  }
	  );
	  
	  //��ٱ��� ���� ���� �׼�
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
				contentType: "application/json", //������ �������� Ÿ��
				//dataType : "json",      //�޾ƿ� �������� Ÿ�� �ʿ����
				success : function(serverData, status) {
									//alert(status);
									//alert("server���� �� Data : \n" + serverData);
									//var JSONData = JSON.stringify(serverData);	
									//alert("JSONData = \n"+	JSONData);
									//alert(serverData.stock);
									//alert(serverData.prodName);
									//alert(serverData.productNames);
									$($(".stock")[count]).val(change);
									//$("#cartingMsg").text("��ǰ��ȣ"+$("#prodNo").text()+"�� ��ǰ"+$("#cartIn").val()+"���� īƮ�� �����");
									// $("#carting").empty();
									 //$("#cartext").text("īƮ����");
									
								},
				error : function(request,status,error){
							        alert("������ : "+error);
							       }
				}
			);
		 
		 //alert(prodNoJson);
		// alert($($(".stock")[count]).val());
	  }
	  );
	$("#goToBuy").on('click', function(){
		//alert("������");	
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container-fluid">
	
		<div class="page-header text-info">
	       <h3>��ٱ����Դϴ�~</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
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
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!-- ����Ʈ�� ��� ������ īƮ�� ����ٰ� �޽��� ��� /////////////////////////////////////-->
   	<c:if test="${empty cartList}">
   	<br/>
   	<div class="text-center">
	<h1><i class='glyphicon glyphicon-shopping-cart'></i>�� ���ֺ�����ϴ�.</h1>
	</div>
		</c:if>
      
<!-- ����Ʈ�� ��� ������  table Start /////////////////////////////////////-->
	<c:if test="${!empty cartList}">
		<div class="table-responsive">
			<table class='table table-hover'>
						
<thead>
    <tr>
     <!-- <th scope="col" class="success">#</th> -->
     <th scope="col" class="success">üũ�ڽ�</th>
      <th scope="col" class="active">�̹���</th>
      <th scope="col" class="warning">��ǰ��</th>
      <th scope="col" >����</th>
      <th scope="col" class="info">����</th>
      <th scope="col" class='danger'>����</th>
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
      <input type="text" class="form-control stock" value='${product.stock}' placeholder="������ �Է����ּ���" style="width: 100%;" readonly>
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	<br/>
 	<c:if test="${!empty cartList}">
 	<div id='allButtons'>
 	 &nbsp; <button type="button" class="btn btn-success" id='checkAll'><i class='glyphicon glyphicon-ok-circle'></i>��ü����</button>
 	 <button type="button" class="btn btn-danger"  id='checkNone'><i class='glyphicon glyphicon-remove-circle'></i>��ü����</button>
 	<br/>
 	  <div class="row text-center"><button type="button" class="btn btn-primary btn-lg" style="width: 30%" id='goToBuy'>������ �� ���</button>
 	  &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning btn-lg" style="width: 20%" id='multiDelete'>������ �� ����</button></div>
	</div>
	</c:if>
</body>
</html>