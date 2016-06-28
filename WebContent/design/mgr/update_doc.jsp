<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>updateDoc.jsp</title>

<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
		$(document).ready(
			function(){
				$("#table").css("margin-left","17%").css("border","#595959").css("vertical-align","middle");
				$("th").css("background-color","#c4deff").css("width","100px").css("font-size","16px")
				.css("text-align","center").css("font-weigth", "bold");
				$("#imgSpace").css("width","150px").css("heigth","250px");
			   	$("#doc_license").css("width","150px");
			   	$("#imgPre").css("width","150px").css("height","140px");
			   	$("#btnDiv").css("margin-left","470px")
				var opt = {
				        img: $('#imgPre'),
				        w: 150,
				        h: 150
				    	};
				 
				$('#input_file').setPreview(opt);
				
				var pID = "#"+$("#phone1").attr("v").trim();
				$(pID).attr("selected","selected");
				
				var dID = "#"+$("#dept_name").attr("v").trim();
				$(dID).attr("selected","selected");
				
				var $form = $("#form");
				
				$("#btnUp").click(
					function(){
						$("#check").attr("value","UPDATE");
						$form.submit();
					}		
				);
				
				$("#btnDel").click(
						function(){
							$("#check").attr("value","DELETE");
							$form.submit();
						}		
					);
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
	
	<div class="container">
		<div class="row">
			<div class ="span12">
				<form class="form-search" method="post" action="/khhospital/control?cmd=UPDATEDOCPROC" enctype="multipart/form-data" id ="form">
					<input type ="hidden" id = "check" name ="check" value =""/>
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span8" id ="table">
								<div class="span4"></div>
								<h1 style ="color:#595959">의사 정보 수정</h1>
									<table class="table table-bordered">				
										<tr>
											<th>이름</th>
											<td><input type="text" class="input-small"
												required="required" name="doc_name" id ="doc_name" value ="${docInfo.doc_name}"/></td>
											<td rowspan ="3" id ="imgSpace"><img id ="imgPre" src ="/khhospital/upload/${docInfo.doc_img}"/></td>	
										</tr>
										<tr>
											<th>의사 번호</th>
											<td><input type="text" class="input-small" name ="doc_num"
												required="required" readonly ="readonly" value ="${docInfo.doc_num }"/></td>
		
										</tr>
										<tr>
										<th>주민등록번호</th>
										<td><input type="text" class="input-small"
											required="required" name ="social1" value ="${docInfo.doc_social1 }" /> -&nbsp;<input type="text"
											class="input-small" required="required" name ="social2" value ="${docInfo.doc_social2 }" /></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>
												<select class="span2"  name ="phone1" id ="phone1" v="${docInfo.doc_phone1 }">
													<option id ="010">010</option>
													<option id ="011">011</option>
													<option id ="016">016</option>
													<option id ="017">017</option>
													<option id ="018">018</option>
													<option id ="019">019</option>
												</select>&nbsp;&nbsp;-&nbsp; 
												<input type="text" class="input-small" required="required"  name ="phone2" value ="${docInfo.doc_phone2}"/>&nbsp;&nbsp;-&nbsp; 
												<input type="text" class="input-small" required="required"  name ="phone3" value ="${docInfo.doc_phone3}" />
											</td>
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
											<input type="text" class="input-medium"required="required" name ="email1" value ="${docInfo.doc_email1 }"/> @ 
											<input type="text" class="input-medium" required="required" name ="email2" value ="${docInfo.doc_email2 }" />&nbsp; 
											</td>
										</tr>
										<tr>
											<th>진료과목</th>
											<td colspan="2">
												<select name ="dept_name" id ="dept_name" v ="${docInfo.dept_no}">
													<option value="1" id ="1">외과</option>
													<option value="2" id ="2">내과</option>
													<option value="3" id ="3">치과</option>
													<option value="4" id ="4">피부과</option>
													<option value="5" id ="5">안과</option>
													<option value="6" id ="6">신경과</option>
												</select>
												<input type ="text" name ="doc_part" id ="doc_part" placeholder ="세부진료" value ="${docInfo.doc_part }"/>
												<input type ="text" name = "doc_license" id ="doc_license" placeholder ="면허번호" value ="${docInfo.doc_license }"/>	
											</td>										
										</tr>
										<tr>
											<th>약력</th>
											<td colspan="2">
												<textarea rows="10" cols="400" style="width:98%" name ="doc_career">${docInfo.doc_career }</textarea>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					<div id ="btnDiv">
					<input type="button" value="수정하기" class="btn  btn-large"  id ="btnUp"/>
					<input type ="button" value ="삭제하기" class ="btn btn-large" id ="btnDel"/>
	
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