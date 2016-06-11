package productEntity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.SolrParams;

import database.database;
import productEntity.product;
public class productManage {
	
		private static final product Product = null;

		public productManage() {
			super();
		}

		/**
		 * 得到所有用户的列表
		 * 
		 * @return
		 */
		public static HashMap getProductList() {
			HashMap ProductList = new HashMap();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;
			product Product = null;
			try {
				conn = database.getConnection();
				String sql = "select * from product";
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				while (rset.next()) {
					Product = new product(rset.getString("pid"),rset.getString("userid"),rset.getString("pname"), rset.getString("ptitle"),
							rset.getString("pdic"), rset.getInt("pprice"),
							rset.getInt("clf"),rset.getString("picture"),rset.getString("city"),rset.getInt("number"));
					ProductList.put(rset.getInt("pid")+"", Product);
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
			return ProductList;
		}
		
		public static HashMap getProductListfromsolr(String param) throws SolrServerException {
			HashMap ProductList = new HashMap();
			String serverUrl = "http://localhost:8983/solr/core1"; 
			product Product = null;
			SolrServer solrServer = new HttpSolrServer(serverUrl);
			String[] str = new String[]{"pid:","pname:","city:"};
			String param2=new String();
			for(int i=0;i<param.length();i++)
			{	
				if(param.charAt(i)==' ')
				{
					param2+='\\';
				}
				param2+=param.charAt(i);
			}
			for(int i=0;i<3;i++)
			{
			String q=str[i]+"*"+param2+"*";
			System.out.println(q);
			SolrQuery solrQuery = new SolrQuery(q);
			//solrQuery.set("qt", "/search");   
			QueryResponse resp = solrServer.query(solrQuery);  
			SolrDocumentList hits = resp.getResults(); 
			for (SolrDocument doc : hits){
			//	String s=doc.getFieldValue("pid").toString();
				Product = new product(doc.getFieldValue("pid").toString(),
						doc.getFieldValue("userid").toString(),
						doc.getFieldValue("pname").toString(),
						doc.getFieldValue("ptitle").toString(),
						doc.getFieldValue("pdic").toString(), 
						Integer.parseInt(doc.getFieldValue("pprice").toString()),
						Integer.parseInt(doc.getFieldValue("clf").toString()),
						doc.getFieldValue("picture").toString(),
						doc.getFieldValue("city").toString(),
						Integer.parseInt(doc.getFieldValue("number").toString()));
				ProductList.put(doc.getFieldValue("pid")+"", Product);
				System.out.println(ProductList.size());
			 } 
			}
			return ProductList;
		}
		
		public int addProduct(product newUser) throws SQLException {
			int result = 0; //
			product NULL = null;
			if (findProduct(newUser.getProductID())!=NULL) {
				result = 1; //
			} else {
				String sql = "insert into product(powner,ppname,ptitle,pdic,pprice,clf)values('"
						+ newUser.getProductName()
						+ "','"
						+ newUser.getProductTitle()
						+ "','"
						+ newUser.getDisc()
						+ "','"
						+ newUser.getPrice() + "','" + newUser.getClf() + "')";

				if (database.update(sql)) {
					result = 2; //
				}
			}
			return result;
		}

		public  product findProduct(String Pno) throws SQLException {
			
			String sql = "select * from product where pname=('"
					+ Pno + "')";
			ResultSet rset = database.query(sql);
				product Product = new product(rset.getString(1),rset.getString(2),
						rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getInt(6),
						rset.getInt(7),rset.getString(8),
						rset.getString(9),rset.getInt(10));
			return Product;
		}

		public boolean deleteProduct(String Pname) {
			boolean result = false;
			String sql = "delete from product where pname=('" + Pname
					+ "')";
			result = database.delete(sql);
			System.out.println("delete product:" + sql);
			return result;
		}

		public  product getProduct(String productid) {
			String sql = "select * from product where pid='" + productid
					+ "'";
			product Product = null;
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;

			try {
				conn = database.getConnection();
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				int i = 0;
				while (rset.next()) {
					Product = new product(rset.getString("pid"),rset.getString("userid"),rset.getString("pname"), rset.getString("ptitle"),
							rset.getString("pdic"), rset.getInt("pprice"),
							rset.getInt("clf"),rset.getString("picture"),rset.getString("city"),rset.getInt("number"));

				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				database.clean(conn, stmt, rset);
			}
			return Product;
		}

		public int editProduct(product Product) {
			int result = 1;
			String sql = "update product set pname ='" + Product.getProductName()
					+ "',ptitle='" + Product.getProductTitle() + "',pdic='"
							+ Product.getDisc() + "',pprice='"
					+ Product.getPrice() + "' " + "where clf=('"
					+ Product.getClf() + "')";
			//System.out.println("edit user:" + sql);
			if (database.update(sql)) {
				result = 2; 
			}

			return result;
		}
		
	}


