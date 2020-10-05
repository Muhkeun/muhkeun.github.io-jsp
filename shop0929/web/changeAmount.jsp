<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/05
  Time: 2:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="cart" scope="session" class="shop.bean.Cart"/>
<%
    String pnum = request.getParameter("productNum");
    String amount = request.getParameter("amount");

    //카트에 제품을 추가
    if(pnum != null && amount != null) {
    int amountToInt = Integer.parseInt(amount);
        cart.changeAmount(pnum, amountToInt);
    }
    response.sendRedirect("cartList.jsp");

%>
