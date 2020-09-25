<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/24
  Time: 3:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //한글 요청 처리
    request.setCharacterEncoding("utf-8");


%>
<%--
    객체 생성
    DataVO vo = new DataVO(); 와 같다.
--%>
<jsp:useBean id="vo" class="vo.DataVO"></jsp:useBean>

<%--
<jsp:setProperty name="vo" property="m_id" param="m_id"></jsp:setProperty>
 property 와 param이 같으면 param 생략가능
<jsp:setProperty name="vo" property="m_name"></jsp:setProperty>
--%>
<jsp:setProperty property="*" name="vo"></jsp:setProperty>
<h1>아이디: <%= vo.getM_id()%><br/> 이름: <%= vo.getM_name()%><br/></h1>
<h2>전화번호: <%= vo.getPhone()[0]%> - <%=vo.getPhone()[1]%> - <%=vo.getPhone()[2]%> </h2>
<h2>나이: <%=vo.getM_age()+1%></h2>
</body>
</html>
