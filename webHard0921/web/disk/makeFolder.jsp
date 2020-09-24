<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/23
  Time: 1:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

    String f_name = request.getParameter("f_name");
    System.out.println(f_name);
    String cPath = request.getParameter("cPath");
    System.out.println(cPath);

    String r_path = application.getRealPath("/members/" + cPath +"/"+ f_name);


    File file = new File(r_path);

    file.mkdirs();


    //response.sendRedirect("myDisk.jsp?cPath="+ cPath);

%>
<html>
<head>
    <title>Title</title>
</head>
<body onload="exe()">
<form action="myDisk.jsp" method="post" name = "form1">
    <input type="hidden" name="cPath" value="<%=cPath%>">
</form>
<script>
    function exe() {
        document.form1.submit();
    }
</script>
</body>
</html>
