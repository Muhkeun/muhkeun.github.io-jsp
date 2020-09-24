<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: muhkeun
  Date: 2020/09/24
  Time: 11:35 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //한글 요청 처리
    request.setCharacterEncoding("utf-8");

    //전달되어 오는 파라미터 받기
    String cPath = request.getParameter("cPath");
    String folderName = request.getParameter("f_name");

    //위의 값들을 연결하여 절대경로화 시킨다.
    String path = application.getRealPath("/members/" + cPath + "/" + folderName);

    //위의 절대 경로를 가지고 File 객체를 생성
    File file = new File(path);


    //1.파일 읽기 준비
    if(file.exists()){

        //2kb 짜리 배열을 만들어야한다.
        byte [] buf = new byte[2048];

        //배열에 담은 수를 기억하는 변수
        int size = 0;

        //다운로드에 필요한 Stream을 생성
        BufferedInputStream bufferedInputStream = null;
        FileInputStream fileInputStream = null;

        //클라이언트 pc에 저장하기 위한 Stream
        BufferedOutputStream bufferedOutputStream = null;

        //다운로드를 한다는 것은 JSP 입장에서 응답을 하는 것
        //접속자 pc로 다운로드를 시켜야하기 때문에 response를 통해 stream을 생성해야 한다.
        //=> ServletOutputStream
        ServletOutputStream servletOutputStream = null;

        try {
            //접속자 화면에 다운로드 창을 띄워줌
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment;filename=" +
                new String(folderName.getBytes(), "8859_1"));

            fileInputStream = new FileInputStream(file);
            bufferedInputStream = new BufferedInputStream(fileInputStream);

            //response를 통해 이미 out이라는 생성된 Stream이 존재하기 때문에 오류가 발생
            // => 잠깐 지워줘야한다.
            out.clear();
            out = pageContext.pushBody();

            servletOutputStream = response.getOutputStream();
            bufferedOutputStream = new BufferedOutputStream(servletOutputStream);

            while ((size = bufferedInputStream.read(buf)) != -1){
                //inputStream으로부터 읽은 수만큼만 쓰기를 수행한다.
                bufferedOutputStream.write(buf, 0, size);
                bufferedOutputStream.flush();
            }


        }catch (Exception e){
            e.printStackTrace();

        }finally {
            try {
                if(fileInputStream != null){
                    fileInputStream.close();
                }
                if(bufferedInputStream != null){
                    bufferedInputStream.close();
                }
                if(servletOutputStream != null){
                    servletOutputStream.close();
                }
                if(bufferedOutputStream != null){
                    bufferedOutputStream.close();
                }

            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
