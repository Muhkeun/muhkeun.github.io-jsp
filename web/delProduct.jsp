<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/05
  Time: 3:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>

<%
    String pnum = request.getParameter("productNum");


    boolean chk = cart.delProduct(pnum);

    response.sendRedirect("cartList.jsp");
%>