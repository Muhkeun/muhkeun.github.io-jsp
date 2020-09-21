<%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/17
  Time: 2:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>메모 추가</title>
    <style type="text/css">
        body{ font-size: 12px }
        table{
            border-collapse: collapse;
            width: 500px;
        }
        table th, table tbody td{
            border: 1px solid black;
            padding: 4px;
        }
        table tfoot td{ text-align: right; }
        table caption { text-indent: -9999px; height: 0; }
    </style>
</head>
<body>
<h1>작성</h1>
<form action="memoAdd_ok.jsp" method="post">
    <table>
        <caption>내용추가 테이블</caption>
        <colgroup>
            <col width="100px"/>
            <col width="*"/>
        </colgroup>
        <tbody>
        <tr>
            <th><label for="writer">글쓴이</label></th>
            <td><input type="text" id="writer" name="writer"/></td>
        </tr>
        <tr>
            <th><label for="content">내용</label></th>
            <td><textarea rows="5" cols="45" id="content" name="content"></textarea></td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">
<%--               요청자의 사용자의 IP값--%>
                <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/>
                <input type="button" value="저장" id="btn" onclick="sendData(this.form)"/>
        </tr>
        </tfoot>
    </table>
</form>

<script type="text/javascript">
    function sendData(frm) {
        var writer = frm.writer.value;
        var content = frm.content.value;
        if(writer.trim().length <1){
            alert("글쓴이를 입력하세요");
            frm.writer.focus();
            return;
        }
        if(content.trim().length <1){
            alert("내용을 입력하세요");
            frm.content.focus();
            return;
        }
        frm.submit();
    }
</script>
</body>
</html>