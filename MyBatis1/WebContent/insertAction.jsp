<%@page import="kosta.model.Search"%>
<%@page import="kosta.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <% request.setCharacterEncoding("utf-8"); %>    
    <%    	
    	Search search = new Search();
    	search.setArea(request.getParameterValues("area"));
    	search.setSearchKey("%" +request.getParameter( "searchKey" )+ "%");
    
    	BoardDao boardDao = BoardDao.getInstance();
    	List<Board> list = boardDao.listBoard(search);
    	request.setAttribute("list", list);    	
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- EL태그 사용하기 -->
	<table border = "1">
		<tr>
			<td> 글번호 </td>
			<td> 타이틀 </td>
			<td> 작성자 </td>
			<td> 내용 </td>
			<td> 작성날짜 </td>
			<td> 조회수 </td>
		</tr>
		
		<c:forEach var = "b" items="${list }">
			<tr>
				<td>${b.seq }</td>
				<td><a href = "detail.jsp?seq=${b.seq }">${b.title }</a></td>
				<td>${b.writer }</td>
				<td>${b.contents }</td>
				<td>${b.regdate }</td>
				<td>${b.hitcount }</td>
			</tr>
		</c:forEach>
		
		
		
		<%-- <%
			for(int i = 0; i < list.size(); i++){
				Board b = list.get(i);
		%>
				<tr>
					<td><%= b.getSeq() %></td>
					<td><a href = "detail.jsp?seq=<%= b.getSeq() %>"><%= b.getTitle() %></a></td>
					<td><%= b.getWriter() %></td>
					<td><%= b.getContents() %></td>
					<td><%= b.getRegdate() %></td>
					<td><%= b.getHitcount() %></td>
				</tr>		
		<%
			}
		%> --%>
		
	</table>
	<br>
	
	<form	action = "insertAction.jsp" method="post">	
		<input type="checkbox" name = "area" value = "title">제목
		<input type="checkbox" name = "area" value = "writer">글쓴이
		<input type="text" name = "searchKey" size = "10">
		<input type="submit" value = "검색">
	</form>
</body>
</html>