<!-- 
	 작성자 : 박민수
	 작성일 : 2016-06-12
	 설명 : 의사 등록 페이지/ 등록이미지파일 미리보기.
	 수정일 : 2016-06-17 
	 수정내용 : 등록 완료 메세지 alert창 출력;

 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Regi.html</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
		$(document).ready(
			function(){
				$("#table").css("margin-left","140px").css("border","#595959").css("vertical-align","middle");
				$("th").css("background-color","#c4deff").css("width","100px").css("font-size","16px")
				.css("text-align","center").css("font-weigth", "bold");
				$("#imgSpace").css("width","150px").css("height","140px");
			   	$("#doc_license").css("width","150px");
				$("#imgPre").css("width","150px").css("height","140px");
			   	$("#btnDiv").css("margin-left","470px");
			   	$("#title").css("margin-left","290px");
				// 사진 파일 업로드 한것 미리 보기.
				var opt = {
				        img: $('#imgPre'),
				        w: 150,
				        h: 150
				    };
				 
				$('#input_file').setPreview(opt);

			}		
		);
		
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


<div class = "container">
	<div class = "row">
		<div class ="span12">
			<jsp:include page ="/design/header/mgr_header.jsp"></jsp:include>
		</div>
	</div>
</div>
	
	<div class="container" >
		<div class="row">
			<div class ="span12">
				<form class="form-search" method="post" action="/khhospital/control?cmd=REGDOCPROC" enctype="multipart/form-data">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span9" id ="table">
									<h1 style ="color:#595959" id="title">의사 정보 등록</h1>
									<table class="table table-bordered">				
										<tr>
											<th>이름</th>
											<td><input type="text" class="input-small"
												required="required" name="doc_name" id ="doc_name"/></td>
											<td rowspan ="3" id ="imgSpace"><img id ="imgPre" src ="/khhospital/upload/default.jpg"/></td>	
										</tr>
										<tr>
											<th>의사 번호</th>
											<td><input type="text" class="input-small"
												required="required" readonly ="readonly" value ="자동으로 입력"/></td>
		
										</tr>
										<tr>
										<th>주민등록번호</th>
										<td><input type="text" class="input-small"
											required="required" name ="social1" /> -&nbsp;<input type="text"
											class="input-small" required="required" name ="social2"/></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>
												<select class="span2"  name ="phone1">
													<option>010</option>
													<option>011</option>
													<option>016</option>
													<option>017</option>
													<option>018</option>
													<option>019</option>
												</select>&nbsp;&nbsp;-&nbsp; 
												<input type="text" class="input-small" required="required"  name ="phone2"/>&nbsp;&nbsp;-&nbsp; 
												<input type="text" class="input-small" required="required"  name ="phone3" /></td>
											<td>
												<div class="filebox">
													<label for="input_file">사진등록/수정</label>
													<input type="file" id="input_file" name ="input_file"> 
												</div>
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td colspan ="2">
											<input type="text" class="input-medium"required="required" name ="email1"/> @ 
											<input type="text" class="input-medium" required="required" name ="email2" />&nbsp; 
											</td>
										</tr>
										<tr>
											<th>진료과목</th>
											<td colspan="2">
												<select name ="dept_name">
													<option value="1">외과</option>
													<option value="2">내과</option>
													<option value="3">치과</option>
													<option value="4">피부과</option>
													<option value="5">안과</option>
													<option value="6">신경과</option>
												</select>
												<input type ="text" name ="doc_part" id ="doc_part" placeholder ="세부진료"/>
												<input type ="text" name = "doc_license" id ="doc_license" placeholder ="면허번호"/>	
											</td>										
										</tr>
										<tr>
											<th>약력</th>
											<td colspan="2">
												<textarea rows="10" cols="400" style="width:98%" name ="doc_career"></textarea>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>

					<div id ="btnDiv">
					<input type="submit" value="등록하기" class="btn  btn-large" /> 
					<input type="reset" value="취소" class="btn btn-large" />
					</div>
				</form>
			</div>
		</div>
	</div>
<div class ="container">
	<div class ="row">
		<div class ="span12">
			<jsp:include page ="/design/footer/mgr_footer.jsp"/>
		</div>
	</div>
</div>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>