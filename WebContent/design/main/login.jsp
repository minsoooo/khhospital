<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LogIn.html</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />


<script>	
	function fnRegiOpen(){
		window.open("/khhospital/control?cmd=REGI","","width=800,height=700,top=+100,left=+500");
	}
	function fnLogIn_id(){
		window.open("/khhospital/control?cmd=SEARCHID","","width=500,height=200,top=+400,left=+600");
	}
	function fnLogIn_password(){
		window.open("/khhospital/control?cmd=SEARCHPASS","","width=500,height=200,top=+400,left=+600");
	}
</script>
</head>
<body>
<div></div>
<center>
	<form class="form-search" method="post" action="/khhospital/control?cmd=LOGINPROC">
		<input type="hidden" name="check" value="${check}" />
		<table style="margin-top:20px">
		<tr>
			<td>
				<div class="radio" style="margin-left:30px">
					<label style="margin-right:20px"><input type="radio" name="user" value="patient" checked="checked"/>사용자</label>
					<label style="margin-right:20px"><input type="radio" name="user" value="doctor"/>의료진</label>
					<label><input type="radio" name="user" value="manager"/>관리자</label>
				</div>
			</td>
		</tr>
			<tr>
				<td>
				<input type="text" name="id" placeholder="아이디" class="input-xlarge" required="required"/><br/>
				</td>
			</tr>
			<tr>	
				<td>
				<input type="password" name="pass" placeholder="패스워드" class="input-xlarge" required="required"/>
				</td>
			</tr>
			<tr>
				<td><br/>
				<input type="submit" value="로그인" class="btn" style="width:280px;"/><br/><br/>
				</td>
			</tr>
			<tr><td align="center">	
				<a href="javascript:fnRegiOpen()">회원가입 /</a>
				<a href="javascript:fnLogIn_id()">아이디 찾기 /</a>
				<a href="javascript:fnLogIn_password()">비밀번호 찾기</a>
			</td></tr>	
		</table>		
	</form>
</center>

	<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>