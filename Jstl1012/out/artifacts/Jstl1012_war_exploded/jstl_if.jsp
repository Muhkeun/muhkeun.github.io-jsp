<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 11:33 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>JSTL if TEST</h1>
    <form action="res2.jsp" method="post">
        <label for="u_name">이름:</label>
        <input type="text" name="u_name" id="u_name"><br/>

        <input type="button" value="보내기" onclick=exe(this.form)>
    </form>
<script>
    function exe(frm){
        frm.submit();
    }
</script>
</body>

</html>
