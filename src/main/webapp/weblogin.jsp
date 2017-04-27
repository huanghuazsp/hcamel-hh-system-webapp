<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsOrganization"%>
<%@page import="com.hh.system.util.Check"%>
<%@page import="com.hh.system.util.SysParam"%>
<%@page import="com.hh.system.util.SystemUtil"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="HH 信息管理平台 登录 快速开发平台" />
<meta name="description" content="HH 信息管理平台 描述" />
<meta name="author" content="HH互联网科技股份有限公司" />
<meta name="copyright" content="HH互联网科技股份有限公司版权所有" />
<link rel="shortcut icon" href="<%=SysParam.sysParam.getSysIcon2()%>" />
<title><%=SysParam.sysParam.getSysName()%>-登录</title>
<link href="/hhcommon/website/login/css/index.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="/hhcommon/opensource/jquery/web/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/hhcommon/website/login/js/comm/fai.min.js"></script>
	<style type="text/css">
	a {
		text-decoration: none;
	}
	</style>
</head>
<%
	String sysImg = SysParam.sysParam.getSysImg2();
	if (Check.isNoEmpty(sysImg)) {
		sysImg = "<img style='border: 0px solid #BEBEBE;' width='50' height='50' src="
		+ sysImg + " />";
	}

	String name = "";
	String password = "";
	String cookie = "";
	try {
		javax.servlet.http.Cookie[] cookies = request.getCookies();
		if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("xtYh.vdlzh")) {
			name = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
		}
	}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<body>
	<div class="container">
		<div class="header">
			<div class="left"></div>
			<!-- 
			<div class="header_link">
				<a href="javascript:void(0);" target="_blank">首页</a>&nbsp; <span
					class="sep">&nbsp;</span> &nbsp;<a href="javascript:void(0);"
					target="_blank">注册</a>&nbsp; <span class="sep">&nbsp;</span> &nbsp;<a
					href="javascript:void(0);" target="_blank" rel="nofollow">投诉建议</a>
				&nbsp;<span class="sep">&nbsp;</span>&nbsp; <a href="javascript:void(0);"
					target="_blank">微博</a> &nbsp;<span class="sep">&nbsp;</span> &nbsp;<a
					href="javascript:Fai.addBookmark(top.document.title, './');">收藏</a>
			</div>
			 -->
			<div class="clear"></div>
		</div>
		<div class="middle">
			<div class="content">
				<div class="left">
					<table height=70% style="margin-left: 20%">
						<tr>
							<td><%=sysImg%></td>
							<td><a href="<%=request.getContextPath()%>/"><font
								style="font-size: 40px; font-weight: 200; padding: 0px 7px; text-shadow: 0 1px 0 #fff;" color="#0095CC"><%=SysParam.sysParam.getSysName()%></font></a>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div class="text" style="width:450px">
							
							测试帐号：  admin、测试1、测试2、测试3、测试4、测试5、测试6、测试7、测试8、测试9、测试10、测试11<br>
							密码都为：123456
							
								</div></td>
						</tr>
					</table>
				</div>
				<div class="right">
					<div class="righttop">登录</div>
					<div id="log-form" class="rightmid">
						<div class="log-input-container">
							<div class="clear" style="font-size: 0px;"></div>
							<div class="log-line">
								<div class="log-txt">帐号</div>
								<input id="user" type="text" class="log-input input2"
									value="<%=name%>" />
								<div class="logIco logIcoCacct">&nbsp;</div>
							</div>
							<div class="log-line">
								<div id="passwordLabel" class="log-txt">密码</div>
								<input id="pwd" type="password" class="log-input input2"   />
								<div class="logIco logIcoPwd">&nbsp;</div>
							</div>
						</div>
						<!-- 
						<div class="option">
							<div class="goin">
								<input id="auto-login" type="checkbox" /><label
									for="auto-login">记住密码</label>
							</div>
							<div class="goin1">
								<a href="javascript:void(0);" onClick="openPassword();">忘记密码？</a>
							</div>
						</div>
						 -->
						<div id="error" class="worn"></div>
						<div class="btns">
							<div id="login-button" class="loginBtn">登&nbsp;&nbsp;录</div>

							<div id="reg-button" class="regBtn">注&nbsp;&nbsp;册</div>
	
							<div class="clear"></div>
						</div>
					</div>
					<div class="rightbot"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="foot">
			<div class="graw">
				Copyright <font
					style="font-family: '微软雅黑', '黑体', '新宋体', 'Arial Unicode MS'">&copy;
				</font> 2015-2016 <br><a href="javascript:void(0);"
					target='_blank' rel="nofollow">ICP备xxxx号</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			
			$('#reg-button').click(reg);
			
			$('#login-button').click(login);
			checkFocus('pwd');
			checkFocus('user');

			$('#user').focus(function() {
				checkFocus('user');
			}).blur(function() {
				checkFocus('user');
			}).keydown(function(event) {
				checkFocus('user');
				if (event.keyCode == 13) {
					login();
				}
			}).keyup(function() {
				checkFocus('user');
			})

			$('#pwd').focus(function() {
				checkFocus('pwd');
			}).blur(function() {
				checkFocus('pwd');
			}).keydown(function(event) {
				checkFocus('pwd');
				if (event.keyCode == 13) {
					login();
				}
			}).keyup(function() {
				checkFocus('pwd');
			})

		});

		function login() {
			var me = $('#login-button');
			if (me.hasClass('disabled')) {
				return;
			}

			var user = $('#user').val();
			var pwd = $('#pwd').val();
			if (!user) {
				showMsg('请输入帐号');
				$('#user').focus();
				return;
			}
			if (!pwd) {
				showMsg('请输入密码');
				$('#pwd').focus();
				return;
			}

			me.addClass('disabled');
			$(this).css('background','#ccc');
			me.html('正在登陆...');
			$.ajax({
				type : "POST",
				url : 'system-login-login',
				data : {
					'xtYh.vdlzh' : user,
					'xtYh.vmm' : pwd,
					//'xtYh.clientType':'desktop',
					jump : true
				},
				error : function(resulttext) {
					me.removeClass('disabled');
					me.css('background','#56a1e4');
					me.html('登&nbsp;&nbsp;录');
					showMsg("服务器异常，稍后登陆...");
				},
				success : function(resulttext) {
					me.removeClass('disabled');
					me.css('background','#56a1e4');
					me.html('登&nbsp;&nbsp;录');
					var data = eval('(' + resulttext + ')');
					showMsg(data.returnModel.msg);
					if (data.returnModel.href) {
						window.location.href = data.returnModel.href;
					}
				}
			});

		}

		function checkFocus(id) {
			var input = $('#' + id), val = input.val();
			if (id != "pwd") {
				val = $.trim(val);
			}
			$('#log-form').find('input.log-input').removeClass('input1');
			var txt = input.parent().children('.log-txt');
			$('.log-txt').removeClass("log-txt-hover");
			txt.addClass('log-txt-hover');
			$('.log-line').removeClass("log-line-hover");
			if (id != "log-valid") {
				input.parent().addClass("log-line-hover");
			}
			if (val == '') {
				txt.show();
				if (Fai.isIE7()) {
					input.css("background", "transparent");
				}
			} else {
				txt.hide();
				if (Fai.isIE7()) {
					input.css("background", "#fff");
				}
			}
			input.addClass('input1');
		}

		function reg(){
			window.location.href = 'reg.jsp';
		}
		
		function showMsg(msg) {
			$('#error').text(msg);
		}
	</script>
</body>
</html>