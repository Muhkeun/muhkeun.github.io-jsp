<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 1:09 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Title</title>
</head>
<body>
<%--
    현재 페이지는 money라는 파라미터를 받는다.
    money에 따라 과일을 선택할 수 있다.
    사과: 500
    배: 700
    대봉: 1000
--%>"
<c:choose>
    <c:when test="${param.money >=1000}">
        사과, 배, 대봉 중 하나를 선택.
    </c:when>
    <c:when test="${param.money >=700}">
        사과, 배 중 하나를 선택.
    </c:when>
    <c:when test="${param.money >= 500}">
        사과 선택.
    </c:when>
    <c:otherwise>
        선택할 수 있는 과일이 없습니다.
    </c:otherwise>
</c:choose>
</body>
</html>
