<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 10:20 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <h1>${sessionScope.s_id}</h1>
    <h1>param.pw: ${param.pw}</h1>
    <h1>param["pw"]: ${param["pw"]}</h1>
<%--    Session에 있는 Map 출력--%>
    <h1>${sessionScope.map.name}</h1>
    <h1>${sessionScope.map.id}</h1>
</body>
</html>
