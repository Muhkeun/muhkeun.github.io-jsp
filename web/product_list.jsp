<%@ page import="shop.bean.ShopBean" %>
<%@ page import="mybatis.vo.ProductVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/29
  Time: 9:45 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <jsp:include page="nav.jsp"/>

    <%
    //한글 요청 처리
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session"/>

<%--
현재 페이지로 넘어올 때 전달되는 파라미터 => category
shopbean에 category라는 멤버 변수에 자동으로 들어간다.
--%>
<jsp:setProperty name="sb" property="*"/>
<%
    //Mybatis 환경을 이용해서 제품 목록을 채운다.
    //ShopBean의 p_list라는 배열이 사용자가 선택한 category별로 제품들이 채워졌다.
    sb.searchProduct();
    ProductVO[] list = sb.getProductlist();
%>
        <table align="center" width="600" border="1"
               style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
               cellpadding="4" cellspacing="0">
            <thead>
                <tr bgcolor="#dedede">
                    <th width="10%">제품번호</th>
                    <th width="10%">이미지</th>
                    <th width="35%">제품명</th>
                    <th width="20%">제품가격</th>
                    <th width="25%">비고</th>
                </tr>
            </thead>
            <tbody>
            <%
                if(list != null && list.length>0){
                    for(ProductVO pvo : list){
            %>
                    <tr align="center">
                    <td><%=pvo.getP_num()%></td>
                    <td><img src="images/<%=pvo.getP_image_l()%>" width="100" height="95"></td>

                    <td>
                        <a href="product_content.jsp?prod_num=<%=pvo.getP_num()%>">
                            <%=pvo.getP_name()%>
                        </a>
                    </td>
                    <td>
                        할인가 :<%=pvo.getP_saleprice()%>원<br>
                        <font color="red">(<%=pvo.getPercent()%>%)</font>
                    </td>
                    <td>
                        시중 가격 :<%=pvo.getP_price()%> 원
                    </td>
                </tr>
            <%
                    }
                }else{
            %>
        <td colspan="5" class="empty">
            등록된 상품이 없습니다.
        </td>
<%
                }
%>
            </tbody>
        </table>
    </body>
</html>










