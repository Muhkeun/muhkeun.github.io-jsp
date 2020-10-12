<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 11:35 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");

        //파라미터로 넘어오는 u_name이 'admin' 일 때만
        //'관리자'님 환영합니다. 메시지를 출력하고 나머지는
        // '님' 환영합니다. 를 출력
    %>

    <c:if test="${param.u_name == 'admin'}">
        <h2>${param.u_name} 관리자님 환영합니다.</h2>
    </c:if>
    <c:if test="${param.u_name != 'admin'}">
        <h2>${param.u_name} 님 환영합니다.</h2>
    </c:if>
</body>

</html>
