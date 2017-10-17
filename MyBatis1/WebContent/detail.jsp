<%@page import="java.util.List"%>
<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
    <%
    	int seq = Integer.parseInt( request.getParameter("seq") );
   		BoardDao boardDao = BoardDao.getInstance();
   		
   		Board bDTO = boardDao.getBoard(seq);
   		
   		request.setAttribute("board", bDTO);
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 제목  : ${board.seq }</h1>
	<h2> 작성자 : ${board.writer }</h2> <br>
	<h2> 작성일 : ${board.regdate }</h2><p> 조회수 : ${board.hitcount }</p>
	<h3> 내용 : ${board.contents }</h3>
	<a href = "updateForm.jsp?seq=${board.seq }">수정하기</a>
	<a href = "deleteForm.jsp?seq=${board.seq }"> 삭제하기</a>
</body>
</html>