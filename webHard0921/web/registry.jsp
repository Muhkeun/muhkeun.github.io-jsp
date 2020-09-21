<%@ page import="mybatis.dao.memberDAO" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="com.sun.xml.internal.stream.buffer.stax.StreamReaderBufferCreator" %>

<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/21
  Time: 2:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%!
    private String makeString(String[]ar, String delim) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < ar.length; i++) {
            sb.append(ar[i]);
            if (i < ar.length - 1) {
                sb.append(delim);
            }
        }
            return sb.toString();
    }
%>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    String [] phone_ar = request.getParameterValues("phone");

    String phone = makeString(phone_ar,"-");


    //    StringBuffer sb = new StringBuffer();
//
//    for(String p : phone_ar){
//        sb.append(p);
//    }
    String email = request.getParameter("email");
    memberDAO.add(id, pw, name, addr, phone, email);



    //화면 강제이동
    response.sendRedirect("index.jsp");

%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
