<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/29
  Time: 1:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #title{
            font-size:30px;
            color: maroon;
        }
        .txt_c{text-align: center}
        a:link{text-decoration:none; color:navy}
        a:visited{text-decoration:none; color:navy}
        a:hover{text-decoration:none; color:red}
        .empty{
            text-align: center;
            height: 50px;
            line-height: 50px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<hr width="600" border="1" noshade color="navy">
<div id="title" class="txt_c">
    <strong>GLOBAL SHOPPING CENTER</strong>
</div>
<hr width="600" border="1" noshade color="navy">
<div id="header" class="txt_c">
    <a href="product_list.jsp?category=com001">컴퓨터</a> |
    <a href="product_list.jsp?category=ele002">가전 제품</a> |
    <a href="product_list.jsp?category=sp003">스포츠</a>
</div>
<hr width="600" border="1" noshade color="navy">
</body>
</html>
