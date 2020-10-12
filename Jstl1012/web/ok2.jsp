<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Hashtable" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 10:12 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    request.setCharacterEncoding("utf-8");

    String s_id = request.getParameter("s_id");
    session.setAttribute("s_id",s_id);

    //Map 구조 생성
    Map<String, String> map = new Hashtable<String, String>();
    map.put("name", "홍길동");
    map.put("id", s_id);

    //Map구조를 Session에 저장
    session.setAttribute("map", map);

%>
<h1>${param.s_id}</h1>
<h1>${param.s_pw}</h1>
<h1>${paramValues.s_phone[0]} -
    ${paramValues.s_phone[1]} -
    ${paramValues.s_phone[2]}</h1>

<%--res.jsp로 이동--%>
<input type="button" value="다음페이지" onclick="javascript: location.href='res.jsp?pw=${param.s_pw}'"/>

<script>
   function exe() {
       //res.jsp 로 이동
       // location.assign("res.jsp")
       location.href="res.jsp";
   }


</script>
</body>

</html>
