package model;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionListener;

public class loginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String path = "/jsp/login.jsp";

        //사용자의 요청방법에 따라 구분
        //=> post 방식일 때만 알아내보자
        if(request.getMethod().equalsIgnoreCase("post")){
            //id와 pw를 받아서 MyBatis 환경을 이용하여 인증을 확인한다.
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");

            //정확한 정보일 때 (vo가 null이 아닐 때)
            // => HttpSession에 vo 객체를 "vo" 라는 이름으로 저장
            MemVO mvo = MemberDAO.login(id, pw);
            if(mvo != null){
                HttpSession session = request.getSession();
                session.setAttribute("vo",mvo);

                //request에 "login_check" 라는 이름으로 true를 저장한다.
                request.setAttribute("login_check", true);
            }
            path ="/jsp/index.jsp";
        }
        return path;
    }
}
