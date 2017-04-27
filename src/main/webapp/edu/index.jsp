<%@page import="com.hh.system.util.dto.ParamFactory"%>
<%@page import="com.hh.system.util.dto.ParamInf"%>
<%@page import="com.hh.system.service.impl.BeanFactoryHelper"%>
<%@page import="com.hh.edu.service.impl.EduSubjectService"%>
<%@page import="com.hh.edu.service.impl.EduTestPaperService"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsOrganization"%>
<%@page import="com.hh.system.util.Check"%>
<%@page import="com.hh.system.util.SysParam"%>
<%@page import="com.hh.system.util.SystemUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="<%=SysParam.sysParam.getSysIcon2()%>" />
<title><%=SysParam.sysParam.getSysName()%></title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<!--幻灯片-->
<script type="text/javascript" src="Assets/js/js_z.js"></script>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css">
<!--幻灯片-->
</head>
<%
String sysImg = SysParam.sysParam.getSysImg2();
if (Check.isNoEmpty(sysImg)) {
	sysImg = "<img style='width:50px;height:50px;'src=" + sysImg + " />";
}
%>
<body>
<!--头部-->
<div class="header">
	<div class="head_m clearfix">
        <div class="logo"><a href="javascript:void();">
        <table width=300px;>
			<tr>
				<td><%=sysImg%></td>
				<td><font
					style="font-size: 30px; font-weight: 200; padding: 0px 7px; text-shadow: 0 1px 0 #fff;" color=#0095CC><%=SysParam.sysParam.getSysName()%></font>
				</td>
			</tr>
		</table>
        <!-- <img src="Assets/images/logo.png" alt="彬之蓝"/> --></a></div>
        <div class="head_mr">
        	<p>服务热线：xxxx-xxxxxxxx</p>
            <div class="search">
            	<form action="" method="post">
                	<input name="" type="text" placeholder="请输入搜索关键词">
                    <input name="" type="submit" class="s_btn" value="">
                </form>
            </div>
        </div>
    </div>
    <div class="nav clearfix">
    	<div class="nav_l">&nbsp;</div>
        <ul class="nav_m">
            <li class="now"><a href="index.html">题目</a></li>
            <li><a href="about.html">试卷</a></li>
            <li><a href="product.html">资源</a></li>
            <!-- <li><a href="news.html">新闻中心</a></li>
            <li><a href="contact.html">联系我们</a></li>
            <li><a href="book.html">用户留言</a></li> -->
        </ul>
        <div class="nav_r">&nbsp;</div>
    </div>
</div>
<!--头部-->
<!--幻灯片-->
<div class="banner">
	<div id="inner">
        <div class="hot-event">
        	<div class="event-item" style="display: block;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="彬之蓝" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="彬之蓝" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="彬之蓝" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="彬之蓝" />
                </a>
            </div>
            <div class="switch-tab">
                <a href="#" onClick="return false;" class="current">1</a>
                <a href="#" onClick="return false;">2</a>
                <a href="#" onClick="return false;">3</a>
                <a href="#" onClick="return false;">4</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#inner').nav({ t: 6000, a: 500 });
    </script>
</div>
<!--幻灯片-->
<div class="space_hx">&nbsp;</div>
<div class="i_main clearfix">
	<ul class="side_nav">
    	<li class="title f18 yelow">产品导航</li>
        <li><a href="">蓝牙音响方案</a></li>
        <li><a href="">智能小风扇系列产品</a></li>
        <li><a href="">自拍杆系列产品</a></li>
        <li><a href="">蓝牙音响闪灯方案</a></li>
    </ul>
    <div class="i_about">
    	<div class="i_about_h f18 yelow"><span>公司简介</span></div>
        <div class="i_about_m">
        	<img src="Assets/upload/pic1.jpg" alt="公司简介" width="171" height="188"/>
            <p>深圳市彬之蓝科技有限公司创立于2007年，是一家集生产、开发，销售为一体的企业。专业研发和生产各种手机配件，蓝牙音响，移动电源类等，产品依靠专业水准的创新设计、优良的产品品质，值得信赖的服务，积极与客户沟通，赢得了广大客户的支持与好评，产品深受国内外市场的欢迎。 质量—我们建立了科学完善的质量管理体系。服务—我们与时俱进，不断提升员工综合素质，科技创新，用心想客户所想，做客户所做，我司的质量方针：质量第一，客户至上，精益求精，持续改进。 诚信—我们本着讲求信誉、恪守承诺的原则与客户共同发展</p>
            <p>我们将全力配合您的步伐，不断超越自我，相信在您的成就中一定能实现我们的美好未来！拥有完整、科学的质量管理体系，深圳市彬之蓝科技有限公司的诚信、实力和产品质量获得业界的认可。欢迎各界朋友莅临参观、指导和业务洽谈.</p>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<div class="pro_gd">
	<div id="marquee1" class="marqueeleft">
        <div class="mar_m clearfix">
            <ul id="marquee1_1">
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
                <li>
                    <a class="pic" href=""><img src="Assets/upload/pic2.jpg" alt="产品名称" title="产品名称"/></a>
                </li>
            </ul>   
            <ul id="marquee1_2"></ul>
        </div>
    </div>
    <script type="text/javascript">marqueeStart(1, "left");</script>
</div>
<div class="space_hx">&nbsp;</div>
<div class="foot">
	版权所有：深圳彬之蓝科技有限公司
    <span>粤ICP备12223333号-1</span>
</div>
<script language="javascript">
$(function(){
	
})
</script>
</body>
</html>