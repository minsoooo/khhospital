<!-- 
	�ۼ��� : �ڹμ� 
	�ۼ��� :2016-06-18
	���� : �ֱ��� ajax ��û�� ���� ä�� ����
	������ : �ڹμ�
	������ : 2016-06-19
	���� :scrollTop�� �̿��� ä�� ��ũ�� �ǾƷ� ���� .
	
	������ : �ڹμ�
	������ : 2016_07_16
	���� : 1:1 ä���� ���� chatMember �޾� ���� 
	
 -->



<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
$(document).ready(	
		function(){
			// ������ 		
			    $("#msgField").css("border", "2px solid #595959").css("width","300px").css("height", "250px")
				.css("overflow","auto").css("margin-top","20px").css("background-color","#ECEBFF");
				$("#chat").css("margin-left","25px");
				$("#msg").css("margin-left","35px").css("margin-top","10px")
				$("body").css("background-color","#d8d8d8")
			// ������ �޼��� �ƾƵ� parameter �ʱ�ȭ 
			 var sendID ="";
			 var user = $("#user").attr("value");
			 var sendMSG ="���� �����ϼ̽��ϴ�.";
			// �����ڿ� ���� �̸��� �����ͼ� ID�� ����Ѵ�.
			 if($("#user").attr("value")=="doctor"){
				sendID = $("#doc_name").attr("value");
			}else{
				sendID = $("#pat_name").attr("value");
			}
				
			// �ֱ��� ��û�� ���� xml ������ �����´�.
		
			setInterval(
				function(){
					$.post("/khhospital/chat.do",{"id":sendID,"msg":sendMSG,"user":user},"xml").done(
						function(xml){
							// �ߺ��ۼ��� �����ϱ� ���� �߰��� ���� �±׸� ��� �����Ѵ�.
							$("#msgField").empty();
							var xmlData = $(xml).find("info");
							if(xmlData.length){
								$(xmlData).each(
									function(){
										var cnt =$(this).find("cnt").text();
										var id =$(this).find("id").text();
										var msg =$(this).find("msg").text();
										var user =$(this).find("user").text();
										//ȯ�ڿ� �ǻ縦 �����Ͽ� ���� ���� �ٲ��ش�.
										if(user == "doctor"){
											var content ="<p style='color:#272f66;font-weight:bold;font-size:20px'>"+id +" : " +msg+"</p>";						
										}else{
											var content ="<p style='color:#a52e36;font-weight:bold;font-size:20px'>"+id +" : " +msg+"</p>";							
										}
										//�������� �±׸� �߰��Ͽ� ä���� �����Ѵ�.
										// �±� �߰� 
											$(content).appendTo("#msgField")
									}		
								);
								
							}
							// ajax ��û�� �Ϸ��ϸ� �ٽ� parameter�� �ʱ�ȭ ���ش�.
							sendMSG =""
							//��ũ���� �׻� �Ʒ��� �����ش�.
							$("#msgField").scrollTop(3000);
						}		
					
					);
				
				},1000);
			
			// ��ũ�ѹ� �� ����� �׻� �ǾƷ��� �̵��Ѵ�.
			
			
			// ��ư�� Ŭ���ϸ� parameter�� ����
			$("#btn").click(
					function(){
						sendMSG = $("#msg").val();
						$("#msg").val("");
					}
				
			);
			
			//text�� ����Ű ġ�� �Է� �� 
			$("#msg").keydown(
				function(){
					if(window.event.keyCode==13) {
						if(window.event){ 
							event.returnValue = false;
						}else {
							e.preventDefault();
						} 

						sendMSG = $("#msg").val();
						///text field ����� 
						$("#msg").val("");
					
					}	
				}		
			);
			
		}
	);


</script>
</head>
<body>
<span id ="user" value ="${sessionScope.user}"></span>
<span id ="doc_name" value ="${sessionScope.doc_name }"></span>
<span id ="pat_name" value ="${sessionScope.pat_name }"></span>
<span id ="chat_member" value ="${sessionScope.chat_member }"></span>
<div class="container">
		<div class="row">
			<div class="span12">
				<div id ="chat">
					<div id="msgField">
					
					</div>
					<div class ="input-append">
						<input type="text" name="msg" id=msg  /> 
						<input type="button" id="btn" value="����" class ="btn add-on" style="width:50px;height:30px;margin-top:10px"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>