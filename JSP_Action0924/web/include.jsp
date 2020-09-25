<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/24
  Time: 2:25 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>include</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <jsp:include page="nav.jsp"></jsp:include>
<%--
    include 액션 요소는 포함된 jsp문서가 컴파일된 결과만 포함 시킨다.
    => html 결과만 포함 시키기 때문에 그 안에서 사용되는 변수등을 현재 페이지 사용할 수 없다.
--%>
    </header>
<article>첫번째 페이지</article>
</body>
</html>
