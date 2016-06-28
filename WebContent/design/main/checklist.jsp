<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>�ǰ�üũ����Ʈ</title>
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
								alert("��� �׸� üũ�� ���ּ���!");
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
               <td>1. �׻� ���� ���̰� �ǰ��ϴ� </td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check1" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check1" value="c3">�׷����ʴ�</label>     
               </td>
            </tr>
            <tr>
               <td>2. �޽��� ���ص� �Ƿΰ� Ǯ�����ʴ´�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check2" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check2" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>3. ���Ⱑ ��ưų� ����� �ٽ� ���Ⱑ ��ƴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check3" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check3" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>4. ������ �Ҿ��ϰų� �Ű������϶��� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check4" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check4" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check4" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>5. ���� ���� �����ų� ���� �Ƿ�������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check5" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check5" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check5" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>6. ���� �𷡾��� �� ��ó�� �̹����� ��������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check6" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check6" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check6" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>7. ����� �Ʒ����� ������ �����ִ����̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check7" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check7" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check7" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>8. ��ȭ�� ���� �ȵǰ� ���� �����ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check8" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check8" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check8" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>9. ���� Ȥ�� �������� ���� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check9" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check9" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check9" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>10. �Ϳ︲ Ȥ�� �̸������� �ִ� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check10" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check10" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check10" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>11. ����� �� �财���� �̻��� �ִ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check11" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check11" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check11" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>12. ���� ���� ���ų� ȣ���� ����Ҷ��� �ִ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check12" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check12" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check12" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>13. ��ġ���� �Ҷ� �걸������ ���ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check13" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check13" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check13" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>14. ��ġ���� �Ҷ� �ո����� �ǰ� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check14" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check14" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check14" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>15. ��ġ���� ���ص� ���밡 ���ϰ� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check15" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check15" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check15" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>16. ���� �� �� �ڸ� ��� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check16" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check16" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check16" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>17. ���� �� �� �̸� ���� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check17" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check17" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check17" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>18. �Ǻΰ� ���� ���ư� �ε巯�Ⱑ ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check18" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check18" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check18" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>19. ����� ������ �ص� �Ǻΰ� �����ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check19" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check19" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check19" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>20. �ܺ�ȯ�濡 ���� �Ǻο� ���� �ڱ��� ������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check20" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check20" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check20" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
         </table>
         		<div id="btnDiv">
            			<input type="button" class="btn btn-large btn-warning" value="��� Ȯ���ϱ�"/>
            	</div>
         	         
      </form>
   </div>
</div>

	<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>