package orderEntity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import database.database;

public class orderManage {
	private HashMap<String, order> orderList;

	public orderManage() {
		super();
	}
	/**
	 * 得到所有订单的列表
	 * 
	 * @return
	 */
	public HashMap getOrderList(String username) {
		HashMap orderList = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		order Order = null;
		try {
			conn = database.getConnection();
			String sql = "select * from shoppingcart where userid='"+username+"'";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				Order = new order(rset.getString("username"),
						rset.getString("pid"),rset.getString("ownerid"), rset.getInt("pnum"));
				System.out.println("one");
				orderList.put(rset.getString("username"), Order);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	
	public int addOrder(order newOrder) {
		int result = 0; //
		if (findOrder(newOrder)) {
			result = 1; //
		} else {
			String sql = "insert into shoppingcart(username,pid,ownername,pnum)values('"
					+ newOrder.getUserName()
					+ "','"
					+ newOrder.getPID()
					+ "','"
					+ newOrder.getOwnerName()
					+ "','"
					+ newOrder.getpNUM() + "')";

			if (database.update(sql)) {
				result = 2; //
			}
		}
		return result;
	}

	public boolean findOrder(order Order) {
		boolean result = false;
		String sql = "select * from shoppingcart where username=('"
				+ Order.getUserName() + "')";
		result = database.hasRecord(sql);
		return result;
	}

	public boolean deleteOrder(String username) {
		boolean result = false;
		String sql = "delete from shoppingcart where username=('" + username
				+ "')";
		result = database.delete(sql);
		System.out.println("delete user:" + sql);
		return result;
	}

	public order getOrder(String username) {
		String sql = "select * from shoppingcart where username=('" + username
				+ "')";
		order Order = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		try {
			conn = database.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				Order = new order(rset.getString("username"),
						rset.getString("pid"),rset.getString("ownername"), rset.getInt("pnum"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			database.clean(conn, stmt, rset);
		}
		return Order;
	}

	public int editUser(order Order) {
		int result = 1;
		String sql = "update shoppingcart set username ='" + Order.getUserName()
				+ "',pid='" + Order.getPID() + "',ownername='"
				+ Order.getOwnerName() + "' " + "',pnum='"
				+ Order.getpNUM() + "' " + "where username=('"
				+ Order.getUserName() + "')";
		//System.out.println("edit user:" + sql);
		if (database.update(sql)) {
			result = 2; 
		}

		return result;
	}

	
}
