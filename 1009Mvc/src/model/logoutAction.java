package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logoutAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        //httpSession을 구한 후 그 안에 저장된 값들 중
        //이름이 "vo"인 정보를 삭제한다.

        HttpSession session = request.getSession();
        session.removeAttribute("vo");

        request.setAttribute("login_check", false);
        return "/jsp/index.jsp";
    }
}
