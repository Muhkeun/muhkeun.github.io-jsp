package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class indexAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        //로그인 여부 확인
        //로그인을 했다면 session에 vo라는 이름으로 저장이 되어있다.
        //HttpSession을 얻어낸다.
        HttpSession session = request.getSession();

        //vo라는 이름으로 저장된 객체를 얻어낸다.
        Object obj = session.getAttribute("vo");

        boolean loginCheck = false;
        //로그인이 안되었을 때
        if (obj != null) {
            loginCheck = true;
        }

        request.setAttribute("login_check", loginCheck);
        return "/jsp/index.jsp";
    }
}