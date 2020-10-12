<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 1:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>JSTL for문 연습</h1>
    <c:set var="cnt" value="20"/>
    <ul>
        <c:forEach begin="1" end="10" step="1" var="v1">
            <li>번호:${v1}</li>
        </c:forEach>
    </ul>
    <ul>
        <c:forEach begin="1" end="${cnt}" step="1" varStatus="st">
        <li>번호:${st.index}</li>
        </c:forEach>
    </ul>
</body>
</html>
