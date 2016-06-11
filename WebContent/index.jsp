<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="productEntity.*"%>
<jsp:useBean id="productManage" class="productEntity.productManage" scope="application"/>
<!-- scope:范围 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        a.classify:link{font-size:0.5em;color:grey;font-family: "Microsoft Yahei";text-decoration:none;}
        a.classify:hover{color:lightgrey;font-family:"Microsoft Yahei";text-decoration:underline;}
        body{margin:0;padding:0}
        .header{height:50px;width:1200px;background:#F0F0F0}
        .second{width:1200px;background:floralwhite;clear:both}
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
        #logoa { width:300px; height:200px;  background-image:url(images/picb.png);}
        #logoa a{ display:block;  width:300px;  height:200px;  cursor:hand;}
        #logob { width:290px; height:190px;  background-image:url(images/pica.png);}
        #logob a{ display:block;  width:300px;  height:200px;  cursor:hand;}
        .logo{float:left}
        .searchbox{width:520px;height:80px;margin:40px auto 0 auto;margin:40px;}
         
        .one{ border:#f00 3px solid;height:30px;line-height:30px;width:390px;padding:0 10px;float:left;}
        .one1{ background-color:#E0191D; float:left;border:0;height:36px;width:100px; color:#FFF; line-height:36px;text-align:center;overflow:hidden;}
        
    </style>
</head>

<body>
<div class="wrap">
    <div class="header">
        <form method="post" action="select.do">
            <label><strong>&nbsp&nbsp您的城市</strong><img src="imagea/lamb.png"></label>
             <select name="city" size=1>
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
             <input type="submit" id="submit"></input>
             <% String userid=(String)request.getAttribute("productid");%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%if(userid==null)
            {%>
            <a class="shapea" href="loogin.jsp" target="_blank">登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="shapea" href="register.jsp" target="register.jsp">注册</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <%
            }
            else
            {
            	out.print(userid);
            }
            %>
            <a class="shapea" href="shoppingcarts.jsp" target="_blank">购物车</a>
            <a class="shapea" href="#" target="_blank">收藏本页</a>>
            &nbsp;&nbsp;
            <strong><a class="shapec" href="https://hao.360.cn/?src=bm" target="_blank" style="color:#530F10;">搜宝贝</a></strong>
            <input type="text"  name="username" id="username" value="" />
            <img src="imagea/search.png" width="25" height="25" >
        </form>
        <hr />
    </div>
    <div class="logo&search">
       <div class="logo">
       <img src="imagea/logox.jpg">
       </div>
       <div class-"searchbox">
       <p><input type="text" value="" id="" class="one" placeholder="输入宝贝" /><button class="one1">搜索</button></p>
       </div>
    </div>
    <br />
    <div class="second">
        <div class="classify1"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a class="shapec" href="#" target="_blank">全场商品分类</a></strong></div>
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

    <div class="mainbody">
        <div class="classifysheet">
            <img src="imagea/macbook.png">&nbsp&nbsp&nbsp<a class="fontbt" href="#" target="_blank">笔记本</a>
            &nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">联想</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">戴尔</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">苹果</a>&nbsp
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            <img src="imagea/pc.png">&nbsp&nbsp&nbsp<a class="fontbt" href="#" target="_blank">台式机</a>
            &nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">显示器</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">主机</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">宏基</a>&nbsp
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            <img src="imagea/pad.png">&nbsp&nbsp<a class="fontbt" href="#" target="_blank">平板电脑</a>
            &nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">surface</a>&nbsp&nbsp<a class="classify" href="#" target="_blank">小米平板</a>&nbsp&nbsp<a class="classify" href="#" target="_blank">台电</a>&nbsp
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            <img src="imagea/mouse.png">&nbsp&nbsp<a class="fontbt" href="#" target="_blank">数码3C配件</a>
            &nbsp&nbsp<a class="classify" href="#" target="_blank">键盘</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">鼠标</a>&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">音响</a>&nbsp
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            <img src="imagea/headphones19.png">&nbsp&nbsp&nbsp<a class="fontbt" href="#" target="_blank">智能穿戴</a>
            &nbsp&nbsp<a class="classify" href="#" target="_blank">小米手环</a>&nbsp&nbsp<a class="classify" href="#" target="_blank">iwatch</a>&nbsp&nbsp<a class="classify" href="#" target="_blank">智能眼镜</a>&nbsp
            <br />
        </div>
        <div class="promotion">
            <table   background="http://image.hjbbs.com/img/200410/200410259222581234.jpg"  >
                <TD>
                    <EMBED plug inspage="http://www.macromedia.com/go/getflashplayer"
                           src="peanut.swf" width="650" height="270"
                           type=application/x-shockwave-flash  wmode="transparent"
                           quality="high"></EMBED></TD><td ></td></table>
        </div>
        <div class="selloperate">
            <p><img src="imagea/zm1.png" width="150" height="120"></p>
            <p><img src="imagea/zm3.png" width="150" height="120"></p>
        </div>
        <br />
        <div class="recommend">
            <div class="photolist">
                <br />
                <br />
                <br />
                <br />
                <img src="imagea/user.png" width="140" height="140">
            </div>
            <div class="judge">
            <form  method="post" action="save.php">
                <br />
                <br />
                <br />
                <br />
                <br />
                <p>Hi,身体力行</p>
                <p><strong>您可能感兴趣</strong></p>
            </form>
            </div>
            <div class="promo">
                <p class="product1">
                <p>&nbsp&nbsp&nbsp&nbsp<strong>猜你喜欢</strong></p>
                <div class="note2"></div>
                <hr style=" height:1px;border:none;border-top:2px solid gray" width="700"/>
                </p>
                
                   <%
	                   java.util.HashMap<String,product> productmap = new java.util.HashMap<String,product>();
	                   productManage pm=new  productManage();
	                   productmap = pm.getProductList();
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
                
            </div>
        </div>
        <div class="promo">
            <p class="product1">
                <br />
            <p><div class="note"></div>&nbsp&nbsp&nbsp&nbsp<strong>数码控.3C也性感</strong></p>
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            </p>
            <div class="pro1">
                <p>显示器&nbsp&nbsp&nbsp&nbsp内存&nbsp&nbsp&nbsp主板</p>
                <p>硬盘&nbsp&nbsp&nbsp&nbspCPU&nbsp&nbsp&nbsp&nbsp显卡</p>
                <p>无线路由器&nbsp&nbsp&nbsp&nbsp充电宝</p>
                <p>无线鼠标&nbsp&nbsp&nbsp&nbsp音响</p>
                <p>数据线&nbsp&nbsp&nbsp&nbsp</p>
            </div>
            <div class="photolist">
                <img src="imagea/pj1.jpg" height="150";width="120">
                <img src="imagea/pj2.jpg" height="150";width="120">
                <img src="imagea/pj3.jpg" height="150";width="120">
                <img src="imagea/pj4.jpg" height="150";width="120">
                <img src="imagea/pj5.jpg" height="150";width="120">
                <p><shaped>&nbsp&nbsp&nbsp&nbsp&nbsp#罗技无线鼠标#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#卡通造型音响#
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#apple&nbspmouse#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#联想T300#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    #便携音箱#</shaped></p>
            </div>
            <div class="photolist">
                <img src="imagea/1.jpg" height="50";width="10">
                <img src="imagea/2.jpg" height="50";width="10">
                <img src="imagea/3.jpg" height="50";width="10">
                <p><strong>戴上耳机，倾听</strong></p>
                <p><span>想要暂时告别千篇一律的生活，踏上没有</span></p>
                <p><span>目的的旅途？记得在行囊里捎上自己心爱的</span></p>
                <p><span>耳机和音乐，有了它们，一路上，不寂寞。</span></p>
            </div>
        </div>
        <div class="promo">
            <p class="product1">
                <br />
            <p><div class="note"></div>&nbsp&nbsp&nbsp&nbsp<strong>平板控.玩转高科技</strong></p>
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            </p>
            <div class="pro1">
                <p>surface&nbsp&nbsp&nbspipad&nbsp&nbspmini2</p>
                <p>台电科技&nbsp&nbsp&nbsp&nbsp双系统平板&nbsp&nbsp&nbsp&nbsp</p>
                <p>ipad air&nbsp&nbsp&nbsp&nbsp平板键盘</p>
                <p>平板保护套&nbsp&nbsp&nbsp&nbsp</p>
            </div>
            <div class="photolist">
                <img src="imagea/30.jpg" height="150";width="120">
                <img src="imagea/29.jpg" height="150";width="120">
                <img src="imagea/25.jpg" height="150";width="120">
                <img src="imagea/24.jpg" height="150";width="120">
                <img src="imagea/22.jpg" height="150";width="120">
                <p><shaped>&nbsp&nbsp&nbsp&nbsp&nbsp#99新ipad&nbspair4#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#surface&nbsppro#
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#ipad&nbspmini1甩卖#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#mini2尸体机#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    #2月9新机air2#</shaped></p>
            </div>
            <div class="photolist">
                <img src="imagea/5.jpg" height="50";width="50";>
                <img src="imagea/6.jpg" height="50";width="50";>
                <img src="imagea/7.jpg" height="50";width="50";>
                <p><strong>最顺手的那只鼠标</strong></p>
                <p><span>鼠标的发明是计算机诞生50年来最重大的事</span></p>
                <p><span>件之一。但，不说可能还没发现，我们每天</span></p>
                <p><span>碰触最多的，竟然都是那只小老鼠！</span></p>
            </div>
        </div>
        <div class="promo">
            <p class="product1">
                <br />
            <p><div class="note"></div>&nbsp&nbsp&nbsp&nbsp<strong>笔记本.办公随时随地</strong></p>
            <hr style=" height:1px;border:none;border-top:2px solid gray" />
            </p>
            <div class="pro1">
                <p>联想&nbsp&nbsp&nbspipad&nbsp&nbsp戴尔</p>
                <p>宏基&nbsp&nbsp&nbsp&nbspmacbook&nbsp&nbsp&nbsp&nbsp</p>
                <p>游戏本&nbsp&nbsp&nbsp&nbsp超极本</p>
                <p>外星人&nbsp&nbsp&nbsp&nbsp</p>
            </div>
            <div class="photolist">
                <img src="imagea/pc1.jpg" height="150" width="120">
                <img src="imagea/pc2.jpg" height="150" width="120">
                <img src="imagea/pc3.jpg" height="150" width="120">
                <img src="imagea/pc4.jpg" height="150";width="120">
                <img src="imagea/pc5.jpg" height="150";width="120">
                <p><shaped>&nbsp&nbsp&nbsp&nbsp&nbsp#imac&nbsppro512M#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#联想小Y&nbspY40#
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#apple&nbspmouse#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp#联想T300#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    #宏基笔记本#</shaped></p>
            </div>
            <div class="photolist">
                <img src="imagea/17.jpg" height="50";width="10";>
                <img src="imagea/18.jpg" height="50";width="10";>
                <img src="imagea/19.jpg" height="50";width="10";>
                <p><strong>还以为台式机比笔记本快？</strong></p>
                <p><span>很多人还认为台式电脑一定比笔记本电脑快</span></p>
                <p><span>其实相同配置的笔记本和台式一样快哦</span></p>
                <p><span>来花生网就捡性价比高的买！</span></p>
            </div>
        </div>
    </div>
    <div class="footer">
        <img src="imagea/foot.png" width="1200px">
        <img src="imagea/catch.png" width="1200px">
        <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">关于我们</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">联系我们</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">营销中心</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">友情链接</a>&nbsp&nbsp&nbsp</p>
        <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="classify" href="#" target="_blank">@数媒1401&nbsp&nbsp&nbsp花生小组出品</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</p>
    </div>
</div>
</body>
</html>