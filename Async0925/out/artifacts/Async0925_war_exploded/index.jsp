<%@ page import="mybatis.dao.memberDAO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/25
  Time: 11:28 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비동기식 통신 연습</title>
</head>
<body>
<h1>비동기식 통신 연습</h1>
<article>
    <form>
        <label for="u_id"></label>
        <input type="text" id="u_id" placeholder="검색할 ID"><br/>

        <input type="button" value="보내기" id="btn_Submit">
    </form>
</article>
<h1>동기식 통신 연습</h1>
<article>
    <form action="res.jsp" method="post">
        <label for="u_id2"></label>
        <input type="text" id="u_id2" name="u_id" placeholder="검색할 ID"><br/>

        <input type="button" value="보내기" id="btn_Submit2" onclick="exe()">
    </form>
</article>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
<%--    jquert 시작 부분 --%>
    $(function () {
        $("#btn_Submit").click(function () {
            $.ajax({
                //비동기식 통신을 위한 서버 경로 => res.jsp
                url: "res.jsp",
                //통신 방법 => post
                type: "post",
                //보내고자 하는 파라미터 => u_id
                data: "u_id=" + $("#u_id").val(),
                //결과를 받을 때 json형식으로 받는다.
                dataType: "json"
            //done() => 비동기식 통신을 성공했을 때 수행
            }).done(function (data){
                alert(data.msg);
            });
        });
    });
</script>
</body>
</html>
