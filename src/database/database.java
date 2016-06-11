package database;

import java.sql.*;

public class database {	
	/**
	 * �������ݿ�����
	 * @return
	 */
	public static Connection getConnection() { 
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/huasheng?user=root&password=4281&useUnicode=true&characterEncoding=utf-8";
			conn = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * �ر����ݿ�����ӡ�����Լ����������Դ
	 * @param conn
	 * @param stmt
	 * @param rset
	 */

	public static void clean(Connection conn,Statement stmt, ResultSet rset) {
		try{
			if(rset != null)
				rset.close();
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * ����Ƿ��������SQL���ļ�¼���ڴ������û�ʱ���ڼ���û����Ƿ��Ѵ���
	 * @param SqlString
	 * @return
	 */

	public static boolean hasRecord(String SqlString) {
		boolean result = false;
		Connection conn = null;
    	Statement stmt = null;
    	ResultSet rset = null;
    	try {
    		conn = getConnection();
			stmt = conn.createStatement();			
		    rset = stmt.executeQuery(SqlString);
		    while(rset.next()){
		    	result = true;
		    }
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally{
			clean(conn,stmt,rset);
		}
		return result;
	}
	
	/**
	 * ��ִ��ѯ��䣬���ؽ����
	 * @param SqlString
	 * @return
	 */
	public static ResultSet query(String SqlString) {
		Connection conn = null;
    	Statement stmt = null;
    	ResultSet rset = null;
    	try {
    		conn = getConnection();
			stmt = conn.createStatement();			
		    rset = stmt.executeQuery(SqlString);		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		} finally{
			clean(conn,stmt,rset);
		}
		return rset;
	}
	
	/**
	 * �������ݿ��¼
	 * @param sql
	 * @return
	 */
	public static boolean update(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		return result;
	}
	
	/**
	 * ɾ�����ݿ��¼
	 * @param sql
	 * @return
	 */
	public static boolean delete(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.execute(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		return result;
	}

}
