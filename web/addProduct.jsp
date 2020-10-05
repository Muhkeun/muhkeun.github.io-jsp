<%@ page import="shop.bean.Cart" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/05
  Time: 2:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sb" scope="session" class="shop.bean.ShopBean"/>
<jsp:useBean id="cart" scope="session" class="shop.bean.Cart"/>
<%
    String pnum = request.getParameter("p_num");
    //카트에 제품을 추가
    cart.addProduct(sb, pnum);
    response.sendRedirect("product_content.jsp?prod_num="+pnum);
%>
