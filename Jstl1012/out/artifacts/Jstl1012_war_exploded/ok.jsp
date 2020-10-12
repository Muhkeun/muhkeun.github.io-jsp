<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 9:32 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<html>
<head>
    <title>EL: Expression Language(표현언어)</title>
</head>
<body>
    <h1>EL: Expression Language(표현언어)</h1>
    <h2>
        map 구조 또는 List 구조 등의 컬렉션 접근을 유용하게 해주는 문법을 가진 표현언어이다.
    </h2>
    <h2>
        표현언어가 가지는 기본 객체:<br/>
        1) param: 파라미터 값<br/>
        2) requestScope: 요청객체 <br/>
        3) sessionScope: HttpSession 객체 <br/>
    </h2>
<%--    파라미터 값들은 앞에 반드시 param을 붙여야한다.--%>
    <h2>
        ${param.s_id}
    </h2>
    <h2>
        ${param.s_pw}
    </h2>
    <h2>
        ${param.cPage}
    </h2>
</body>
</html>
