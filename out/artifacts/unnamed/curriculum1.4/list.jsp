<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String keyWord = (String) request.getParameter("keyWord");
	String keyField = (String) request.getParameter("keyField");
	System.out.println(keyWord);
	System.out.println(keyField);
%>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/myscript.js"></script>

<style type="text/css">
table {
	border-collapse: collapse;
	text-align: left;
	line-height: 2;
	border: 1px solid #BFD0E6;
	margin: 20px 10px;
}

tr:first-child {
	background: #e7708d;
}

ul li {
	float: left;
	list-style: none;
	padding: 4px;
}
</style>
</head>
<body>

	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${boardList}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="javascript:titleClick(${dto.bId})">${dto.bTitle}</a> <%-- <a href="" title="내용 보기" onclick="titleClick(${dto.bId})"> ${dto.bTitle}</a> --%>
				</td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<form action="controller.jspx?cmd=board" method="post" name="search">
					<select name="keyField" id=keyField>
						<option value="bTitle" selected="selected">글 제목</option>
						<option value="bContent" >글 내용</option>
						<option value="bName">작성자</option>
					</select> <input type="text" name="keyWord" id="keyWord" value="${keyWord}">
					<input type="button" value="검색" onclick="searchCheck(form)">

				</form>
			</td>
		</tr>


		<tr>
			<td colspan="5"><button onclick="writeClick();">글쓰기</button> <input
				type="button" value="목록" onclick="listClick()" />&nbsp;&nbsp;</td>
		</tr>
	</table>

	<%-- 	<%=PageAction.pageNumber() %>
	 --%>
	<div class="toolbar-bottom">
		<div class="toolbar mt-lg">
			<div class="sorter">
				<ul class="pagination">
					<li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
					<li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<li class="active"><a
									href="javascript:PageMove(${i},${keyWord},${keyField})">${i}</a></li>
								<a href="controller.jspx?cmd=board&page=1"> </a>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:PageMove(${i})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
					<li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
				</ul>
			</div>
		</div>
	</div>


</body>
</html>