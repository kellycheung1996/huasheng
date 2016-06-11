package userEntity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import database.database;

public class userManage {
	private HashMap<String, user> userList;

	public userManage() {
		super();
	}

	/**
	 * 得到所有用户的列表
	 * 
	 * @return
	 */
	public HashMap getUserList() {
		HashMap userList = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		user user = null;
		try {
			conn = database.getConnection();
			String sql = "select * from user";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				user = new user(rset.getString("username"), "888888",
						rset.getString("realname"), rset.getInt("userType"),
						rset.getInt("sex"));
				System.out.println("one");
				userList.put(rset.getString("username"), user);
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
		return userList;
	}

	public int addUser(user newUser) {
		int result = 0; //
		if (findUser(newUser)) {
			result = 1; //
		} else {
			String sql = "insert into user(username,password,realname,userType,sex)values('"
					+ newUser.getUsername()
					+ "','"
					+ newUser.getPassword()
					+ "','"
					+ newUser.getRealname()
					+ "','"
					+ newUser.getUserType() + "','" + newUser.getSex() + "')";

			if (database.update(sql)) {
				result = 2; //
			}
		}
		return result;
	}

	public boolean findUser(user user) {
		boolean result = false;
		String sql = "select * from user where username=('"
				+ user.getUsername() + "')";
		result = database.hasRecord(sql);
		return result;
	}

	public boolean deleteUser(String username) {
		boolean result = false;
		String sql = "delete from user where username=('" + username
				+ "')";
		result = database.delete(sql);
		System.out.println("delete user:" + sql);
		return result;
	}

	public user getUser(String userid) {
		String sql = "select * from user where userid=('" + userid
				+ "')";
		user user = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		try {
			conn = database.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				user = new user(rset.getString("username"),
						rset.getString("password"), rset.getString("realname"),
						rset.getInt("userType"), rset.getInt("sex"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			database.clean(conn, stmt, rset);
		}
		return user;
	}

	public int editUser(user user) {
		int result = 1;
		String sql = "update user set username ='" + user.getUsername()
				+ "',realname='" + user.getRealname() + "',userType='"
				+ user.getUserType() + "' " + "where username=('"
				+ user.getUsername() + "')";
		//System.out.println("edit user:" + sql);
		if (database.update(sql)) {
			result = 2; 
		}

		return result;
	}

	public int verifyUser(String username, String password) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		int result = -1;// 用户名密码不对
		try {
			conn = database.getConnection();
			String sql = "select * from user where username='" + username
					+ "' and password='" + password + "'";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if (rset.next()) {
				result = rset.getInt("userType");
			}
		} catch (SQLException e) {
			System.out.println("SQLException inside verify user");
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
		return result;
	}

}
