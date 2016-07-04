<!-- 
	�ۼ��� : �ڹμ�
	�ۼ��� : 2016-06-21
	���� : ajax�� Ȱ���� �Խ��� �� �޴� �����ϱ�

 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
		
		function fnLogin() {
			window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
		}
		function fnCheck(){
			var checkLogin=	$("#checkLogin").attr("value");
			if(checkLogin =="patient"){
				location.href ="/khhospital/control?cmd=SEARCHDOC&check=RESERVE";
			}else if (checkLogin =="doctor"){
				alert("ȯ�ڸ� ��밡���մϴ�.")
			}else if(checkLogin =="manager"){
				alert("ȯ�ڸ� ��밡���մϴ�.")
			}else{
				alert("�α����� �ʿ��մϴ�.");
				window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
			}
		}
	// �Ŀ� �Ľ��ϱ� ���� �̸� ���� 
	var newsTitle ="";
	var newsNum ="";
	
	var noticeTitle ="";
	var noticeNum ="";
	
	var questionTitle ="";
	var questionNum ="";
	//ajax ȣ�� 
	$(document).ready(
		function(){
			$.post("/khhospital/foot.do","","xml").done(
					function(xml){
						var news = $(xml).find("news");
						if(news.length){
							$(news).each(
								function(){
									// �ϳ��� ��Ʈ������ �����ش� 
									newsTitle += "/"+$(this).find("title").text();
									newsNum += "/" +$(this).find("num").text();
								}		
							);
							
						}

						var notice = $(xml).find("notice");
						if(notice.length){
							$(notice).each(
								function(){
									noticeTitle += "/"+$(this).find("title").text();
									noticeNum += "/" +$(this).find("num").text();
								}		
							);
							
						}

						var question = $(xml).find("question");
						if(question.length){
							$(question).each(
								function(){
									questionTitle += "/"+$(this).find("title").text();
									questionNum += "/" +$(this).find("num").text();
								}		
							);
							
						}
						// split �ؼ� ��� ������ ��� 
						$("#news1").text(newsTitle.split("/")[1])
						$("#news2").text(newsTitle.split("/")[2])
						
						$("#noti1").text(noticeTitle.split("/")[1])
						$("#noti2").text(noticeTitle.split("/")[2])
						
						$("#ques1").text(questionTitle.split("/")[1])
						$("#ques2").text(questionTitle.split("/")[2])
						
						//split �ؼ� �۹�ȣ �޾ƿ���  
						var Noti1 = noticeNum.split("/")[1]
						var Noti2 = noticeNum.split("/")[2]
						
						var New1 = newsNum.split("/")[1]
						var New2 = newsNum.split("/")[2]
						
						var Ques1 = questionNum.split("/")[1]
						var Ques2 = questionNum.split("/")[2]

						// ��� ���� �ϱ� 
						var srcNoti1 ="/khhospital/control?cmd=MGRNOTICEBOARDREAD&isRead=true&num="+Noti1;
						var srcNoti2 ="/khhospital/control?cmd=MGRNOTICEBOARDREAD&isRead=true&num="+Noti2;
						
						var srcNew1 ="/khhospital/control?cmd=MGRINTERNALNEWSBOARDREAD&isRead=true&num="+New1;
						var srcNew2 ="/khhospital/control?cmd=MGRINTERNALNEWSBOARDREAD&isRead=true&num="+New2;
						
						var srcQues1  ="/khhospital/control?cmd=QBOARDREAD&isRead=true&num="+Ques1;
						var srcQues2 ="/khhospital/control?cmd=QBOARDREAD&isRead=true&num="+Ques2;
						
						// �Ӽ� �ٲ��ֱ� 
						$("#news1").attr("href",srcNew1);
						$("#news2").attr("href",srcNew2);
						
						$("#noti1").attr("href",srcNoti1);
						$("#noti2").attr("href",srcNoti2);
						
						$("#ques1").attr("href",srcQues1);
						$("#ques2").attr("href",srcQues2);
					}
			);
		}		
	);
	
</script>
</head>
<style>

#sitemap, #sitemap>.caret {
	color: #fff;
}

#sitemap:hover {
	color: #8be4ce;
}

