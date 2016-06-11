package userManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userEntity.userManage;

public class Loogin extends HttpServlet { 

	/**
	 * Constructor of the object.
	 */
	public Loogin() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String username = request.getParameter("username");//����û���
		String password = request.getParameter("password");//�������
		HttpSession session = request.getSession();
		userManage userMgr = new userManage();
		int result = -2;
		result = userMgr.verifyUser(username, password);
		String priv = "" + result;
		switch (result) {
		case -2://
			request.getRequestDispatcher("/index.jsp?error=�������").forward(request, response);
			break;
		case -1://�û������������
			request.getRequestDispatcher("/index.jsp?error=�û�������").forward(request, response);
			break;
		case 1://��ͨ�û�
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			request.setAttribute("styles", username);
			request.getRequestDispatcher("frontpage.jsp").forward(request, response);
			break;
		case 2://����Ա�û�
			session.setAttribute("priv", priv);
			session.setAttribute("user", username);
			request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request,response);
		
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
