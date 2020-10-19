package bbs.action;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.xpath.internal.functions.FuncStartsWith;
import com.sun.tools.internal.xjc.model.CDefaultValue;
import com.sun.xml.internal.ws.wsdl.writer.document.StartWithExtensionsType;
import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class editAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 요청한 contentType을 얻어낸다.
        String c_type = request.getContentType();// get방식은 null, post방식은 application....,
        //파일첨부시 multipart....
        String viewPath = null;
        // POST방식으로 요청되었을 때와 multipart로 요청되었을 때를 구별하여
        // 뷰 페이지를 또는 작업을 다르게 해야 한다.
        if(c_type.startsWith("application")) {
            // POST방식으로 요청된 경우
            String b_idx = request.getParameter("b_idx");
            BbsVO vo = BbsDAO.getBbs(b_idx);
            if(vo != null)
                request.setAttribute("vo", vo);// edit.jsp에서 표현하기 위해 저장!!!

            viewPath = "/bbs/edit.jsp";
        }else if(c_type.startsWith("multipart")) {
            //파일 첨부된 폼에서 요청시

            //첨부파일이 저장될 위치를 절대 경로로 만들어야한다.
            ServletContext application = request.getServletContext();
            try{
                String path = application.getRealPath("/bbs_upload");

                MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());

                //파라미터 받기
                //b_idx(기본키)가 없으면 수정 불가
                String b_idx = mr.getParameter("b_idx");
                //Controller?tpye=view로 보내기 위해서 필요
                String cPage = mr.getParameter("cPage");
                String subject = mr.getParameter("subject");
                String writer = mr.getParameter("writer");
                String content = mr.getParameter("content");

                //첨부파일이 있었는지 확인
                File file = mr.getFile("file");
                String fname = null;

                if(file != null)
                    //동일한 파일명이 있었다면 파일명이 변경되었을 수 있다.
                    fname = file.getName();

                String ip = request.getRemoteAddr();

                BbsDAO.editBbs(b_idx, subject, content, fname, ip);

                viewPath = "Controller?type=view&cPage="+cPage+"&b_idx="+b_idx;
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return viewPath;
    }

}
