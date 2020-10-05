<%@ page import="mybatis.vo.ProductVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/29
  Time: 2:11 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <jsp:include page="nav.jsp"/>

    <jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>
    <jsp:setProperty property="productNum" name="sb" param="prod_num"/>
    <%
        //해당 제품을 찾아서 받는다.
       ProductVO pvo = sb.getProduct();
    %>
    <table>
        <colgroup>
            <col width="40%">
            <col width="60%">
        </colgroup>
        <tbody>
        <tr>
            <td>제품Category</td>
            <td><%=pvo.getCategory()%></td>
        </tr>
        <tr>
            <td>제품번호</td>
            <td><%=pvo.getP_num()%></td>
        </tr>
        <tr>
            <td>제품이름</td>
            <td><%=pvo.getP_name()%></td>
        </tr>
        <tr>
            <td>제품 판매사</td>
            <td><%=pvo.getP_company()%></td>
        </tr>
        <tr>
            <td>제품가격</td>
            <td><%=pvo.getP_price()%>(할인가 : <%=pvo.getP_saleprice()%> )</td>
        </tr>
        <tr>
            <td colspan="2">제품설명</td>
        </tr>
        <tr>
            <td colspan="2" align="center"><img src ="images/<%=pvo.getP_image_l()%>"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="장바구니에 담기"
                       onclick="javascript:location.href='addProduct.jsp?p_num=<%=pvo.getP_num()%>'"/>
                <input type="button" value="장바구니 보기"
                       onclick="javascript:location.href='cartList.jsp'"/>
            </td>
        </tr>
        </tbody>
    </table>

</body>
</html>
