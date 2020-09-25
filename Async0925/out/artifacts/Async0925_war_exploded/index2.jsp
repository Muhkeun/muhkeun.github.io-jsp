<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/25
  Time: 1:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비동기식 통신</title>
</head>
<body>
    <h1>비동기식 통신</h1>
        <article>
            <table border="1" id="table">
                <colgroup>
                    <col width="70px">
                    <col width="120px">
                    <col width="110px">
                </colgroup>
                <thead>
                    <tr>
                        <td colspan="3">
                            <input type="button" id="btn" value="가져오기">
                        </td>
                    </tr>
                    <tr>
                        <th>사번</th>
                        <th>이름</th>
                        <th>직무</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </article>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    //Jquery 시작
    $(function () {
        //아이디가 btn인 요소를 클릭할 때 수행하는 이벤트
        $( "#btn" ).click(function () {
            $.ajax({
                url: "ok.jsp",
                type: "post",
                //dataType => ok.jsp 에서 반환하는 형태
                dataType: "json"
            //통신에 성공했을 때 수행하는 곳
            }).done(function (res){
                //각 자원들을 tr로 만들어서 누적 시키는 변수
                var code = "";

                for(var i = 0; i <res.length; i++){
                    code += "<tr><td>" + res[i].empno+"</td>"+
                            "<td>" + res[i].ename+"</td>"+
                            "<td>"+ res[i].job+"</td></tr>";
                }//포문 끝
                //tr태그 3개가 code에 누적 => table-tbody안에 html로 넣자
                $("#table>tbody").html(code);
            }).fail(function (err){
                console.log(err)
            });
        });
    });
</script>
</html>
