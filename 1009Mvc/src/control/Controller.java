package control;

import model.Action;
import model.indexAction;
import model.loginAction;
import model.logoutAction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

		String viewPath = null;
		Action action = null;
		if(type == null || type.equals("main") || type.equalsIgnoreCase("index"))
			action = new indexAction();
		else if(type.equals("login"))
			action = new loginAction();
		else if(type.equalsIgnoreCase("logout"))
			action = new logoutAction();

		//IndexAction이 수행되었다면 "/jsp/index.jsp"
		viewPath = action.execute(request, response);

		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
