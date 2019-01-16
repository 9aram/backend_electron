<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/myscript.js"></script>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="controller.jspx?cmd=modifyContents&bId=${bId}" method="post" >
			<input type="hidden" name="bId" value="${bId}">
			<tr>
				<td> 번호 </td>
				<td> ${bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${bName}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${bTitle}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" name="bContent" >${bContent}</textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td> <a href = "controller.jspx?cmd=downloadFile&bFile=${bFile}" >${bFile}</a> </td> 	
				
			</tr>
			<tr >
		
				<td colspan="2">
				 <input type="submit" value="수정"> &nbsp;&nbsp; 
				 <a href="controller.jspx?cmd=deleteContents&bId=${bId}">삭제</a> &nbsp;&nbsp; 
				 <a href="controller.jspx?cmd=viewReplyContents&bId=${bId}">답변</a></td>
			</tr>
		</form>
		
	</table>
	<input type="button" value="목록" onclick="listClick()" />&nbsp;&nbsp;
	
</body>
</html>