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
<meta name="keywords" content="HH 信息管理平台 登录 快注册速开发平台" />
<meta name="description" content="HH 信息管理平台 描述" />
<meta name="author" content="HH互联网科技股份有限公司" />
<meta name="copyright" content="HH互联网科技股份有限公司版权所有" />
<link rel="shortcut icon" href="<%=SysParam.sysParam.getSysIcon2()%>" />
<title><%=SysParam.sysParam.getSysName()%>-注册</title>
<link href="/hhcommon/website/login/css/index.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/web/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/hhcommon/website/login/js/comm/fai.min.js"></script>
</head>
<%
	String sysImg = SysParam.sysParam.getSysImg2();
	if (Check.isNoEmpty(sysImg)) {
		sysImg = "<img style='border: 0px solid #BEBEBE;' width='50' height='50' src="
				+ sysImg + " />";
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
							<td><font
								style="font-size: 40px; font-weight: 200; padding: 0px 7px; text-shadow: 0 1px 0 #fff;"><%=SysParam.sysParam.getSysName()%>-注册</font>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div class="text" style="width: 450px">
								</div></td>
						</tr>
					</table>
				</div>
				<div class="right">
					<div class="righttop">注册</div>
					<div id="log-form" class="rightmid">
						<div class="log-input-container">
							<div class="clear" style="font-size: 0px;"></div>
							<div class="log-line">
								<div class="log-txt">邮箱</div>
								<input xtype id="email" type="text" class="log-input input2" />
								<div class="logIco logIcoCacct">&nbsp;</div>
							</div>
							<!-- 
							<div class="btns">
								<div id="getcode-button" class="loginBtn" style="width: 240px">邮&nbsp;箱&nbsp;获&nbsp;取&nbsp;验&nbsp;证&nbsp;码</div>
								<div class="clear"></div>
							</div>
							<div class="log-line">
								<div class="log-txt">注册码</div>
								<input xtype id="code" type="text" class="log-input input2" />
								<div class="logIco logIcoCacct">&nbsp;</div>
							</div> -->
							<div class="log-line">
								<div class="log-txt">帐号</div>
								<input xtype id="user" type="text" class="log-input input2" />
								<div class="logIco logIcoCacct">&nbsp;</div>
							</div>
							<div class="log-line">
								<div class="log-txt">真实姓名</div>
								<input xtype id="text" type="text" class="log-input input2" />
								<div class="logIco logIcoCacct">&nbsp;</div>
							</div>
							<div class="log-line" style="margin-top:14px;height:50px;">
								<table>
								<tr><td>性别：</td><td id="sex" style="text-align:left;">
								<input checked type="radio" id="sex1" name="sex" value="1" /><label for="sex1">男</label>
								<input  type="radio" id="sex0" name="sex" value="0" /><label for="sex0">女</label>
								</td></tr>
								
								<!-- <tr><td>角色：</td><td id="roleIds" style="text-align:left;">
								<input checked type="radio" id="roleIds1" name="roleIds" value="56e55e4e-a2f9-4a8d-b808-86ca2475d85c" /><label for="roleIds1">学生</label>
								<input  type="radio" id="roleIds0" name="roleIds" value="10008834-ccda-42a3-9502-1688901399cf" /><label for="roleIds0">教师</label>
								</td></tr> -->
								</table>
							</div>
							<div class="log-line">
								<div id="passwordLabel" class="log-txt">密码</div>
								<input xtype id="pwd" type="password" class="log-input input2" />
								<div class="logIco logIcoPwd">&nbsp;</div>
							</div>
							<div class="log-line">
								<div id="passwordLabel2" class="log-txt">再次输入密码</div>
								<input xtype id="pwd2" type="password" class="log-input input2" />
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
							<div id="login-button" class="loginBtn" >注&nbsp;&nbsp;册</div>
							<div id="back-button" class="regBtn">返&nbsp;回&nbsp;登&nbsp;录</div>
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
				</font> 2015-2016 HH科技有限公司<br> <a href="javascript:void(0);"
					target='_blank' rel="nofollow">ICP备xxxx号</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#login-button').click(login);

			$('#getcode-button').click(getCode);
			
			$('#back-button').click(back);

			checkFocus('email');

			$('[xtype]').each(function() {
				$(this).focus(function() {
					checkFocus($(this).attr('id'));
				}).blur(function() {
					checkFocus($(this).attr('id'));
				}).keydown(function(event) {
					checkFocus($(this).attr('id'));
					if (event.keyCode == 13) {
						login();
					}
				}).keyup(function() {
					checkFocus($(this).attr('id'));
				})
			});
		});

		function getCode() {
			var me = $(this);
			if ($(this).hasClass('disabled')) {
				return;
			}
			var email = $('#email').val();
			if (!email) {
				showMsg('邮箱不能为空！');
				return;
			}
			$(this).css('background', '#ccc');
			$(this).addClass('disabled');

			$
					.ajax({
						type : "POST",
						url : 'system-login-findCode',
						data : {
							email : email
						},
						error : function(resulttext) {
							me.css('background', '#56a1e4');
							me.removeClass('disabled');
							showMsg("服务器异常，稍后登陆...");
						},
						success : function(resulttext) {
							var data = eval('(' + resulttext + ')');
							if (data.code == 1) {
								sytime = 60;
								interval = setInterval(
										function() {
											sytime = sytime - 1;
											$('#getcode-button').html(
													'邮&nbsp;箱&nbsp;获&nbsp;取&nbsp;验&nbsp;证&nbsp;码('
															+ sytime + ')');
											if (sytime < 0) {
												$('#getcode-button')
														.html(
																'邮&nbsp;箱&nbsp;获&nbsp;取&nbsp;验&nbsp;证&nbsp;码');
												me.css('background', '#56a1e4');
												me.removeClass('disabled');
												clearInterval(interval);
											}
										}, 1000);
							}
						}
					});

		}
		var sytime = 60;
		var interval = null;
		function login() {
			var me = $('#login-button');
			if (me.hasClass('disabled')) {
				return;
			}
			var email = $('#email').val();
			var user = $('#user').val();
			var pwd = $('#pwd').val();
			var pwd2 = $('#pwd2').val();
			var code = $('#code').val();
			var text = $('#text').val();
			var sex = $('#sex').find('input:radio:checked').val();
			//var roleIds = $('#roleIds').find('input:radio:checked').val();
			 if (!email) {
				showMsg('请输入邮箱');
				$('#email').focus();
				return;
			}
			 /*
			if (!code) {
				showMsg('请输入注册码');
				$('#code').focus();
				return;
			} */
			if (!user) {
				showMsg('请输入帐号');
				$('#user').focus();
				return;
			}
			if (!text) {
				showMsg('请输入真实姓名');
				$('#text').focus();
				return;
			}
			if (!pwd) {
				showMsg('请输入密码');
				$('#pwd').focus();
				return;
			}
			if (!pwd2) {
				showMsg('请再次输入密码');
				$('#pwd2').focus();
				return;
			}
			if (pwd2 != pwd) {
				showMsg('输入的密码不一致');
				$('#pwd2').focus();
				return;
			}

			me.addClass('disabled');
			$(this).css('background', '#ccc');
			me.html('正在注册...');
			$.ajax({
				type : "POST",
				url : 'system-login-reg',
				data : {
					'xtYh.vdzyj' : email,
					'xtYh.vdlzh' : user,
					'xtYh.vmm' : pwd,
					'xtYh.nxb' : sex,
					'xtYh.roleIds' : 'default',
					'code' : code,
					'xtYh.text' : text
				},
				error : function(resulttext) {
					me.removeClass('disabled');
					me.css('background', '#56a1e4');
					me.html('注&nbsp;&nbsp;册');
					showMsg("服务器异常，稍后登陆...");
				},
				success : function(resulttext) {
					me.removeClass('disabled');
					me.css('background', '#56a1e4');
					me.html('注&nbsp;&nbsp;册');
					var data = eval('(' + resulttext + ')');
					if (data.msg) {
						showMsg(data.msg);
					} else {
						showMsg('注册成功！<a href="login.jsp">登陆</a>');
					}
				}
			});

		}
		
		function back(){
			window.location.href = 'login.jsp';	
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

		function showMsg(msg) {
			$('#error').html(msg);
		}
	</script>
</body>
</html>