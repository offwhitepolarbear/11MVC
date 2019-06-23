<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		// $( ".btn btn-primary:contains('사러가기')" ).on("click" , function() {
		$("#goToBuy").on("click", function() {
			$(self.location).attr("href", "/purchase/getCart");
		});

		$("#addToCart")
				.on(
						"click",
						function() {
							//alert("준비중입니다ㅠㅠ");
							var cartText = $("#cartext").text();
							if (cartText.indexOf('담기') == -1) {
								var boxTag = "<div class='text-center'><label for='cartIn' class='control-label'></label><input type='text' class='form-control' id='cartIn' placeholder='숫자 입력'></div>";
								$("#carting").html(boxTag);
								$("#cartext").text("카트에담기");
								$("#cartingMsg").text("");
							} else {

								if ($("#cartIn").val() < 1
										|| $("#cartIn").val() == "") {
									$("#cartingMsg").text(
											"유효성체크에 걸리면 이 메시지가 뜹니다");
								} else {
									//alert($("#cartIn").val());
									///ajax를 여기서 합시다~//

									var prodNoJson = $("#prodNo").text().trim();
									var stockJson = $("#cartIn").val();
									var jsoned = {
										prodNo : prodNoJson,
										stock : stockJson
									};
									var stringified = JSON.stringify(jsoned);
									$
											.ajax({
												type : "POST",
												url : "/purchase/json/updateCart",
												data : stringified,
												contentType : "application/json", //보내는 컨텐츠의 타입
												//dataType : "json",      //받아올 데이터의 타입 필요없음
												success : function(serverData,
														status) {
													//alert(status);
													//alert("server에서 온 Data : \n" + serverData);
													var JSONData = JSON
															.stringify(serverData);
													//alert("JSONData = \n"+	JSONData);
													//alert(serverData.stock);
													//alert(serverData.prodName);
													//alert(serverData.productNames);

													$("#cartingMsg")
															.text(
																	"제품번호"
																			+ $(
																					"#prodNo")
																					.text()
																			+ "인 제품"
																			+ $(
																					"#cartIn")
																					.val()
																			+ "개가 카트에 담겼어요");
													$("#carting").empty();
													$("#cartext").text("카트열기");

												},
												error : function(request,
														status, error) {
													alert("에러남 : " + error);
												}
											});

									///////////////////ajax//////////

								}

							}

						});

		$("td.ct_btn01:contains('이전')").on("click", function() {
			window.history.back();
		});

	});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	
		<div class="container-fluid" id='readChat' >
		<br/>
			<div class="panel panel-default"style='width: 45%;'>
				<div class="panel-body">
					<p class="text-right">Right Basic panel example</p>
				</div>
			</div>
			<div class="panel panel-default" style='width: 45%;'>
				<div class="panel-body">
					<p class="text-left">left Basic panel example</p>
				</div>
			</div>
			<div class="panel panel-default" style='width: 45%;'>
				<div class="panel-body">
					정렬안한거임
				</div>
			</div>
		
	
	
	<form>
	<div class="input-group">
  <input type="text" class="form-control" placeholder="채팅을 입력해주세요" aria-describedby="basic-addon2">
  <span class="input-group-addon" id="basic-addon2">전송</span>
</div>
	
	</form>
	
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>