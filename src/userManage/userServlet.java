package userManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userEntity.user;
import userEntity.userManage;


public class userServlet extends HttpServlet { 

	/**
	 * Constructor of the object.
	 */
	public userServlet () {
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
			String operation = request.getParameter("operation");
			String username = request.getParameter("username");		
			HttpSession session = request.getSession();		
			userManage userMgr = new userManage();
			if(operation.equals("del")){
				if(userMgr.deleteUser(username)){
					request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
				}
				else{
					PrintWriter out = response.getWriter();
					out.println("<script> alert('É¾³ý²»³É¹¦');</script>");
				}
			}
			if(operation.equals("add")){
				String userType = request.getParameter("userType");
				String password=request.getParameter("password");
				String realname = request.getParameter("realname");
				String sex = request.getParameter("sex");
				//System.out.println("userType=" + userType);
				user user = new user(username,password,realname,Integer.parseInt(userType),Integer.parseInt(sex));
				if(userMgr.addUser(user) ==2){
					request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
				}
				else if(userMgr.addUser(user) ==1){
					PrintWriter out = response.getWriter();
					request.getRequestDispatcher("/admin/addUser.jsp").forward(request, response);
				}
			}
			if(operation.equals("edit")){
				String userType = request.getParameter("userType");
				String password=request.getParameter("password");
				String realname = request.getParameter("realname");
				String sex = request.getParameter("sex");
				System.out.println("username=" + username);
				user user = new user(username,password,realname,Integer.parseInt(userType),Integer.parseInt(sex));
				if(userMgr.editUser(user) ==2){
					request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
				}
				else if(userMgr.addUser(user) ==1){
					PrintWriter out = response.getWriter();
					request.getRequestDispatcher("/admin/editUser.jsp?username=" + username).forward(request, response);
				}
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
