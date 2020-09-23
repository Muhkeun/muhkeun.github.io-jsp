<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/23
  Time: 3:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = application.getRealPath("/members/root1");

    MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, new DefaultFileRenamePolicy());

%>
<html>
<head>
    <title>Title</title>
</head>
<body onload="exe()">
<form action="myDisk.jsp" method="post" name = "form1">
    <input type="hidden" name="cPath" value="root1">
</form>
<script>
    function exe() {
        document.form1.submit();
    }
</script>
</body>
</html>
