<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/10/12
  Time: 9:14 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="ok2.jsp" method="post">
    <label for="s_id">ID:</label>
    <input type="text" name="s_id" id="s_id"/><br/>

    <label for="s_pw">PW:</label>
    <input type="password" name="s_pw" id="s_pw"/><br/>

    <label for="s_phone">Phone:</label>
    <select name="s_phone" id="s_phone">
        <option value="010">010</option>
        <option value="010">011</option>
        <option value="010">016</option>
    </select>

    <label for="s_phone2">-</label>
        <input type="text" name="s_phone" id="s_phone2">

        <label for="s_phone1">- </label>
        <input type="text" name="s_phone" id="s_phone1">

    <input type="hidden" name="cPage" value="2">
    <input type="button" value="로그인" onclick="sendData(this.form)">

</form>
<script>
    function sendData(frm){
        //유효성 검사
        //값 받아오기
        var s_id = document.getElementById("s_id");
        //var s_pw = document.getElementById("s_pw");
        var s_pw = frm.s_pw;

        //id 유효성 검사
        if(s_id.value.trim().length == 0){
            alert("아이디를 입력하세요");
            //초기화
            s_id.value = "";
            s_id.focus();
        }
        //pw 유효성 검사
        if(s_pw.value.trim().length == 0){
            alert("비밀번호를 입력해주세요");
            s_pw.value ="";
            s_pw.focus();
        }

        frm.submit();


    }
</script>
</body>
</html>
