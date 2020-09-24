<%@ page import="java.io.File" %>
<%@ page import="mybatis.vo.MemberVO" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/22
  Time: 3:08 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    //선언문은 멤버 변수 멤버 메서드를 정의할 때 사용

    //개인이 사용한 용량을 측정하는 메소드
    //file만 용량을 얻을 수 있으며 folder는 용량을 구하지 못한다.
    //=> 안에 존재하는 파일들의 용량을 모두 더해서 표현(재귀호출)

    public int useSize(File file){
        //인자로 전달된 file은 폴더여야 한다. 이 폴더의 하위 요소들의 file용량을
        //모두 더해서 반환

        //폴더 안에 있는 모든 하위 요소들을 얻어낸다.
        File [] FileList = file.listFiles();

        //file들의 용량을 저장할 곳
        int size = 0;

        //하위 요소들 (list)중 파일이 아닌 것들은 현재 메서드인 useSize()를 다시 호출한다.
        for(File sf : FileList){

            if(sf.isFile())
                //파일일 경우 용량을 size에 누적시킨다.
                size += sf.length();
            else
                size += useSize(sf);
        }
        return size;
    }
%>

<%
    int totalSize = 1024*1024*10;
    int useSize = 0;

    //현재 페이지는 무조건 로그인이 되어 있어야 사용할 수 있는 페이지다.
    //로그인 여부를 확인
    Object obj = session.getAttribute("uvo");

    if(obj != null){

        request.setCharacterEncoding("utf-8");

        //현재 위치 값 (cPath)를 받는다.
        String dir = request.getParameter("cPath");
        //만약 파라미터가 없다며 dir에는 null이 들어갑니다. 있다면 사용자가 있었던 위치

        //사용자가 폴더를 선택할 경우 f_name이라는 파라미터 또한 넘어온다.
        String fName = request.getParameter("f_name");

        //로그인한 회원의 id값을 얻어내기 위해 obj를 MemVO로 형변환
        MemberVO mvo = (MemberVO)obj;

        //로그인한 회원의 id로된 폴더를 절대 경로화 시켜서 저장할 곳 (홈디렉토리)
        String path = null;

        //만약 dir이 null이 아니면 홈디렉토리로 설정하지 않는다.
        if(dir == null){
            path = application.getRealPath("/members/" + mvo.getM_id());
            //사용용량 측정
            useSize = useSize(new File(path));

            //현재 위치값을 사용자의 id로 설정
            dir = mvo.getM_id();
        }else{
            //사용자가 특정 폴더를 클릭했을 때 수행하는 부분
            if(fName != null && fName.trim().length() > 0){
                dir = dir + "/" + fName;
            }
            path = application.getRealPath("/members/" + dir);
        }

        //사용자가 파일을 원하는 곳에 저장하기 위해서는 upload.jsp에서
        //multipartRequest가 생성되기 전에 파일을 저장할 현재 위치값을 파라미터로 받아서는 안된다.
        //그래서 이쯤에서 HttpSession에서 현재 위치 값을 저장해 둬야 upload.jsp에서
        //파라미터로 받지 않고 현재 위치 값을 얻을 수 있다.
        session.setAttribute("cPath", dir);
%>
<!Doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        table{
            width: 600px;
            border: 1px solid #27a;
            border-collapse: collapse;
        }
        table th, table td{
            border: 1px solid #27a;
            padding: 4px;
        }
        table th{ background-color: #bcbcbc; }
        .title { background-color: #bcbcbc; width: 25%; }

        .btn{
            display: inline-block;
            width: 70px;
            height: 20px;
            text-align: center;
            padding:0px;
            margin-right: 20px;
        }
        .btn a{
            display: block;
            width: 100%;
            padding: 4px;
            height: 20px;
            line-height: 20px;
            background: #27a;
            color: #fff;
            border-radius: 3px;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
        }
        .btn a:hover{
            background: #fff;
            color: #27a;
            border: 1px solid #27a;
        }

        #f_win{
            width: 220px;
            height: 80px;
            padding: 20px;
            border: 1px solid #27a;
            border-radius: 8px;
            background-color: #efefef;
            text-align: center;
            position: absolute;
            top: 150px;
            left: 250px;
            display: none;
        }
        #f_win2{
            width: 300px;
            height: 80px;
            padding: 20px;
            border: 1px solid #27a;
            border-radius: 8px;
            background-color: #efefef;
            text-align: center;
            position: absolute;
            top: 150px;
            left: 250px;
            display: none;
        }
    </style>
</head>
<body>
<h1>My Disk service</h1>
<hr/><%=mvo.getM_name()%>
(<span class="m_id"><%=mvo.getM_id()%></span>)님의 디스크
&nbsp;[<a href="javascript:home()">Home</a>]
<hr/>

<table summary="사용량을 표시하는 테이블">
    <tbody>
    <tr>
        <th class="title">전체용량</th>
        <td><%=totalSize/1024%>KB</td>
    </tr>
    <tr>
        <th class="title">사용량</th>
        <td><%=useSize/1024%>KB</td>
    </tr>
    <tr>
        <th class="title">남은용량</th>
        <td><%=(totalSize-useSize)/1024%>KB</td>
    </tr>
    </tbody>
</table>
<hr/>
<div id="btn_area">
    <p class="btn">
        <a href="javascript:selectFile()">
            파일올리기
        </a>
    </p>
    <p class="btn">
        <a href="javascript:makeFolder()">

            폴더생성
        </a>
    </p>
    <p class="btn">
        <a href="javascript:exe()">
            파일생성
        </a>
    </p>
</div>
<hr/>

<label for="dir">현재위치:</label>
<span id="dir"><%=dir%></span>

<table summary="폴더의 내용을 표현하는 테이블">
    <colgroup>
        <col width="50px"/>
        <col width="*"/>
        <col width="80px"/>
    </colgroup>
    <thead>
    <tr>
        <th>구분</th>
        <th>폴더 및 파일명</th>
        <th>삭제여부</th>
    </tr>
    </thead>
    <tbody>
    <%
        //상위로 라는 기능은 현재위치(dir)가 해당 사용자의 id와 다를 때만 나타나야 한다.
        if(!dir.equals(mvo.getM_id())){
            int idx = dir.lastIndexOf("/");
            String up_path = dir.substring(0,idx);
    %>
    <tr>
        <td>↑</td>
        <td colspan="2">
            <a href="javascript:goUp('<%=up_path%>')">
                상위로...
            </a>
        </td>
    </tr>
    <%
        }

        // 1.현재위치(dir)값을 가지고 절대경로를 얻어낸다.
        String c_path = application.getRealPath("/members/"+dir);

        // 2. 위에서 얻은 절대경로를 가지고 File객체를 생성한다.
        //    (File객체로 디렉토리인지를 판단하여 하위 내용들을 모두 가져오기 위해서다.)
        File s_file = new File(c_path);

        // 3. 하위 요소들을 얻어내어 출력
        //String[] names = s_file.list();// 하위의 이름들만 받아낸다. 이렇게 하면 용량이나
        //파일인지? 폴더인지?를 판단하지 못한다.
        File[] sub_list = s_file.listFiles();

        for(File f : sub_list){
    %>
    <tr>
        <td>
            <% if(f.isFile()){ %>
            <img src="../images/file.png"/>
            <% }else{ //폴더일 경우 %>
            <img src="../images/folder.png"/>
            <% } %>
        </td>
        <td>
            <% if(f.isDirectory()){ %>
            <a href="javascript: gogo('<%=f.getName()%>')">
                <%=f.getName() %>
            </a>
            <% }else{ //파일일 경우엔 다운로드 기능을 부여한다. %>
            <a href="javascript:down('<%=f.getName()%>')">
                <%=f.getName() %>
            </a>
            <% } %>
        </td>
        <td></td>
    </tr>
    <%
        }//for의 끝
    %>
    </tbody>
</table>

<form name="ff" method="post">
    <%--         사용자가 클릭한 폴더명       --%>
    <input type="hidden" name="f_name"/>
    <%--       사용자가 있었던 현재 위치       --%>
    <input type="hidden" name="cPath" value="<%=dir%>"/>
</form>


<div id="f_win">
    <form action="makeFolder.jsp" method="post" name="frm">
        <input type="hidden" name="cPath" value="<%=dir%>"/>
        <label for="f_name">폴더명:</label>
        <input type="text" id="f_name" name="f_name"/><br/>
        <p class="btn">
            <a href="javascript:newFolder()">
                만들기
            </a>
        </p>
        <p class="btn">
            <a href="javascript:closeWin()">
                닫 기
            </a>
        </p>
    </form>
</div>


<div id="f_win2">
<%--    웹 상에서 파일을 첨부되는 form은 무조건
        enctype ="multipart/form-data"를 넣어줘야 한다.
        이렇게 되면 서버 쪽에서 request.getParameter()로 받을 수 없다. 반드시
        MultipartRequest라는 객체로 받아야 한다.
--%>
    <form action="upload.jsp" method="post" name="frm2"
          enctype="multipart/form-data">
        <%--현재 위치를파일과 함께 파라미터로 전달 해보기      --%>
        <input type="hidden" name="dir" value="<%=dir%>">
        <label for="selectFile">첨부파일:</label>
        <input type="file" id="selectFile"
               name="upload"/><br/>

        <p class="btn">
            <a href="javascript:upload()">
                보내기
            </a>
        </p>
        <p class="btn">
            <a href="javascript:closeWin2()">
                닫 기
            </a>
        </p>
    </form>
</div>
<script type="text/javascript">
function home(){
parent.location.href="../main.jsp";
}

function gogo(fname){
//현재 문서(document)에
// 이름이 ff인 form객체를 검색한다.
// 검색된 form객체 안에 이름이 fname인 요소의
//값으로 인자로 받은 폴더명을 넣어준다.
document.ff.f_name.value = fname;
document.ff.action = "myDisk.jsp";
document.ff.submit();
}

function goUp(upPath){
document.ff.cPath.value = upPath;
document.ff.action = "myDisk.jsp";
document.ff.submit();
}

function makeFolder(){
document.getElementById("f_win").style.display = "block";
}
function closeWin(){
document.getElementById("f_win").style.display = "none";
}

function newFolder(){
//사용자가 새로 만들 폴더명을 입력했는지 판단하자!
    var str = document.frm.f_name.value;

//정규표현식을 이용한 공백제거 작업

if(str.trim().length < 1){
alert("폴더명을 입력하세요");
document.frm.f_name.focus();
return;
}
document.frm.submit();//서버로 보낸다.(makeFolder.jsp)
}

function selectFile(){
//숨겨져 있던 div를 보여준다.
document.getElementById("f_win2").style.display = "block";
}

function upload(){
//선택된 파일의 값을 가져오자!
var select_f = document.frm2.upload.value;
//document.frm2.upload.value = "test.txt";
//위는 input type="file" 에서는 절대 허용되지 않는다.
//이유는 보안문제에 걸려 브라우저에서 막아뒀다.

//alert(select_f);
if(select_f.trim().length < 1){
alert("파일을 선택하세요!");
return;
}
document.frm2.submit();
}
function closeWin2(){
document.getElementById("f_win2").style.display = "none";
}

function down(fname){
//인자로 넘어온 파일명을 현재문서(document)에
//"ff"라는 폼안에 f_name이라는 이름을 가진 요소의
//value값으로 지정해야 한다.
document.ff.f_name.value = fname;
// cPath도 같이 있는 폼의 action을 변경하자!
document.ff.action = "download.jsp";

document.ff.submit();

document.ff.f_name.value = "";//돌아올 때 파일명이 있어서
//오류가 발생할 수 있어서 삭제함!
}

function exe(){
//현재 문서에 이름이 ff인 폼객체의 action을
// newFile.jsp로 변경하자!
document.ff.action = "newFile.jsp";
document.ff.submit();
}
</script>
</body>
</html>
<%
}else{
%>
<script>
    top.location.href="../index.jsp";
</script>
<%
    }
%>



