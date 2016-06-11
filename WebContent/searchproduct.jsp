<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="productEntity.*"%>
<jsp:useBean id="productManage" class="productEntity.productManage" scope="application"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
	 java.util.HashMap<String,product> productmap = new java.util.HashMap<String,product>();
	 productmap = productManage.getProductListfromsolr((String)request.getAttribute("searchName"));
	 java.util.Iterator iterator = productmap.keySet().iterator();
	         while(iterator.hasNext()){
		       product products = (product)productmap.get(iterator.next());
%>
                    
                    <div class="photolist">
                   <form method="get" action="product.do">
                   <input type="hidden" value="<%=products.getProductID()%>" name="productid" height=0 width=0>
                    <INPUT id=Submit style="CURSOR: hand" 
                              type=image height=150 width=120 
                              src="imagea/<%=products.getURL()%>" border=0 
                              name=Submit>
                  
                    
             
                    <p><shaped><%=products.getProductName()%>#</shaped></p>
                     </form>
                    </div>
                   
                    <%
  	                    }
                    %>
</body>
</html>