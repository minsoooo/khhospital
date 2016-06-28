<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/khhospital/js/check_text.js"></script>
<script src="/khhospital/js/ajax.js"></script>
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){						
			$("#checkId").click(
				function() {
					  
					  if($("#id").val() == ""){ 
						  alert("아이디를 입력하세요");
						  $("#check").attr("value", "false");
					  }
					  
					  $.get("/khhospital/design/main/check_id.jsp", {"id":$("#id").val()},
						  function(data){
						  	if($(data).find("result").text() == "true"){
							  	$("#check_result").text($(data).find("data").text()).css("color", "#4197e0");
							  	$("#check").attr("value", "true");
					  		}
					  		else{
					  			$("#check_result").text($(data).find("data").text()).css("color", "red");
					  			$("#check").attr("value", "false");
						  	}
					  	}						  
					  );
				  }				
			);
			
			$("#pass1").keyup(
				function(){
					var flag = Event.checkText($("input[name='pass1']").val());
					
					if(!flag){
						$("#check_pass1").text("비밀번호 형식을 맞춰 주세요!").css("color", "red");	
						$("#check").attr("value", "false");
					}				
					else if(flag){
						$("#check_pass1").text("사용 가능한 비밀번호입니다.").css("color", "#4197e0");
						$("#check").attr("value", "true");
					}
				}		
			);
			
			$("#pass2").blur(
				function(){
					if($("#pass1").val().length >= 6 && $("#pass1").val().length <= 12 && 
							($("#pass1").val() == $("#pass2").val())){
						$("#check_pass2").text("비밀번호가 확인되었습니다.").css("color", "#4197e0");	
						$("#check").attr("value", "true");
					}
					else if($("#pass1").val().length > 0 && ($("#pass1").val() != $("#pass2").val())){
						$("#check_pass2").text("동일한 비밀번호를 입력해 주세요!").css("color", "red");	
						$("#check").attr("value", "false");
					}
				}			
			);
		}
	);
</script>

<!-- 주소검색 -->
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
th{background-color: #C4DEFF; width:100px}
#regisubmit1{text-align:center}
</style>
</head>
<body>
<form class="form-search" method="post" action="/khhospital/control?cmd=REGIPROC" style="margin-left:40px" name="form1">
	<input type="hidden" id="check" name="check" value="" />
	<h1 style="color:#595959; margin-left:300px; margin-top:10px;">회원가입</h1>
	<table class="table table-bordered">
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" class="input-small" required="required"/></td>
		</tr>
		<tr>
			<th>아이디</th> 
			<td><input type="text" name="id" id="id" class="input-small" required="required" />			
				<input type="button" value="중복확인" class="btn" id="checkId" />&nbsp;&nbsp;  * 6~12자로 입력하세요.
				<div id="check_result"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass1" id="pass1" class="input-small" required="required" />&nbsp;&nbsp; * 6~12자로 입력하세요. 
				<div id="check_pass1"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" name="pass2" id="pass2" class="input-small" required="required" />
			<div id="check_pass2"></div>
			</td>
		</tr>
		<tr>
			<th>주민등록번호</th>
			<td><input type="text" name="social1" class="input-small" required="required" maxlength="6"/>
				-&nbsp;<input type="password" name="social2" class="input-small" required="required" maxlength="7"/>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<select class="span2" name="phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>&nbsp;&nbsp;-&nbsp;
				<input type="text" name="phone2" class="input-small" required="required" maxlength="4"/>&nbsp;&nbsp;-&nbsp;
				<input type="text" name="phone3" class="input-small" required="required" maxlength="4"/>
			</td>
		</tr>		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email1" class="input-medium" required="required" /> @ 
				<input type="text" name="email2" class="input-medium" required="required" />&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<th>계정 찾기 질문</th>
			<td>
				<select name="question">								
					<option>졸업한 초등학교의 이름은?</option>
					<option>가장 친한 친구는?</option>
					<option>가장 좋아하는 과일은?</option>
					<option>가장 좋아하는 색은?</option>
					<option>가장 좋아하는 음식은?</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>질문의 답</th>
			<td><input type="text" name="answer" class="input-large" required="required" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
				<input type="button" value="우편번호 검색" class="btn" 	onclick="sample6_execDaumPostcode()" /><br/><br/>				
				<input type="text" name="addr2" id="sample6_address" placeholder="주소" class="input-xxlarge">		
				<input type="text" name="addr3" id="sample6_address2" placeholder="상세주소" class="input-xlarge">				
			</td>
		</tr>
	</table>
	<div style="margin-left:260px">
		<input type="submit" value="가입하기" class="btn btn-large" />
		<input type="reset" value="취소" class="btn btn-large" />
	</div>
</form>

<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>