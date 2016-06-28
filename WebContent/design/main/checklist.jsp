<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>건강체크리스트</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<style>
#checkdiv{margin-left:80px; margin-top:20px}
#btnDiv{margin-left:300px; margin-top:20px}
#label{width:100px; text-align:center}
</style>
<script>
	$(document).ready(
			function(){	
				$(".btn").click(
						function(){
							if($("input[type=radio]").filter(":checked").length != 20){
								alert("모든 항목에 체크를 해주세요!");
							}
							else{
								var result1 = $("input[value='c2']").filter(":checked").length * 3;
								var result2 = $("input[value='c3']").filter(":checked").length * 5;
								
								$("#result").attr("value", result1+result2);							
								form1.submit();								
							}
						}
				);
			}
	);
</script>
</head>
<body>
<div class="container">
   <div class="span10" id="checkdiv">
      <img src="/khhospital/design/images/checklist.jpg" style="margin-left: 90px"/><br/><br/>
      <form id="form1" method="post" action="/khhospital/control?cmd=CHECKLISTPROC">
      	<input type="hidden" name="result" id="result" value="" />
         <table class="table">
            <tr>
               <td>1. 항상 몸이 무겁고 피곤하다 </td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check1" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check1" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check1" value="c3">그렇지않다</label>     
               </td>
            </tr>
            <tr>
               <td>2. 휴식을 취해도 피로가 풀리지않는다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check2" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check2" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check2" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>3. 잠들기가 어렵거나 깨어나서 다시 잠들기가 어렵다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check3" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check3" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check3" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>4. 마음이 불안하거나 신경질적일때가 많다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check4" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check4" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check4" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>5. 눈이 자주 아프거나 쉽게 피로해진다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check5" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check5" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check5" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>6. 눈에 모래알이 들어간 것처럼 이물감이 느껴진다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check6" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check6" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check6" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>7. 복통과 아랫배의 통증이 자주있는편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check7" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check7" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check7" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>8. 소화가 자주 안되고 속이 불편하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check8" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check8" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check8" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>9. 두통 혹은 현기증이 잦은 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check9" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check9" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check9" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>10. 귀울림 혹은 이명증상이 있는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check10" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check10" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check10" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>11. 성기능 및 배뇨현상에 이상이 있다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check11" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check11" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check11" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>12. 숨이 자주 차거나 호흡이 곤란할때가 있다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check12" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check12" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check12" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>13. 양치질을 할때 헛구역질이 심하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check13" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check13" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check13" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>14. 양치질을 할때 잇몸에서 피가 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check14" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check14" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check14" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>15. 양치질을 잘해도 구취가 심하게 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check15" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check15" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check15" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>16. 잠을 잘 때 코를 고는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check16" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check16" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check16" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>17. 잠을 잘 때 이를 가는 편이다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check17" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check17" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check17" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>18. 피부가 자주 가렵고 두드러기가 난다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check18" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check18" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check18" value="c3">그렇지않다</label>         
               </td>
            </tr>
            <tr>
               <td>19. 제대로 보습을 해도 피부가 건조하다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check19" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check19" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check19" value="c3">그렇지않다</label>        
               </td>
            </tr>
            <tr>
               <td>20. 외부환경에 따라 피부에 심한 자극을 느낀다</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check20" value="c1">아주 그렇다</label>
               <label class="span2" id="label"><input type="radio" name="check20" value="c2">보통</label>
               <label class="span2" id="label"><input type="radio" name="check20" value="c3">그렇지않다</label>        
               </td>
            </tr>
         </table>
         		<div id="btnDiv">
            			<input type="button" class="btn btn-large btn-warning" value="결과 확인하기"/>
            	</div>
         	         
      </form>
   </div>
</div>

	<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>