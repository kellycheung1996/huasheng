<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="productEntity.*"%>
<%@page import="userEntity.*"%>
<jsp:useBean id="productManage" class="productEntity.productManage" scope="application"/>
<jsp:useBean id="userManage" class="userEntity.userManage" scope="application"/>

      <!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>second-hand pc</title>
    <style type="text/css">
        .wrap{margin:0 auto;width:1200px;}
        span{color:grey;font-size:10px}
        a.shapea:link{font-size:0.3em;color:#C90F12;font-family:"Microsoft Yahei";text-decoration:none;}
        a.shapea:hover{color:red;font-family:"Microsoft Yahei";text-decoration:underline;}
        a.shapec:link{font-size:0.5em;color:black;font-family:"Microsoft Yahei";text-decoration:none;}
        a.shapec:hover{color:#616161;font-family:"Microsoft Yahei";text-decoration:underline;}
        shapeb{font-family:"Microsoft Yahei";font-size:0.4em;}
        shaped{font-family:"宋体";font-size:0.2em;}
        a.fontbt:link{font-size:0.4em;color:black;font-family:"Microsoft Yahei";text-decoration:none;}
        a.fontbt:hover{color:grey;font-family:"Microsoft Yahei";text-decoration:underline;}
        a.classify:link{font-size:0.2em;color:grey;font-family: "Microsoft Yahei";text-decoration:none;}
        a.classify:hover{color:lightgrey;font-family:"Microsoft Yahei";text-decoration:underline;}
        body{margin:0;padding:0}
        .header{height:50px;width:1200px;background:#F0F0F0}
        .second{width:1200px;background:floralwhite;}
        .classify1{width:320px;height:50px;background:navajowhite;float:left;font-family:"宋体";}
        .classify2{width:880px;height:50px;background:#E0191D;float:right}
        .classifysheet{background:floralwhite; border: 4px solid #E0191D;clear:both;float:left;width:320px;}
        .product1{width:200px;clear:both;}
        .note{width:5px;height:30px;background:#E0191D;float:left;}
        .note2{width:130px;height:5px;background:#E0191D;float:left;}
        .pro1{width:180px;background:white;font-size: 12px;color: darkslategrey;float:left;margin-right: 50px;}
        .photolist{float:left;margin-right: 20px}
        .recommend{clear:both}
        .judge{float:left;margin-right: 20px}
        .promo{float:left;}
        .promotion{float:left}
        .selloperate{margin-right: 20px;margin-left: 20px;}
        .product{margin-top: 20px}
        .picture{width:600px;height:400px;margin-left: 20px;float:left;text-align:center}
        .productmessage{float:left;width:350px; height:400px; margin-left: 20px;background-color: navajowhite}
        .producttitle{text-align:center ;width:100%}
        pricetag{text-align:center;color:orangered;font-size:24px;font-weight:bold;}
        buy{border:30px solid  orangered ;background-color: orangered;width:200px;text-align:center ;}
        .message{clear:both;}
        #logoa a{ display:block;  width:300px;  height:200px;  cursor:hand;}
        #logob a{ display:block;  width:300px;  height:200px;  cursor:hand;}
    </style>
</head>
<body>


<div class="wrap">
    <div class="header">
        <form action="save.php" method="post" >
            <label><strong>&nbsp&nbsp您的城市</strong><img src="imagea/lamb.png"></label>
            <select>
                <option value="北京">北京</option>
                <option value="长沙" selected="selected">长沙</option>
                <option value="重庆">重庆</option>
                <option value="海南">海南</option>
                <option value="浙江">浙江</option>
                <option value="天津">天津</option>
                <option value="合肥">合肥</option>
                <option value="上海">上海</option>
                <option value="其他">其他</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapea" href="#" target="_blank">登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapea" href="#" target="_blank">注册</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapea" href="#" target="_blank">收藏本页</a>>
            &nbsp;&nbsp;
            <strong><a class="shapec" href="https://hao.360.cn/?src=bm" target="_blank" style="color:#530F10;">搜宝贝</a></strong>
            <input type="text"  name="username" id="username" value="" />
            <img src="imagea/search.png"; width="25" height="25" >
        </form>
        <hr />
    </div>
    <div class="second">
        <div class="classify1"><br /><shapec>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a class="shapec" href="#" target="_blank">全场商品分类</a></strong></div>
        <div class="classify2"><br />
            &nbsp;&nbsp;
            <a class="shapec" href="#" target="_blank">首页</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapec" href="#" target="_blank">电脑二手</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapec" href="#" target="_blank">配件二手</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapec" href="#" target="_blank">二手特惠</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
            <a class="shapec" href="#" target="_blank">今日最新</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapec" href="#" target="_blank">智能生活</a>
        </div>
    </div>
<% 
   product products=new product();
   products= productManage.getProduct((String)request.getAttribute("productid"));
   user User=new user();
   User=userManage.getUser((String)request.getAttribute("username"));

%>
    <div class="product">
    <div class="picture">
        <img src="imagea/<%=products.getURL() %>" >
    </div>
    <div class="productmessage">
        <div class="producttitle">
            <p><strong><%=products.getProductName() %></strong></p>
        </div>
        <p>转卖价：&nbsp&nbsp<pricetag>$<%=products.getPrice() %></pricetag></p>
        <hr style=" height:1px;border:none;border-top:1px solid gray" />
        <p>所在地：&nbsp&nbsp<%=products.getCity() %></p>
        <p>交易方式：&nbsp&nbsp在线交易</p>
        <br />
        <br />
        
        <form method="post" action="addshoppingcart.do" >
            <input type="text" id="num" value="" name="num">
            <input type="hidden" value="<%=products.getuserID()%>" name="ownerid" height=0 width=0>
            <input type="hidden" value="<%=products.getProductID()%>" name="productid" height=0 width=0>
            <input type="hidden" value="<%=request.getAttribute("userid") %>" name="userid" height=0; width=0>
            <input type="submit" value="加入购物车">
        </form>
    </div>
    </div>

    <div class="message">
        <hr style=" height:1px;border:none;border-top:1px solid gray" />
        <message>&nbsp;&nbsp;&nbsp;商品描述&nbsp;&nbsp;&nbsp;</message>
        <br />
        <p><%=products.getDisc() %></p>
        <message>&nbsp;&nbsp;&nbsp;留言&nbsp;&nbsp;&nbsp;</message>
        <br />
        <br />
        <br />
        <textarea cols="40" rows="3">在这里输入内容...</textarea>
        <br />
        <br />
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="submit" value="确定"  name="submit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="reset" value="重置"  name="reset" />
    </div>
</div>
</body>
</html>         