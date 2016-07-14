<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

<script>
	$(document).ready(
		function(){	
			$("#btnAddr").click(
				function(){
					sample6_execDaumPostcode();
				}
			);
			
			$("#btnAddr").hover(
				function(){
					$("#btnAddr").attr("src", "/khhospital/design/images/btn_addr2.jpg");				
				},
				function(){
					$("#btnAddr").attr("src", "/khhospital/design/images/btn_addr.jpg");				
				}
			);
			
			$("#btnInput").click(
				function(){
					var $form = $("#form1")
					$form.submit();
				}		
			);
		}
	);
</script>
<style>
#phone1 {
	width: 70px;
}

#form1 {
	margin-top: 20px;
}

td {
	padding-top: 5px;
}

#name {
	width: 300px;
}

#social1, #social2 {
	width: 136px;
}

.addr1{
	width: 175px;
}

.addr2, .addr3{
	margin-top:5px;
	width: 300px;
}
</style>

</head>
<body>
<form id="form1" class="form-search" method="post" action="/khhospital/control?cmd=REGISECOND">
	<input type ="hidden" name ="pat_num"  value ="${sessionScope.pat_num }"/>
	<a href="#"> &nbsp;※ 개인정보취급방침</a>
	<table>
		<tr>		
			<td>
				<input type="text" id="name" name ="name"placeholder="이름" required="required" />
			</td>
		</tr>
		<tr>		
			<td>
				<input type="text" id="social1" name ="social1" placeholder="주민번호" required="required" /> - 
				<input type="text" id="social2" name ="social2" required="required" />
			</td>
		</tr>
		<tr>
			<td>
				<select id="phone1" name="phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>&nbsp;-&nbsp;
				<input type="text" name="phone2" class="input-small" required="required" maxlength="4"/>&nbsp;-&nbsp;
				<input type="text" name="phone3" class="input-small" required="required" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호" class="addr1" name="addr1">
				<img src="/khhospital/design/images/btn_addr.jpg" id="btnAddr" /><br/>			
				<input type="text" id="sample6_address" placeholder="주소" class="addr2" name="addr2"><br/>
				<input type="text" id="sample6_address2" placeholder="상세주소" class="addr2" name="addr3">			
			</td>
		</tr>
		<tr>
			<td>
				<img src="/khhospital/design/images/btn_input.jpg" id="btnInput" />
			</td>
		</tr>
	</table>
</form>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>