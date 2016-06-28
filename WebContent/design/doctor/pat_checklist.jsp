<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<style>
#checkdiv{margin-left:20px; margin-top:20px}
#label{width:100px; text-align:center}
#btn_sangdam_end{
	margin-left:110px; 
	margin-top:20px;
	width:150px;
	height:60px;
}
#checkdiv td {
	vertical-align : middle;
}
</style>
<script>
	$(document).ready(
		function(){
			$("#btn_sangdam_end").click(
				function(){
					opener.parent.fnPopupClose();	// 상담종료 버튼을 누르면 부모창의 함수호출
				}	
			);
			
			
			if($("#checklist").attr("value") != ""){
				for(var i = 1; i <=20; i++){
					var id1 = "#check" + i + "-1";		// 첫번째 라디오 버튼의 id
					var id2 = "#check" + i + "-2";		// 두번째 라디오 버튼의 id
					var id3 = "#check" + i + "-3";		// 세번째 라디오 버튼의 id
					
					var c = "#" + i;			// DB에 저장되어있던 값을 하나씩 가져오는 변수
					
					if($(c).attr("value") == 'c1'){		
						$(id1).attr("checked", "checked");		// DB에 c1이 저장되어있으면 첫번째 라디오버튼 선택
					}
					else if($(c).attr("value") == 'c2'){		
						$(id2).attr("checked", "checked");		// DB에 c2이 저장되어있으면 두번째 라디오버튼 선택
					}
					else{		
						$(id3).attr("checked", "checked");		// DB에 c3이 저장되어있으면 세번째 라디오버튼 선택
					}
					
				}
			}

		}	
	);
</script>
<body>
<input type="hidden" id="pat_id" value="${pat_id}" />
<input type="hidden" id="checklist" value="${checklist}" />
<!-- 해당 환자가 자가진단을 했을 경우, 그 결과를 각각 hidden태그에 담음 -->
<c:if test="${checklist != null}">
	<c:forEach items="${checklist}" var="c" varStatus="i"> 
		<input type="hidden" id="${i.count}" value="${c}" />	
		<!-- id는 1,2,3,...,20 value는 c1,c2,c3중 환자가 선택한 값 -->
	</c:forEach>
</c:if>


<img src="/khhospital/design/images/btn_sangdam_end.jpg" id="btn_sangdam_end" />

<div class="container">
   <div class="span10" id="checkdiv">
         <table class="table">
            <tr>
               <td>1. 항상 몸이 무겁고 피곤하다 </td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-3" value="c3">그렇지않다</label>     
               </td>
            </tr>
            <tr>
               <td>2. 휴식을 취해도 피로가 풀리지않는다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>3. 잠들기가 어렵거나 깨어나서 다시 잠들기가 어렵다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>4. 마음이 불안하거나 신경질적일때가 많다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>5. 눈이 자주 아프거나 쉽게 피로해진다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>6. 눈에 모래알이 들어간 것처럼 이물감이 느껴진다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>7. 복통과 아랫배의 통증이 자주있는편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>8. 소화가 자주 안되고 속이 불편하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>9. 두통 혹은 현기증이 잦은 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>10. 귀울림 혹은 이명증상이 있는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>11. 성기능 및 배뇨현상에 이상이 있다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>12. 숨이 자주 차거나 호흡이 곤란할때가 있다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>13. 양치질을 할때 헛구역질이 심하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>14. 양치질을 할때 잇몸에서 피가 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>15. 양치질을 잘해도 구취가 심하게 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>16. 잠을 잘 때 코를 고는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>17. 잠을 잘 때 이를 가는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>18. 피부가 자주 가렵고 두드러기가 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-3" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>19. 제대로 보습을 해도 피부가 건조하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>20. 외부환경에 따라 피부에 심한 자극을 느낀다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-3" value="c3">그렇지않다</label>        
               </td>
            </tr>
         </table>
   </div>
</div>

</body>
</html>