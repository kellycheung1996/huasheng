<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="productEntity.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>购物车</title>
    <script language="javascript">
	    function delcfm() {
	        if (!confirm("确认要删除？")) {
	            window.event.returnValue = false;
	        }
	    }
	    function purchase() {
	        if (!confirm("确认要购买？")) {
	            window.event.returnValue = false;
	        }
	    }
	    function abc()
	    {	
	    	<%
	        
	        String use=(String)session.getAttribute("user");
	                   if(use==null)
	                	  out.println("alert('请先登录！');");
	        %>         
	       
	    }
   </script>
  </head>
  
  <body>
  
   <h1>我的购物车</h1>
   <hr> 
   <div id="shopping">		
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
					<th>商品价格</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<% 
				   if(request.getSession().getAttribute("cart")!=null)
				   {
				%>
			
				     <% 
				         cart Cart = (cart)request.getSession().getAttribute("cart");
				         HashMap<product,Integer> goods = Cart.getGoods();
				         Set<product> items = goods.keySet();
				         Iterator<product> it = items.iterator();     
				         while(it.hasNext())
				         {
				        	 product i = it.next();
				     %> 
				<tr>
					<td><img src="imagea/<%=i.getURL()%>" />
					<a href=""><%=i.getProductName()%></a></td>
					<td><%=i.getPrice() %></td>
					<td>
						<span><%=i.getPrice()*goods.get(i) %></span>
						<input type="hidden" value="" />
					</td>
					<td class="number">
                     	<%=goods.get(i)%>					
					</td>                        
                    <td>
					      
            <form method="Post" action="deletee">
            <p><input type="hidden" value="<%=i.getProductID()%>" name="goodid"></p>
            <p><input type="hidden" value="<%=goods.get(i)%>" name="number"></p>
			<input type="submit" onClick="delcfm()" value="删除"></input>
		    </form>
		    <form method="Post" action="buy">
		    <p><input type="hidden" value="<%=i.getProductID()%>" name="goodid"></p>
            <p><input type="hidden" value="<%=goods.get(i)%>" name="number"></p>
            <p><input type="hidden" value="<%=i.getURL()%>" name="picture"></p>
            <p><input type="hidden" value="<%=i.getProductName()%>" name="goodname"></p>
            <input type="submit" onClick="abc()" value="立即购买"></input>
            </form>	       
			</td>
				</tr>
				     <% 
				         }
				     %>		
			</table>
			<span id="total">总价：<%=Cart.getTotalPrice() %>￥</span>
			  <% 
			    }
			 %>
	</div>
  </body>
</html>