<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/14
  Time: 3:28 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>파라미터 연습</title>
</head>
<body>
<h1> 파라미터 연습</h1>
<article>
    <form action="ex4_param.jsp" method="post">
        <label for="s_name">친구이름1</label>
        <input type="text" id="s_name" name="s_name"/><br>

        <label for="s_name2">친구이름2</label>
        <input type="text" id="s_name2" name="s_name"/><br>

        <label for="s_name3">친구이름3</label>
        <input type="text" id="s_name3" name="s_name"/><br>
                                                            
        <input type="button" value="보내기" onclick="exe()"/>
    </form>
</article>
<script>
    function exe() {
            document.forms[0].submit();
    }
</script>
</body>
</html>
