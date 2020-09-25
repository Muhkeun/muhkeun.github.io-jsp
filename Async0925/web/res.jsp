<%@ page import="mybatis.dao.memberDAO" %>
<%@ page import="mybatis.vo.MemberVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/25
  Time: 11:40 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //요청시 한글 처리
    request.setCharacterEncoding("utf-8");
    //id를 파라미터로 받아오기
    String u_id = request.getParameter("u_id");


    MemberVO vo = memberDAO.serach_id(u_id);

    if(vo == null){
%>
{"msg":"등록되지 않은 ID"}
<%
}else{
%>
{"msg":"이미 등록된 ID"}
<%
}
%>

