<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/25
  Time: 3:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비동기식 통신으로 아이디 체크</title>
    <style>
        .success{
            color: #0000ff;
        }
        .fail{
            color: #ff0000;
        }
    </style>
</head>
<body>
<h1>아이디 체크</h1>
<article>
    <form>
        <label for="u_id"></label>
        <input type="text" id="u_id" name="m_id" placeholder="아이디">
        <span id="str"></span>
    </form>
</article>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    //Jquery 시작
    $(function () {
        $("#u_id").on("keyup", function () {
            //키를 누를 때마다 이벤트 발생
            var id = $("#u_id").val();
            //var id = $("this").val();

            if(id.length > 3){
                $.ajax({
                    url: "idCheck.jsp",
                    data: "m_id=" + id,
                    type: "post",
                    dataType: "json",
                }).done(function (data) {
            $("#str").text(data.res);
                });
            }else {
                $("#str").text("");
            }



        });
    });
</script>
</html>
