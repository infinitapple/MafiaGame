<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
	<%
		// 인코딩 처리
	//	request.setCharacterEncoding("euc-kr"); 
	%>
	<title>로그인 화면</title>

	<style type="text/css">
		table{
			padding: 60px 0px;
			margin-left:auto; 
			margin-right:auto;
			border:3px solid silver;
		}
		
		td{
			border:1px solid silver;
			text-align:center;
		}
		
		#title{
			background-color:silver
		}
	</style>

	<script type="text/javascript">

		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.password.focus();
				return false;
			}
		}
	
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="MainForm.do";
		}
	</script>

</head>
<body>
	<div id="wrap">
	
		<br><br>
		<b><font size="6" color="gray">Login</font></b>
		<br><br><br>
	
		<form name="loginInfo" method="post" action="MemberLoginAction.do" 
				onsubmit="return checkValue()">

			<table>
				<tr>
					<td bgcolor="silver" style="text-align:center;color:white">ID</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="silver" style="color:white">PassWord</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>
		
		<%-- 
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			String loginMsg = (String)request.getAttribute("fail");
			
			if(loginMsg!=null && loginMsg.equals("0")){
				out.println("<br>");
				out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
			}
			else if(loginMsg!=null && loginMsg.equals("-1")){	
				out.println("<br>");
				out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
			}
			
			위의 if 문을 EL과 JSTL로 변경한 것은 아래와 같다. 
		--%>	
		
		<c:set var="failMessage" value="${requestScope.fail}"/>
		<c:if test="${failMessage!=null}">	
			<c:choose>
				<c:when test="${failMessage=='0'}">
					<br><font color='red' size='5'>비밀번호를 확인해 주세요.</font>
				</c:when>
				<c:otherwise>
					<br><font color='red' size='5'>아이디를 확인해 주세요.</font>
				</c:otherwise>
			</c:choose>
		</c:if>
		
	</div>	
</body>
</html>