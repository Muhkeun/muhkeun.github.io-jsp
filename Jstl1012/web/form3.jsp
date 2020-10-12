<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 1:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String [] ar = {"Java", "JavaScript", "Python", "Lombok"};

    request.setAttribute("arr", ar);
%>
<h1>JSTL for 연습</h1>
<ul>
    <c:set value="<%=ar%>" var="ar"/>
    <c:forEach var ="ss" items="${arr}">
        <li>
            ${ss}
        </li>
    </c:forEach>
</ul>
</body>
</html>