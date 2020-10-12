<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 11:12 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--
    JSTL(JSP Standard Tag Library
        자바 기반의 웹환경에서 지원하는 확장된 Tag를
        사용할 수 있도록 제공되는 라이브러리(Tag로 제어문 지원)

    먼저 JSTL 라이브러리를 apache.org의 Tomcat Project에서 다운 받을 수 있다.
    WEB-INF/lib에 standard.jsr와 jstl.jsr를 넣어둬야 한다.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
</head>

    <%--    JSTL 변수 선언--%>
    <%--  int idx = 100;   --%>
    <c:set var="idx" value="100"/>
    <%-- 스크립트 요소에서 정의한 변수를 JSTL에서는 바로 사용할 수 없다.   --%>
    <%
        int value = 20;
    %>
    <c:set var="value" value="<%=value%>"/>
    <c:if test="${value >= 10}">
        <h2>value의 값이 10 이상 입니다.</h2>
    </c:if>
    <c:if test="${value < 10}">
        <h2>value의 값이 10 미만 입니다.</h2>
    </c:if>

</body>
</html>
