<%@ page import="mybatis.vo.ProductVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/05
  Time: 1:39 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="nav.jsp"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        table{
            width: 600px;
            font-size: 12px;
            border-collapse: collapse;
            border: 1px solid black;
            padding: 4px;
            margin: 0 auto;
        }
        table tbody tr{
            border: 1px solid black;
        }
        table td{
            padding: 4px;
        }
    </style>
</head>
<body>
<table width="600" border="1" align="center"
       style="border-collapse:collapse;font-size:8pt" cellspacing="0"
       cellpadding="4">
    <thead>

    <tr>
        <td colspan="6">:: 장바구니 내용</td>
    </tr>
    <tr bgcolor="#dedede">
        <th>제품번호</th>
        <th width="25%">제품명</th>
        <th>단가</th>
        <th>수량</th>
        <th>금액</th>
        <th>삭제</th>
    </tr>
    </thead>
<tbody>

    <jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
    <%
    int total = 0;

    //카트에 저장된 모든 제품들을 배열로 얻어낸다.
        ProductVO[]  ar = cart.getList();

        if(ar != null){
            for(ProductVO pvo : ar){
    %>
    <tr align="center">
        <td><%=pvo.getP_num() %></td>
        <td><%=pvo.getP_name()%>vo%></td>
        <td>
            정가:<%=pvo.getP_price()%><br>
            <font color="red">
                세일가격:<%=pvo.getP_saleprice()%>
            </font>
        </td>
        <td>
            <!-- 수량 조정 폼 -->
            <form action="changeAmount.jsp" method="post">
                <input type="hidden" name="productNum" value="<%=pvo.getP_num()%>"/>
                <input type="text" name="amount" id="amount" value="<%=pvo.getQuant()%>" size="2"/>
                <input type="submit" value="변경">
            </form>
            <!------------------>
        </td>
        <td><%=pvo.getTotalPrice()%></td>
        <td>
            <input type="button" value="삭제"
                   style="border:1 solid black;cursor:pointer"
                   onclick="javascript:location.href='delProduct.jsp?productNum=<%=pvo.getP_num()%>'">
        </td>
    </tr>
    <%
            total += pvo.getTotalPrice();
            }//for
        }else {
    %>
    <tr align="center">
        <td colspan="6">
            <b>장바구니가 비었습니다.</b>
        </td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="5" align="right">총 결재액 : <%=total%></td>
        <td></td>
    </tr>
</tbody>
</table>

</body>
</html>







