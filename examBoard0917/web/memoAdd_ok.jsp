<%@ page import="mybatis.vo.MemoVO" %>
<%@ page import="mybatis.dao.MemoDAO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/17
  Time: 3:22 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        request.setCharacterEncoding("utf-8");
        String writer = request.getParameter("writer");
        String content = request.getParameter("content");
        String ip = request.getParameter("ip");

        MemoDAO.add(writer, content, ip);

        //화면 강제이동
        response.sendRedirect("memoList.jsp");

    %>
