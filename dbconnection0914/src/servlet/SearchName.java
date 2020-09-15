package servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import vo.EmpVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

@WebServlet("/SearchName")
public class SearchName extends HttpServlet {
    SqlSessionFactory factory;
    public SearchName(){
//        한번만 수행하는 factory를 얻는다
        try{
            Reader r = Resources.getResourceAsReader("config/config.xml");

            //SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
            //factory = builder.build(r);
            factory = new SqlSessionFactoryBuilder().build(r);

            r.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        response.setContentType("text/html; charset=utf-8" );

//       요청시 파라미터 받기
        String s_name = request.getParameter("s_name");

//      위에서 받은 파라미터를 Mybatis의 Mapper를 호출하면서 파라미터로 전달한다.
//        우선 Mapper를 호출하기 위해 SqlSession이 필요하다.
        SqlSession ss = factory.openSession();

        List<EmpVO> list =   ss.selectList("emp.search_name",s_name);

        PrintWriter out = response.getWriter();

        //HTML로 응답하기
        out.println("<table border = '1'>");
        out.println("<tbody>");
        for(int i = 0; i< list.size(); i ++){
            EmpVO vo = list.get(i);
            out.println("<tr>");
            out.println("<td>" + vo.getEmpno() + "</td>");
            out.println("<td>" + vo.getEname() + "</td>");
            out.println("<td>" + vo.getJob() + "</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("<table>");

        out.close();
    }
}
