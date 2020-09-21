<%@ page import="java.util.List" %>
<%@ page import="mybatis.vo.MemoVO" %>
<%@ page import="mybatis.dao.MemoDAO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/21
  Time: 11:16 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>메모 목록</title>
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
        table thead tr:first-child{ line-height: 40px; }
        table thead td:last-child{ text-align: right; }
        table caption { text-indent: -9999px; height: 0; }

        .h70{
            line-height: 70px;
            height: 70px;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String type = request.getParameter("searchType");
    String value = request.getParameter("searchValue");

    List<MemoVO> list = MemoDAO.search(type, value);

%>
<h1>검색 결과</h1>
<table>
    <caption>메모목록 보기</caption>
    <colgroup>
        <col width="60px"/> <!-- 번호 -->
        <col width="*"/> <!-- 내용 -->
        <col width="100px"/> <!-- 글쓴이 -->
        <col width="100px"/> <!-- 글쓴날짜 -->
    </colgroup>
    <thead>
    <tr>
        <td colspan="2">
            <form action="memoSearch.jsp" method="post">
                <select id="searchType" name="searchType">
                    <option value="0">글쓴이</option>
                    <option value="1">내용</option>
                    <option value="2">날짜</option>
                </select>
                <input type="text" id="searchValue" name="searchValue"/>
                <input type="button" value="검색" onclick="search1(this.form)"/>
            </form>
        </td>
        <td colspan="2">
            <input type="button" value="추가" id="add_btn" onclick="goAdd()">
        </td>
    </tr>
    <tr>
        <th>번호</th>
        <th>내용</th>
        <th>글쓴이</th>
        <th>날짜</th>
    </tr>
    </thead>
    <tbody>
    <%
        //MemoDAO를 통해 목록 (List<MemoVO)> 통해 목록 가져오기

        if(list.size() >0){
            for(MemoVO vo: list){
    %>
    <tr>
        <td><%=vo.getIdx()%></td>
        <td><a href="memoView.jsp?idx=<%=vo.getIdx()%>">
            <%=vo.getContent()%>
        </a>
        </td>
        <td><%=vo.getWriter()%></td>
        <td><%=vo.getReg_date()%></td>
    </tr>

    <%
            //목록이 하나도 없는 경우
        }
    }else{
    %>
    <tr>
        <td colspan="4" class="h70">등록된 메모가 없습니다.</td>
    </tr>
    <%

        }
    %>


    </tbody>
</table>

<script type="text/javascript">
    function goAdd(){
        location.href = "memoAdd.jsp";
    }
    function search1(frm){
        var v1 = frm.searchValue.value;
        if(v1.trim().length < 1){
            alert("검색어를 입력해주세요.");
            v1 = "";
            frm.searchValue.focus();
            //frm.searchValue.focus();
            document.getElementById("searchValue").focus();
            return;
        }
        frm.submit();
    }
</script>
</body>
</html>