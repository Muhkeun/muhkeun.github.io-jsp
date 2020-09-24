<%@ page import="mybatis.vo.MemberVO" %>
<%@ page import="mybatis.dao.memberDAO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/22
  Time: 1:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

    String u_id = request.getParameter("u_id");
    String u_pw = request.getParameter("u_pw");

    MemberVO vo = memberDAO.login(u_id,u_pw);

    if(vo != null)
        session.setAttribute("uvo", vo);

    response.sendRedirect("left.jsp");

%>

