<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		int seq = Integer.parseInt( request.getParameter("seq") );    
    
    	BoardDao dao= BoardDao.getInstance();
    	Board boardDTO = dao.getBoard(seq);   	
    %>
    
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>

<form action="updateBoard.jsp" method="post">
	<input type="hidden" name = "seq" value = <%=  boardDTO.getSeq() %>>
	작성자 : <input type="text" name="writer" value = "<%= boardDTO.getWriter()%>"><br>
	제목 : <input type="text" name="title" value = "<%=boardDTO.getTitle() %>"><br>
	내용 <br>
	<textarea rows="6" cols="70" name="contents"><%=boardDTO.getContents() %></textarea>
	<br>
	<input type="submit" value="수정완료">
</form>

</body>
</html>