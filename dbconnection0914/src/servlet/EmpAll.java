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

@WebServlet("/EmpAll")
public class EmpAll extends HttpServlet {
    SqlSessionFactory factory;
    public EmpAll() {
        try {
            Reader r = Resources.getResourceAsReader("config/config.xml");
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

          factory = builder.build(r);

            r.close();
        } catch(Exception e) {
            e.printStackTrace();

        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    //요청이 발생할 때마다 수행하는 곳
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //요청시 한글처리
        request.setCharacterEncoding("utf-8");

        //응답시 한글처리
        response.setContentType("text/html; charset=utf-8");

        //factory로부터 SqlSessetion 얻기
        SqlSession ss = factory.openSession();

        //sqlsession을 통해 원하는 SQL문장 호출
        //total이라는 SQL문은 "Select * from emp"이다.
        //여기서 발생하는 결과는 오로지 하나가 아니라 여러개의 행이 발생한다.
        //그래서 각 행마다 하나의 EmpVO가 생성되어 여러 개의 EmpVO가
        //List에 담겨서 온다.
        List <EmpVO> list = ss.selectList("emp.total");

        //응답을 위한 스트림 준비
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
