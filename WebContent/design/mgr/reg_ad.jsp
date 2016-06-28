<!-- 
	작성자 : 박민수
	작성일 : 2016-06-21
	설명 : 메인 header 광고 이미지 슬라이드 저장용 페이지
		 jQuery를 사용하여 등록하고자 하는 이미지 미리 보여주기 

 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script>
		$(document).ready(
			function(){
				// 디자인
				$("#imgDiv").css("margin-left","35px").css("margin-top","50px")
				$("#fileDiv").css("margin-left","120px").css("margin-top","20px")
				$("#label2").css("margin-left","240px")
				$("#label3").css("margin-left","240px")
				$("#btnFile").css("margin-left","527px").css("margin-top","30px")
				$("#imgPre1").css("border","1px solid #595959").css("width","350px")
				.css("height","250px")
				
				$("#imgPre2").css("border","1px solid #595959").css("width","350px")
				.css("height","250px")
				
				$("#imgPre3").css("border","1px solid #595959").css("width","350px")
				.css("height","250px")
				// form 주소
				var $form = $("#form");
				// 사진 파일 업로드 한것 미리 보기.
				var opt1 = {
				        img: $('#imgPre1'),
				        w: 350,
				        h: 250
				    };
				var opt2 = {
				        img: $('#imgPre2'),
				        w: 350,
				        h: 250
				    };
				
				var opt3 = {
				        img: $('#imgPre3'),
				        w: 350,
				        h: 250
				    };
				 
				$('#input_file1').setPreview(opt1);
				$('#input_file2').setPreview(opt2);
				$('#input_file3').setPreview(opt3);
				
				// 버튼 클릭시 확인후 넘어가기 
				
				$("#btnFile").click(
					function(){
						if(confirm("저장하시겠습니까?")){
							$form.submit();
						}
					}		
				);
				
				//파일명 가져오기 
				var ad1 =$("#1").attr("value")
				var ad2 =$("#2").attr("value")
				var ad3 =$("#3").attr("value")
				//경로 만들기 
				var src1 = "/khhospital/upload/"+ad1;
				var src2 = "/khhospital/upload/"+ad2;
				var src3 = "/khhospital/upload/"+ad3;
				//경로 설정하기
				$("#imgPre1").attr("src",src1);
				$("#imgPre2").attr("src",src2);
				$("#imgPre3").attr("src",src3);
			}		
		);
		
		// 이미지 미리 보기 처리 스크립트 
		$.fn.setPreview = function(opt){
		    "use strict"
		    var defaultOpt = {
		        inputFile: $(this),
		        img: null,
		        w: 200,
		        h: 200
		    };
		    $.extend(defaultOpt, opt);
		 
		    var previewImage = function(){
		        if (!defaultOpt.inputFile || !defaultOpt.img) return;
		 
		        var inputFile = defaultOpt.inputFile.get(0);
		        var img       = defaultOpt.img.get(0);
		 
		        // FileReader
		        if (window.FileReader) {
		            // image 파일만
		            if (!inputFile.files[0].type.match(/image\//)) return;
		 
		            // preview
		            try {
		                var reader = new FileReader();
		                reader.onload = function(e){
		                    img.src = e.target.result;
		                    img.style.width  = defaultOpt.w+'px';
		                    img.style.height = defaultOpt.h+'px';
		                    img.style.display = '';
		                }
		                reader.readAsDataURL(inputFile.files[0]);
		            } catch (e) {
		                // exception...
		            }
		        // img.filters (MSIE)
		        } else if (img.filters) {
		            inputFile.select();
		            inputFile.blur();
		            var imgSrc = document.selection.createRange().text;
		 
		            img.style.width  = defaultOpt.w+'px';
		            img.style.height = defaultOpt.h+'px';
		            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
		            img.style.display = '';
		        // no support
		        } else {
		            // Safari5, ...
		        }
		    };
		 
		    // onchange
		    $(this).change(function(){
		        previewImage();
		    });
		};	
		
</script>
<style>
	/*FileInput css 스타일 수정하기 */
					.filebox label {
					  display: inline-block;
					  padding: .5em .75em;
					  color: #999;
					  font-size: inherit;
					  font-weight : bold;
					  line-height: normal;
					  vertical-align: middle;
					  background-color: #c4deff;
					  cursor: pointer;
					  border: 1px solid #ebebeb;
					  border-bottom-color: #e2e2e2;
					  border-radius: .25em;
					  margin-left: 20px;
					}

					.filebox input[type="file"] {  /* 파일 필드 숨기기 */
					  position: absolute;
					  width: 1px;
					  height: 1px;
					  padding: 0;
					  margin: -1px;
					  overflow: hidden;
					  clip:rect(0,0,0,0);
					  border: 0;
					}

</style>
</head>
<body>
	<c:forEach items="${adList }" var="list" varStatus="i">
		<span id ="${i.count }" value ="${list.ad_name }"/>
	</c:forEach>
	

	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/mgr_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span12" id="mainDiv">
				<form method="post" action="/khhospital/control?cmd=UPDATEAD" enctype="multipart/form-data" id ="form">
					<div id ="imgDiv">
						<img  id ="imgPre1" src =""/>
						<img  id ="imgPre2" src =""/>
						<img  id ="imgPre3" src =""/>					
					</div>
					
					
					<div class="filebox" id ="fileDiv">
						<label for="input_file1" id ="label1">광고1등록/수정</label> 
						<input type="file" id="input_file1" name="input_file1">

						<label for="input_file2" id ="label2">광고2등록/수정</label> 
						<input type="file" id="input_file2" name="input_file2">

						<label for="input_file3" id ="label3">광고3등록/수정</label> 
						<input type="file" id="input_file3" name="input_file3">
					</div>
					<input type="button" id="btnFile" value="저장하기" />
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/footer/mgr_footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>