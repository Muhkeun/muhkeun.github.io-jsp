<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/22
  Time: 2:39 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //로그아웃을 위해 session에 저장해 두었던 "uvo"를 삭제한다.
    session.removeAttribute("uvo");

    response.sendRedirect("left.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
