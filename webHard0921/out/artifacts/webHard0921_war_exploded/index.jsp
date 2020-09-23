<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/21
  Time: 1:20 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>웹하드</title>
</head>
<frameset cols="190,*" border="0">
  <frame src="left.jsp" name="left"/>
  <frame src="right.jsp?msg=<%=msg%>" name="right"/>
</frameset>
</html>
