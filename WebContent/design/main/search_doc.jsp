<!-- 
	�ۼ��� : �ڹμ�
	�ۼ��� : 2016-06-17
	���� : �˻� ������/ jQuery�� �̿��� attr����


 -->



<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			var $form = $("#form")
			
			$("#btnSub").click(
				function(){
					$form.submit();
				}
			);
			$("select").click(
				function(){
					if($("select > option:checked").attr("value")=="��¥"){
						$("#searchText").attr("placeholder"," ��) 2016/06/1")
					}
				}		
			);

		}		
	
	);
	

</script>
</head>
<style>
	#aDiv a {font-size:18}
</style>
<body>

	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
<div class="container">
	<div class="row">
		<div class="span12">
			<center style="margin-top:150px; margin-bottom: 150px">
				<form class="form-search" method ="post" action="/khhospital/control?cmd=SEARCHRESULT" id ="form">
					<input type ="hidden" name = "check" value ="${check }"/>
				      <select class="span2" name ="keyword" >
				               <option value="�����">�����</option>
				               <option value="�ǻ��">�ǻ��</option>
				               <option value ="��¥">��¥</option>
				      </select>
				      <input type="text" style="width:300px; height:21px" name ="search" placeholder="" id ="searchText"/>
				      <button type="button" class="btn" id ="btnSub">�˻�<span class="icon-search"></span></button><br/><br/><br/>   
				   </form>
				   <div style="font-size: 15px" id ="aDiv">
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=1&check=${check}">�ܰ�&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=2&check=${check}" ><span class="icon-hand-right"></span>&nbsp;����</a><br/><br/><br/>
				   
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=5&check=${check}" >�Ȱ�&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=3&check=${check}" ><span class="icon-hand-right"></span>&nbsp;ġ��</a><br/><br/><br/>
				   
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=6&check=${check}">�Ű��&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=4&check=${check}"><span class="icon-hand-right"></span>&nbsp;�Ǻΰ�</a><br/>
				   </div>
				</center>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>


	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>