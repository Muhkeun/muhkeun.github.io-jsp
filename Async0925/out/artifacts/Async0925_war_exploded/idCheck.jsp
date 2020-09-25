<%@ page import="mybatis.dao.memberDAO" %>
<%@ page import="mybatis.vo.MemberVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/25
  Time: 3:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idToCheck = request.getParameter("m_id");

    MemberVO vo = memberDAO.serach_id(idToCheck);

    //vo가 Null이면 사용자가 보낸 id는 사용가능한 id이다.
    if(vo ==null){
        //사용가능한 ID
    // %>
        {"res":"사용 가능"}
 <%
    }else {
        //사용 불가능한 ID
%>
        {"res":"사용 불가능"}
<%
    }
%>