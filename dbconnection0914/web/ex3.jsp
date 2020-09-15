<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/14
  Time: 2:32 오후
  To change this template use File | Settings | File Templates.
--%>
<%-- "<%@" : 페이지 지시자 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- HTML 주석! -->
<%-- JSP 주석! --%>
<%--                               **JSP 의 기본 문법
     스크립트 요소 (스트립트릿, 출력문, 선언문)
     1)스크립트릿: 자바 코드를 지정할 때 사용(변수, 선언, 제어문 등...)
        <%
            String msg = "TEST";
            if(msg.equals("ABC"))..;

        %>

     2)출력문 : 서블릿의 out.println();을 사용하고자 할 때
        <%= msg%> ----> out.println(msg);

     3)선언문 : 멤버변수를 선언하거나, 멤버 메소드를 선언할 때 사용
        <%!
            //멤버변수 선언
            String msg;

            //멤버메소드 선언
            private void test(){
                System.out.println(msg);
            }
     --%>

<%! //선언문
   int cnt = 100;
   %>

<h1>스크립트 요소 연습</h1>
<article>
    <table border = "1">
        <colgroup>
            <col width="80px"/>
            <col width="180px"/>
        </colgroup>
        <thead>
        <tr>
            <th>
                번호
            </th>
            <th>
                항목
            </th>
        </tr>
        </thead>
        <tbody>
        <%
        for(int i = 0; i< cnt; i++){
       %>
        <!-- 이곳의 HTML은 for문 안에 존재하는 HTML 영역이다. -->
        <tr>
            <td><%=i%></td>
            <td>항목<%=i+1%></td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>
</article>

</body>
</html>
