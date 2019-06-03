<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>

��ǰ ��� ��ȸ

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
  
  <style>

    </style>
  
  <script type="text/javascript">
  
  function fncGetProduct(prodNo){
	  $(self.location).attr("href","/product/getProduct?prodNo="+prodNo);
  }
  function fncPageMove(currentPage) {
	  $("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	
	function fncOrderBy(input) {
		document.getElementById("orderBy").value = input;
		fncPageMove(1);
	}
	
	function fncListSale(input) {
		document.getElementById("listSale").value = input;
		fncPageMove(1);
	}
	
	function h3Killer(){
		$("h3").remove();
	}
	
	function cartIn(count){
		var prodNoJson = $($(".prodNo")[count]).text();
		var stockJson = $("#stockCart"+count).val();
		var jsoned = {prodNo : prodNoJson, stock : stockJson};
		//alert(JSON.stringify(Jsoned));
		//Jsoned ��ü�� JSON Object �Դϴ�~
		
		var stringified = JSON.stringify(jsoned);
		alert(stringified);
		$.ajax(
			{
			type : "POST",
			url : "/purchase/json/addCart",
			data : stringified,
			contentType: "application/json", //������ �������� Ÿ��
			//dataType : "json",      //�޾ƿ� �������� Ÿ�� �ʿ����
			success : function(serverData, status) {
								alert(status);
								alert("server���� �� Data : \n" + serverData);
								var JSONData = JSON.stringify(serverData);	
								alert("JSONData = \n"+	JSONData);
								$($( ".changeable")[count]).empty();
							},
			error : function(request,status,error){
						        alert("������ : "+error);
						       }
			}
		);
		
	}
		
	$(function() {
		
		$("button:contains('�˻�')").on("click" , function() {	
			fncPageMove(1);
			}
		);
		
		$("#searchKeyword").on("keypress" , function() {	
				if (event.which==13){
					fncPageMove(1);
				}	
			}
		);
		
		
		$(".prodNo").on("click" , function() {	
			var prodNo = $(this).text().trim();
			$(self.location).attr("href","/product/getProduct?prodNo="+prodNo);
			}
		);
		
		$(".prodName").on("click" , function() {
				var count = $(".prodName").index(this);
				var prodNo = $($(".prodNo")[count]).text().trim();
				$(self.location).attr("href","/product/getProduct?prodNo="+prodNo);
			}
		);
	
		//�Ǹ��� �� �������� ���°���� �˾� �ߴ� ���
		$("span[class^='cart'").on("click" , function() {
			var count = $("span[class^='cart'").index(this);
			//alert(count);		
			//alert (status);
			
			var target = $($( ".changeable")[count]);
			var status = target.text();
			//alert(target.html());
			if (status.indexOf('īƮ��')==-1){
				var stockTag = "<input type='text' id='stockCart"+count+"' value='' class='stockCart' style='width:100px; height:19px'  maxLength='9' ><span id = 'cartIn"+count+"'><a href='javascript:cartIn("+count+")'>īƮ�� �ֱ�</a></span>";
				
				//$(this).append(stockTag);
				target.append(stockTag)
				
			}
			else{

				//$(this).html("<span class = 'cart${a-1}'>��ٱ���</span>");
				target.empty();
				//$($( ".ct_list_pop td:nth-child(13)" )[count]).unbind("click");
			}
				
			/*
			$( ".ct_list_pop td:nth-child(13)" ).bind("click" , function() {
				$($(".cart"+count)).html();
			});
			*/
			
		}
		);
				
		$( ".ct_list_pop td:nth-child(13)" ).on("mouseenter" , function() {		
			var count = $( ".ct_list_pop td:nth-child(13)" ).index(this);		
			$("#hidden"+count+"").show();
			$("#hiddenStock"+count+"").show();
		});
		
		
		$( ".ct_list_pop td:nth-child(13)" ).on("mouseleave" , function() {
			var count = $( ".ct_list_pop td:nth-child(13)" ).index(this);		
			$("#hidden"+count+"").hide();
			$("#hiddenStock"+count+"").hide();
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
	       <h3>��ǰ �����ȸ</h3>
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
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
   
      

	
		<div class="row">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
				 <a href="javascript:fncGetProduct(${product.prodNo});" class="thumbnail">
				 <img class="img-rounded" src="../images/uploadFiles/16by9.png" 
				 style="width:100%;
				 background-image: url('/images/uploadFiles/${product.fileName}'),url('/images/uploadFiles/noimg.JPG');
				  background-repeat:no-repeat; 
				  background-position:center center; 
				  background-size:cover;">
	      			<!--  
	      			<img class="img-rounded" src="../images/uploadFiles/${product.fileName}" >
	      			-->
	    			 ${product.prodName}
	    			<br/>
	    			<i class="glyphicon glyphicon-usd" aria-hidden="true"></i> ${product.price}
	    		</a>
			
			</div>
			   
			<!-- 
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" class="prodNo">${product.prodNo}</td>
			  <td align="left" class="prodName">${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.prodDetail}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  <c:if test="${product.stock>0}">
			�Ǹ��� <span class = 'cart${i-1}'>��ٱ���<i class="glyphicon glyphicon-shopping-cart"></i></span><span class="changeable"></span>
			</c:if>
			<c:if test="${product.stock==0}">
			ǰ��
			</c:if>
			  </td>
			</tr>
 -->
    
          </c:forEach>
        
   </div>
 
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>