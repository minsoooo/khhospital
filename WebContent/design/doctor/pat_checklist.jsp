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
					opener.parent.fnPopupClose();	// ������� ��ư�� ������ �θ�â�� �Լ�ȣ��
				}	
			);
			
			
			if($("#checklist").attr("value") != ""){
				for(var i = 1; i <=20; i++){
					var id1 = "#check" + i + "-1";		// ù��° ���� ��ư�� id
					var id2 = "#check" + i + "-2";		// �ι�° ���� ��ư�� id
					var id3 = "#check" + i + "-3";		// ����° ���� ��ư�� id
					
					var c = "#" + i;			// DB�� ����Ǿ��ִ� ���� �ϳ��� �������� ����
					
					if($(c).attr("value") == 'c1'){		
						$(id1).attr("checked", "checked");		// DB�� c1�� ����Ǿ������� ù��° ������ư ����
					}
					else if($(c).attr("value") == 'c2'){		
						$(id2).attr("checked", "checked");		// DB�� c2�� ����Ǿ������� �ι�° ������ư ����
					}
					else{		
						$(id3).attr("checked", "checked");		// DB�� c3�� ����Ǿ������� ����° ������ư ����
					}
					
				}
			}

		}	
	);
</script>
<body>
<input type="hidden" id="pat_id" value="${pat_id}" />
<input type="hidden" id="checklist" value="${checklist}" />
<!-- �ش� ȯ�ڰ� �ڰ������� ���� ���, �� ����� ���� hidden�±׿� ���� -->
<c:if test="${checklist != null}">
	<c:forEach items="${checklist}" var="c" varStatus="i"> 
		<input type="hidden" id="${i.count}" value="${c}" />	
		<!-- id�� 1,2,3,...,20 value�� c1,c2,c3�� ȯ�ڰ� ������ �� -->
	</c:forEach>
</c:if>


<img src="/khhospital/design/images/btn_sangdam_end.jpg" id="btn_sangdam_end" />

<div class="container">
   <div class="span10" id="checkdiv">
         <table class="table">
            <tr>
               <td>1. �׻� ���� ���̰� �ǰ��ϴ� </td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check1" id="check1-3" value="c3">�׷����ʴ�</label>     
               </td>
            </tr>
            <tr>
               <td>2. �޽��� ���ص� �Ƿΰ� Ǯ�����ʴ´�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check2" id="check2-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>3. ���Ⱑ ��ưų� ����� �ٽ� ���Ⱑ ��ƴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check3" id="check3-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>4. ������ �Ҿ��ϰų� �Ű������϶��� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check4" id="check4-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>5. ���� ���� �����ų� ���� �Ƿ�������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check5" id="check5-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>6. ���� �𷡾��� �� ��ó�� �̹����� ��������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check6" id="check6-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>7. ����� �Ʒ����� ������ �����ִ����̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check7" id="check7-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>8. ��ȭ�� ���� �ȵǰ� ���� �����ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check8" id="check8-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>9. ���� Ȥ�� �������� ���� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check9" id="check9-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>10. �Ϳ︲ Ȥ�� �̸������� �ִ� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check10" id="check10-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>11. ����� �� �财���� �̻��� �ִ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check11" id="check11-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>12. ���� ���� ���ų� ȣ���� ����Ҷ��� �ִ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check12" id="check12-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>13. ��ġ���� �Ҷ� �걸������ ���ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check13" id="check13-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>14. ��ġ���� �Ҷ� �ո����� �ǰ� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check14" id="check14-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>15. ��ġ���� ���ص� ���밡 ���ϰ� ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check15" id="check15-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>16. ���� �� �� �ڸ� ��� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check16" id="check16-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>17. ���� �� �� �̸� ���� ���̴�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check17" id="check17-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>18. �Ǻΰ� ���� ���ư� �ε巯�Ⱑ ����</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check18" id="check18-3" value="c3">�׷����ʴ�</label>         
               </td>
            </tr>
            <tr>
               <td>19. ����� ������ �ص� �Ǻΰ� �����ϴ�</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check19" id="check19-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
            <tr>
               <td>20. �ܺ�ȯ�濡 ���� �Ǻο� ���� �ڱ��� ������</td>
               <td>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-1" value="c1">���� �׷���</label>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-2" value="c2">����</label>
               <label class="span2" id="label"><input type="radio" name="check20" id="check20-3" value="c3">�׷����ʴ�</label>        
               </td>
            </tr>
         </table>
   </div>
</div>

</body>
</html>