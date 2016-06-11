<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="productEntity.*"%>
<jsp:useBean id="productManage" class="productEntity.productManage" scope="application"/>
<!-- scope:范围 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="search.do">
<input type="text" name="searchName" />
<input type="submit" value="search" >
</form>
</body>
</html>