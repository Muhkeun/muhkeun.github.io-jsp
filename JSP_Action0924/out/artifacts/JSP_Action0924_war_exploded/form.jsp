<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/24
  Time: 3:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>액션 요소 연습</h1>
<article>
    <form action="action.jsp">
        <label for="m_id">아이디:</label>
        <input type="text" name="m_id" id="m_id"><br/>

        <label for="m_name">이름:</label>
        <input type="text" name="m_name" id="m_name"><br/>

        <label for="m_age">나이:</label>
        <input type="text" name="m_age" id="m_age">

        <label for="m_phone">전화번호:</label>
        <select name="phone" id="m_phone">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
        </select>

        <label for="m_phone2">-</label>
        <input type="text" name="phone" id="m_phone2">

        <label for="m_phone3"></label>
        <input type="text" name="phone" id="m_phone3">

        <input type="button" value="보내기" onclick="exe()">
    </form>
 </article>
</body>
<script>
    function exe() {
        //유효성 검사 생략
        document.forms[0].submit();
    }
</script>
</html>
