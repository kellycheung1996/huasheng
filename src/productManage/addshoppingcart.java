package productManage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import productEntity.cart;
import productEntity.product;
import productEntity.productManage;
import userEntity.userManage;
import orderEntity.order;
import orderEntity.orderManage;
public class addshoppingcart  extends HttpServlet { 
	private productManage productMgr=new productManage();
	private static final String NULL = null;
	public addshoppingcart () {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			processRequest(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, SQLException {
		response.setContentType("text/html"); 
		String productid = request.getParameter("productid");//获得商品编号
		String userid = request.getParameter("userid");
	    String ownerid=request.getParameter("ownerid");
	    String num = request.getParameter("num");
		HttpSession session = request.getSession();
		String lists="";
        Cookie[] cookies = request.getCookies();
        if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)//遍历cookie
            {
                if(c.getName().equals("ListViewCookie"))
                {
                   lists = c.getValue();
                }
            }
        }
        lists+=request.getParameter("productid")+",";
        Cookie cookie = new Cookie("ListViewCookie",lists);
        response.addCookie(cookie); 
        if(userid!=null)
        {
        	order Order=new order(userid,productid,ownerid,Integer.parseInt(num));
        	orderManage orderMgr=new orderManage();
        	orderMgr.addOrder(Order);
        }
        if(addToCart(request,response))
		{
        	request.getRequestDispatcher("addsuccess.jsp").forward(request, response);
		}
        else
        {
        	request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}
	private boolean addToCart(HttpServletRequest request, HttpServletResponse response)
	{
		String productid = request.getParameter("productid");
		String num = request.getParameter("num");
		product item = productMgr.getProduct(productid);	//获得商品对象
		if(request.getSession().getAttribute("cart")==null)//如果购物车不存在，则创建cart购物车
		{
			cart Cart = new cart();
			request.getSession().setAttribute("cart",Cart);
		}
		cart Cart = (cart)request.getSession().getAttribute("cart");
		if(Cart.addGoodsInCart(item,Integer.parseInt(num)))
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
	/**
	 * The doPost method of than servlet. <br>
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
		try {
			processRequest(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
