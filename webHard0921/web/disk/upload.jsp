<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/23
  Time: 3:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

    //현재 위치 파라미터로 받아서 파일 저장 경로에 넣기
    //=>form에서 encType으로 보냈기 때문에 못받아온다.
    //String cPath = request.getParameter("dir"); (x)
    //String path = application.getRealPath("/members/" + cPath);

    String cPath = (String)session.getAttribute("cPath");
    String path = application.getRealPath("/members/" + cPath);
    //MultipartRequest => 파일 객체 그냥 받음
    MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());


    //만약 첨부된 파일의 정보를 DB에 저장해야 한다면 여기서 저장된 파일명을 알아내야한다.
    //첨부된 파일의 정보
    File file = mr.getFile("upload");
    String newFileName = file.getName();

    //첨부 파일이 저장될 때 이름이 변경될 수 있으며,원래 이름을 알아낸다.
    String originFileName = mr.getOriginalFileName("upload");

    //첨부여부 확인
    if(file != null){
    System.out.println("변경 전 파일 이름: " + originFileName + "\n"
                        + "현재 파일 이름: " + newFileName);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body onload="exe()">
<form action="myDisk.jsp" method="post" name = "form1">
    <input type="hidden" name="cPath" value="<%=cPath%>">
</form>
<script>
    function exe() {
        document.form1.submit();
    }
</script>
</body>
</html>
