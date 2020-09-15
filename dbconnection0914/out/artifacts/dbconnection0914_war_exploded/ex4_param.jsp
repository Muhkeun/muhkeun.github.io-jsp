<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/14
  Time: 3:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>param.jsp</title>
</head>
<body>
    <%
        //파라미터를 받기 전 요청시 한글처리 - JSP에서 request는 내장객체 (이미 준비되어 있는 객체)
        //                                      request, response, out(PrintWriter), session(HttpSession),...
    request.setCharacterEncoding("utf-8");

    //파라미터 받기
    String [] names = request.getParameterValues("s_name");

    //for(int i = 0 ; i < names.length; i++){
      for(String n : names){
          //out.println("<h2>" +n + "<h2>");%>
    <h2><%=n %></h2>
    <%}//for%>
</body>
</html>