#sitemap>.caret{
	margin-top: 8px;
	margin-left: 3px;
	border-top: 4px solid #fff;
}
</style>
<body>

<!-- ���޴� & footer -->
	<div style="background-color: #f7f7f9">
		<div class="container" style="padding-top: 20px">
				<div class="row">
				<div class="span4" style="margin-left: 30px">
					<a href="/khhospital/control?cmd=STEP1"><img src="/khhospital/design/images/sangdam.jpg" /></a>
				</div>
				<div class="span4">
					<a href="javascript:fnCheck()"><img src="/khhospital/design/images/jinryo.jpg" /></a>
				</div>
				<div class="span4">
					<a href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0"><img src="/khhospital/design/images/jilmun.jpg" /></a>
				</div>
			</div>
		</div>

		<!-- �Խ��� -->
		<div class="container">
			<div class="row">
				<div class="span12"
					style="height: 250px; background-color: #fff; margin-top: 20px; padding-top: 30px;">
					<div class="span4" style="margin-left: 50px; margin-top: 20px">
						<font
							style="font-size: 25px; font-weight: bold; font-color: #595959">��������</font>
						<a href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0"> <img src="/khhospital/design/images/plus.png"
							style="width: 22px; height: 22px; margin-left: 170px" />
						</a>
						<ul style="margin-top: 30px; font-size: 18px">
							<li style="margin-bottom: 20px"><a id="noti1" href="">��������1</a></li>
							<li><a id="noti2" href="">��������2</a></li>
						</ul>
						<img src="/khhospital/design/images/notice.jpg"
							style="margin-left: 180px">
					</div>
					<div class="span4" style="margin-top: 20px">
						<font
							style="font-size: 25px; font-weight: bold; font-color: #595959">�����ҽ�</font> 
							<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0"> <img src="/khhospital/design/images/plus.png"
							style="width: 22px; height: 22px; margin-left: 170px" />
						</a>
						<ul style="margin-top: 30px; font-size: 18px">
							<li style="margin-bottom: 20px"><a id="news1" href="">���ô���1</a></li>
							<li><a id="news2" href="">���ô���2</a></li>
						</ul>
						<img src="/khhospital/design/images/news.jpg"
							style="margin-left: 180px">
					</div>
					<div class="span3" style="margin-top: 20px">
						<font
							style="font-size: 25px; font-weight: bold; font-color: #595959">�����ϱ�</font>
						<ul style="margin-top: 30px; font-size: 18px">
							<li style="margin-bottom: 20px"><a id="ques1" href="">����1</a></li>
							<li><a id="ques2" href="">����2</a></li>
						</ul>
						<img src="/khhospital/design/images/question.jpg"
							style="margin-left: 200px">
					</div>
					<div class="span1" style="margin-top: 20px">
						<a href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0"> <img src="/khhospital/design/images/plus.png"
							style="width: 22px; height: 22px; margin-left: 10px" />
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- ���м� -->
		<div class="container" style="margin-bottom: 10px">
			<div class="row">
				<div class="span12">
					<hr style="border: 3px solid #26699e" />
				</div>
			</div>
		</div>
		
		
		<!-- footer -->
		<div style="background-color: #595f6a;">	
		
			<div id="theRemote" class="collapse">
				<div class="container">			
					<div class="row">
						<div class="span12">
							<jsp:include page="site_footer.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>	
			
			
			<div class="container">			
				<div class="row">
					<div class="span10" style="margin-top:20px; margin-left: 20px; color:#d8d8d8">
						����Ư���� ���α� �Ͽ��� 11 (06351) KH���պ��� / ��ǥ��ȭ : 1577-0012 / ����ڵ�Ϲ�ȣ : 213-82-05096 �ڹμ�<br/>
						copyright 2016 - 2020 by KH Medical Center. All rights reserved.				
					</div>
					<div class="span2" style="margin-top: 20px; margin-left: 20px">
						<font id="sitemap" data-toggle="collapse" data-target="#theRemote">����Ʈ��&nbsp;&nbsp;<i class="caret"></i></font>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="span12">
						<hr style="border: 0.7px solid #515761" />
					</div>
				</div>
			</div>
			
		</div>
	</div>

</body>
</html>