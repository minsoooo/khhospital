<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Regi.html</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/khhospital/js/check_text.js"></script>
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<style>
.table{width:750px}
th{background-color: #C4DEFF; width:150px}

#submenu>li>a {
	margin-top:20px;
	color: #347fd0;
	font-size: 17px;
	font-weight: bold;
}

#submenu> .active >a {
	margin-top:20px;
	color: #595959;
}

.table th {
	text-align: center;
}

</style>

<script>
	$(document).ready(
		function(){
			$("#btn").click(
				function(){
					if($("#pass").attr("value") == $("#pass1").val() && $("#check").attr("value") == "true"){
						alert("수정하시겠습니까?");
						$("#form1").submit();
					}
					else if($("#check").attr("value") == "false"){
						alert("비밀번호 형식을 맞춰주세요!");
					}
					else{
						alert("현재 비밀번호를 다시 입력해 주세요!");						
					}
				}		
			);	
			
			$("#pass2").keyup(
					function(){
						var flag = Event.checkText($("input[name='pass2']").val());
						
						if(!flag){
							$("#check_pass2").text("비밀번호 형식을 맞춰 주세요!").css("color", "red");	
							$("#check").attr("value", "false");
						}				
						else if(flag){
							$("#check_pass2").text("사용 가능한 비밀번호입니다.").css("color", "#4197e0");
							$("#check").attr("value", "true");
						}
					}		
			);
			
			var phone = "#"+$("#p1").attr("value").trim();
			$(phone).attr("selected","selected");
			
			var question = $("#q").attr("value").trim();
			
			for(var i = 0; i < 5; i++){
				var id = "#"+i;
				if($(id).text() == question){
					 $(id).attr("selected","selected");
				 }
			} 
		}
	);
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top:50px; margin-bottom:50px">
		<div class="row">
			<div class="span12">	
				<div class="tabbable tabs-left" >
					<ul class="nav nav-tabs" id="submenu" style="margin-top:100px">
						<li class="active"><a href="#">내정보수정</a></li>
						<li><a href="/khhospital/control?cmd=MYRESERVE">진료예약조회</a></li>
						<li><a href="/khhospital/control?cmd=REGIDELETE">회원 탈퇴</a></li>
					</ul>
		
					<div class="tab-content">	
						<form class="form-search" method="post" action="/khhospital/control?cmd=REGIUPDATEPROC" id ="form1" style="margin-left:70px">
									<input type="hidden" id="pass" value="${patient.pat_pass}" />
									<input type="hidden" id="p1" value="${patient.pat_phone1}" />
									<input type="hidden" id="q" value="${patient.pat_question}" />
									<input type="hidden" id="check" value="" />
									<table class="table table-bordered">
										<tr><h1 style="margin-left:260px">내 정보 수정</h1></tr>
										<tr>
											<th>성명</th>
											<td><input type="text" name="name" class="input-small" required="required" readonly="readonly" value="${patient.pat_name}"/></td>
										</tr>	
										<tr>
											<th>아이디</th>
											<td><input type="text" name="id" class="input-small" required="required" readonly="readonly" value="${patient.pat_id}"/></td>
										</tr>
										<tr>
											<th>현재 비밀번호</th>
											<td><input type="password" id="pass1" name="pass1" class="input-small" required="required" /></td>
										</tr>		
										<tr>
											<th>변경 할 비밀번호</th>
											<td><input type="password" id="pass2" name="pass2" class="input-small" required="required" />&nbsp;&nbsp;* 6~12자로 입력하세요.
												<div id="check_pass2"></div>
											</td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>
											
												<select class="span2" name="phone1">
													<option id="010" >010</option>
													<option id="011">011</option>
													<option id="016">016</option>
													<option id="017">017</option>
													<option id="018">018</option>
													<option id="019">019</option>
												</select>&nbsp;&nbsp;-&nbsp;
												<input type="text" class="input-small" required="required" name="phone2" value="${patient.pat_phone2}"/>&nbsp;&nbsp;-&nbsp;
												<input type="text" class="input-small" required="required" name="phone3" value="${patient.pat_phone3}"/>
											</td>
										</tr>		
										<tr>
											<th>이메일</th>
											<td><input type="text" name="email1" class="input-medium" required="required" value="${patient.pat_email1}"/> @ 
												<input type="text" name="email2" class="input-medium" required="required" value="${patient.pat_email2}"/>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<th>계정 찾기 질문</th>
											<td>
												<select name="question" >								
													<option id="0">졸업한 초등학교의 이름은?</option>
													<option id="1">가장 친한 친구는?</option>
													<option id="2">가장 좋아하는 과일은?</option>
													<option id="3">가장 좋아하는 색은?</option>
													<option id="4">가장 좋아하는 음식은?</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>질문의 답</th>
											<td><input type="text" name="answer" class="input-large" required="required" value="${patient.pat_answer}"/></td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호" value="${patient.pat_addr1}">
												<input type="button" value="우편번호 검색" class="btn" 	onclick="sample6_execDaumPostcode()" /><br/><br/>				
												<input type="text" id="sample6_address" name="addr2" placeholder="주소" class="input-xxlarge" value="${patient.pat_addr2}"><br/>			
												<input type="text" id="sample6_address2" name="addr3"placeholder="상세주소" class="input-xlarge"value="${patient.pat_addr3}">				
											</td>
										</tr>
									</table>
									<div style="margin-left:270px">
										<input type="button" id="btn" value="수정완료" class="btn btn-large"/>
										<input type="reset" value="다시쓰기" class="btn btn-large" />
									</div>
								</form>
							</div>
				</div>
			</div>
		</div>
	</div>
			

	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>

	<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>