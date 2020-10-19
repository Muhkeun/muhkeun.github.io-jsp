package bbs.action;

import mybatis.dao.BbsDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String b_idx = request.getParameter("b_idx");
        String cPage = request.getParameter("cPage");

        BbsDAO.delBbs(b_idx);


        return "Controller?type=list&cPage="+cPage;
    }
}
