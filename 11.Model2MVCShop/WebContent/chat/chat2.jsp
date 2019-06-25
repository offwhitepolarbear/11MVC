<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		// $( ".btn btn-primary:contains('�緯����')" ).on("click" , function() {
		$("#goToBuy").on("click", function() {
			$(self.location).attr("href", "/purchase/getCart");
		});

		$("#addToCart")
				.on(
						"click",
						function() {
							//alert("�غ����Դϴ٤Ф�");
							var cartText = $("#cartext").text();
							if (cartText.indexOf('���') == -1) {
								var boxTag = "<div class='text-center'><label for='cartIn' class='control-label'></label><input type='text' class='form-control' id='cartIn' placeholder='���� �Է�'></div>";
								$("#carting").html(boxTag);
								$("#cartext").text("īƮ�����");
								$("#cartingMsg").text("");
							} else {

								if ($("#cartIn").val() < 1
										|| $("#cartIn").val() == "") {
									$("#cartingMsg").text(
											"��ȿ��üũ�� �ɸ��� �� �޽����� ��ϴ�");
								} else {
									//alert($("#cartIn").val());
									///ajax�� ���⼭ �սô�~//

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
												contentType : "application/json", //������ �������� Ÿ��
												//dataType : "json",      //�޾ƿ� �������� Ÿ�� �ʿ����
												success : function(serverData,
														status) {
													//alert(status);
													//alert("server���� �� Data : \n" + serverData);
													var JSONData = JSON
															.stringify(serverData);
													//alert("JSONData = \n"+	JSONData);
													//alert(serverData.stock);
													//alert(serverData.prodName);
													//alert(serverData.productNames);

													$("#cartingMsg")
															.text(
																	"��ǰ��ȣ"
																			+ $(
																					"#prodNo")
																					.text()
																			+ "�� ��ǰ"
																			+ $(
																					"#cartIn")
																					.val()
																			+ "���� īƮ�� �����");
													$("#carting").empty();
													$("#cartext").text("īƮ����");

												},
												error : function(request,
														status, error) {
													alert("������ : " + error);
												}
											});

									///////////////////ajax//////////

								}

							}

						});

		$("td.ct_btn01:contains('����')").on("click", function() {
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
					���ľ��Ѱ���
				</div>
			</div>
		
	
	
	<form>
	<div class="input-group">
  <input type="text" class="form-control" placeholder="ä���� �Է����ּ���" aria-describedby="basic-addon2">
  <span class="input-group-addon" id="basic-addon2">����</span>
</div>
	
	</form>
	
	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>