<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
	  body {
            padding-top : 50px;
        }
    </style>
<!-- ToolBar Start /////////////////////////////////////-->

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/index.jsp"><i class="glyphicon glyphicon-gift">${user.userId}</i></a>
    </div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div class="collapse navbar-collapse"  id="target">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	             
	               <!-- ��� ����޴� DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >������ ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	<li><a href="#">ȸ��������ȸ</a></li>
		                     	<li class="divider"></li>
		                        <li><a href="#">�űԻ�ǰ���</a></li>
		                        <li><a href="#">��ǰ�����޴�</a></li>
		                        <li class="divider"></li>		                        
	                         	<li><a href="#">�ŷ�����</a></li>
		                        <li><a href="#">ETC</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	             
	             
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                        
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	            
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">�� ǰ �� ��</a></li>    
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">�����̷���ȸ</a></li>
	                           <li><a href="#">��ٱ���</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 
	                 <li><a href="#">etc...</a></li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�α׾ƿ�</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>

</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		//============= ȸ��������ȸ Event  ó�� =============			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		//=============  ����������ȸȸ Event  ó�� =============	
		 	$( "a:contains('����������ȸ')" ).on("click" , function() {
		 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		
		 	$( "a:contains('�űԻ�ǰ���')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/addProductView.jsp");
		 	});
		 	$( "a:contains('��ǰ�����޴�')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/listProductManager");
		 	});
		 	$( "a:contains('�ŷ�����')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/listSalePurchase");
		 	});
		 	$( "a:contains('�� ǰ �� ��')" ).on("click" , function() {
		 		$(self.location).attr("href","/product/listProduct");
		 	});
		 	$( "a:contains('�����̷���ȸ')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/listPurchase");
		 	});
		 	$( "a:contains('��ٱ���')" ).on("click" , function() {
		 		$(self.location).attr("href","/purchase/getCart"); 	 		
		 	});
		 	
		 	$( "a:contains('�ֱ�')" ).on("click" , function() {
		 		alert("�׷��� �� �ñ��Ͻ���");
		 	});
		 	
		 	$( "a:contains('etc...')" ).on("click" , function() {
		 		
		 	});
		 	
		 	
		
		 });	
	</script> 