<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	 //if(document.body.clientHeight>720)
		 if(document.body.clientWidth>=768){
			 $(".buttonNavi").hide();
		 }
	 
		 if(document.body.clientWidth<768){
			 $(".numberNavi").hide();
		 }
		 
	$(window).resize(function (){
		var recentWidth = document.body.clientWidth;
		if(recentWidth>=768){
			$(".numberNavi").show();
			$(".buttonNavi").hide();
		}
		if(recentWidth<768){
			$(".buttonNavi").show();
			$(".numberNavi").hide();
		}	
	}
	);
	 //alert(document.body.clientWidth);	
}
);
</script>
 
<div class="container text-center">
		 
		 <nav class="numberNavi">
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    
		    <!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="disabled"><a aria-label="Previous"/>
		        <span aria-hidden="true">&laquo;</span>
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li> <a href='javascript:fncPageMove(${ resultPage.beginUnitPage-1})' aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
			</c:if>
		     
		      </a>
		    </li>
		    
		    <!--  중앙  -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
					<!--  현재 page 가르킬경우 : active -->
				    <li class="active">
				    	<a href="javascript:fncPageMove('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<a href="javascript:fncPageMove('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  우측 nav==>> -->
		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="disabled"><a aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li><a href="javascript:fncPageMove('${resultPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
			</c:if>
		      
		      </a>
		    </li>
		  </ul>
		</nav>
		
</div>
 
<div class="container">
		<nav class="buttonNavi">
		  <ul class="pager">
			<c:if test="${ resultPage.currentPage<2 }">
		    <li class="previous disabled"><a><span aria-hidden="true">&larr;</span>No more</a></li>
		    </c:if>
		    <c:if test="${ 1<resultPage.currentPage }">
		    <li class="previous"><a href='javascript:fncPageMove(${resultPage.currentPage-1})'><span aria-hidden="true">&larr;</span>Previous</a></li>
		    </c:if>
		    <!-- <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>  -->
		    <c:if test="${ resultPage.currentPage <resultPage.maxPage}">
		    <li class="next"><a href='javascript:fncPageMove(${resultPage.currentPage+1})'>Next<span aria-hidden="true">&rarr;</span></a></li>
		    </c:if>
		    <c:if test="${ resultPage.currentPage == resultPage.maxPage}">
			 <li class="next disabled"><a>No more<span aria-hidden="true">&rarr;</span></a></li>
		  </c:if>
		  </ul>
		</nav>
</div>