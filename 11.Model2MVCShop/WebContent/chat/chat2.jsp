<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">


<!--  /////////////////////////  jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	
	
	$( "#button-addon2" ).on("click" , function() {
		$(self.location).attr("href","/explore/exploreList");
	});
	$( "#cafe" ).on("click" , function() {
			$(self.location).attr("href","/cafe/main");
		});
	$( "#mail" ).on("click" , function() {
		$(self.location).attr("href","/mail/main");
	});
	$( "#sns" ).on("click" , function() {
		$(self.location).attr("href","/sns/main");
	});
	$( "#shop" ).on("click" , function() {
		$(self.location).attr("href","/shopping/myCartList");
	});
});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<br/>
	<div class="input-group mb-3">
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">통합검색</button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">통합검색</a>
     <div role="separator" class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Google</a>
      <a class="dropdown-item" href="#">NAVER</a>
      <a class="dropdown-item" href="#">Daum</a>
    </div>
  </div>
  <input type="text" class="form-control form-control-lg" placeholder="검색어 입력해주세요" aria-label="Text input with dropdown button" aria-describedby="button-addon2">
 <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
  </div>
</div>
	
	<br/>
	<div class="center-block">
	<button type="button" class="btn btn-success" id="cafe">CAFE</button>
	<button type="button" class="btn btn-primary" id="mail">MAIL</button>
	<button type="button" class="btn btn-info" id="sns">SNS</button>
	<button type="button" class="btn btn-dark" id="shop">SHOP</button>
	</div>
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>