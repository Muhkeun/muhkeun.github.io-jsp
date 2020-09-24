<%@ page import="mybatis.dao.memberDAO" %>
<%@ page import="java.io.File" %>

<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/21
  Time: 2:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%!
    private String makeString(String[]ar, String delim) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < ar.length; i++) {
            sb.append(ar[i]);
            if (i < ar.length - 1) {
                sb.append(delim);
            }
        }
            return sb.toString();
    }
%>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    String [] phone_ar = request.getParameterValues("phone");

    //하나의 배열의 값들을 하나의 문자열로 변환
    String phone = makeString(phone_ar,"-");


    //    StringBuffer sb = new StringBuffer();
//
//    for(String p : phone_ar){
//        sb.append(p);
//    }
//    로 사용할 수 있으나 함수를 이용하여 위쪽에 구현.

    String email = request.getParameter("email");
    boolean chk = memberDAO.add(id, pw, name, addr, phone, email);

    //chk가 true 일때만 특정 위치에 가입한 사용자의 id와 같은 이름으로 폴더를 생성
    //folder는 directory와 같은 것이며, 이것을 만들기 위해서 먼저
    //java.io.file 객체를 먼저 만들어야 한다.
    //그 안에 있는 메서드 중 mkdir() 또는 mkdirs()로 폴더를 생성해야한다.

    if(chk){
        //현재 서버의 members라는 폴더의 정확한 절대경로를 얻자 => application.getRealPath
        String path = application.getRealPath("/members/"+id);
        //절대 경로가 어딘지 확인 차 출력
        System.out.println(path);

        //폴더를 생성할 수 있는 객체, 즉 File 객체를 생성
        File file = new File(path);

        //폴더 경로 존재 하는지 확인
        if(!file.exists())
            //실제 물리적으로 폴더가 생성.
            file.mkdirs();
%>
<script>
    parent.location.href ="index.jsp?msg=1";
</script>
<%
}else{//if(chk)
%>
<script>
    parent.location.href ="index.jsp?msg=0";
</script>
<%
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
