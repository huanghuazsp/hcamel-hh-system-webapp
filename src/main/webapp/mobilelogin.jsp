<%@page import="java.net.URLDecoder"%>
<%@page import="com.hh.system.util.Check"%>
<%@page import="com.hh.system.util.SysParam"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta name="viewport" content="initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="shortcut icon" href="<%=SysParam.sysParam.getSysIcon2()%>" />
<title><%=SysParam.sysParam.getSysName()%>-登录</title>
<link rel="stylesheet"
	href="/hhcommon/website/mobilelogin/font-awesome-4.5.0/css/font-awesome.min.css" />
<script type="text/javascript"
		src='/hhcommon/website/mobilelogin/js/jquery.min.js'></script>
<!--可无视-->
<link rel="stylesheet"
	href="/hhcommon/website/mobilelogin/css/normalize.css" type="text/css" />

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
body {
	font-family: "Open Sans", sans-serif;
	height: 100vh;
	/* background: url("/hhcommon/website/mobilelogin/HgflTDf.jpg") 50% fixed; */
	background-size: cover;
}

@
keyframes spinner { 0% {
	transform: rotateZ(0deg);
}

100%
{
transform
:
 
rotateZ
(359deg);

  
}
}
* {
	box-sizing: border-box;
}

.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	min-height: 100%;
	padding: 20px;
	/* background: rgba(4, 40, 68, 0.85); */
}

.login {
	border-radius: 2px 2px 5px 5px;
	padding: 10px 20px 20px 20px;
	width: 90%;
	max-width: 320px;
	background: #ffffff;
	position: relative;
	padding-bottom: 80px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.3);
	margin: 0 auto;
}

.login.loading button {
	max-height: 100%;
	padding-top: 50px;
}

.login.loading button .spinner {
	opacity: 1;
	top: 40%;
}

.login.ok button {
	background-color: #8bc34a;
}

.login.ok button .spinner {
	border-radius: 0;
	border-top-color: transparent;
	border-right-color: transparent;
	height: 20px;
	animation: none;
	transform: rotateZ(-45deg);
}

.login input {
	display: block;
	padding: 15px 10px;
	margin-bottom: 10px;
	width: 100%;
	border: 1px solid #ddd;
	transition: border-width 0.2s ease;
	border-radius: 2px;
	color: #ccc;
}

.login input+i.fa {
	color: #fff;
	font-size: 1em;
	position: absolute;
	margin-top: -47px;
	opacity: 0;
	left: 0;
	transition: all 0.1s ease-in;
}

.login input:focus {
	outline: none;
	color: #444;
	border-color: #2196F3;
	border-left-width: 35px;
}

.login input:focus+i.fa {
	opacity: 1;
	left: 30px;
	transition: all 0.25s ease-out;
}

.login a {
	font-size: 0.8em;
	color: #2196F3;
	text-decoration: none;
}

.login .title {
	color: #444;
	font-size: 1.2em;
	font-weight: bold;
	margin: 10px 0 30px 0;
	border-bottom: 1px solid #eee;
	padding-bottom: 20px;
}

.login button {
	width: 100%;
	height: 100%;
	padding: 10px 10px;
	background: #2196F3;
	color: #fff;
	display: block;
	border: none;
	margin-top: 20px;
	position: absolute;
	left: 0;
	bottom: 0;
	max-height: 60px;
	border: 0px solid rgba(0, 0, 0, 0.1);
	border-radius: 0 0 2px 2px;
	transform: rotateZ(0deg);
	transition: all 0.1s ease-out;
	border-bottom-width: 7px;
}

.login button .spinner {
	display: block;
	width: 40px;
	height: 40px;
	position: absolute;
	border: 4px solid #ffffff;
	border-top-color: rgba(255, 255, 255, 0.3);
	border-radius: 100%;
	left: 50%;
	top: 0;
	opacity: 0;
	margin-left: -20px;
	margin-top: -20px;
	animation: spinner 0.6s infinite linear;
	transition: top 0.3s 0.3s ease, opacity 0.3s 0.3s ease, border-radius
		0.3s ease;
	box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.2);
}

.login:not (.loading ) button:hover {
	box-shadow: 0px 1px 3px #2196F3;
}

.login:not (.loading ) button:focus {
	border-bottom-width: 4px;
}

footer {
	display: block;
	padding-top: 50px;
	text-align: center;
	color: #ddd;
	font-weight: normal;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.2);
	font-size: 0.8em;
}

footer a, footer a:link {
	color: #fff;
	text-decoration: none;
}
</style>

<script src="/hhcommon/website/mobilelogin/js/prefixfree.min.js"></script>



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
		$(this).css('background', '#ccc');
		me.html('正在登陆...');
		
		
	  var $state = me.find('button > .state');
	  me.addClass('loading');
	  $state.html('正在登录。。。');
	  
	  
	 /* me.addClass('ok');
    $state.html('Welcome back!');
    setTimeout(function() {
      $state.html('登录');
      me.removeClass('ok loading');
    }, 4000);*/
		
		$.ajax({
			type : "POST",
			url : 'system-login-login',
			data : {
				'xtYh.vdlzh' : user,
				'xtYh.vmm' : pwd,
				//'xtYh.clientType':'mobiledesktop',
				jump : true
			},
			error : function(resulttext) {
				me.removeClass('disabled');
				me.css('background', '#56a1e4');
				me.html('登&nbsp;&nbsp;录');
				$state.html('登录');
			    me.removeClass('ok loading');
				showMsg("服务器异常，稍后登陆...");
			},
			success : function(resulttext) {
				me.removeClass('disabled');
				me.css('background', '#56a1e4');
				me.html('登&nbsp;&nbsp;录');
				$state.html('登录');
			    me.removeClass('ok loading');
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
		input.addClass('input1');
	}

	function reg() {
		window.location.href = 'reg.jsp';
	}

	function showMsg(msg) {
		$('#error').text(msg);
	}
</script>
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
</head>

<body>

	<div class="wrapper">
		<div class="login">
			<p class="title"><%=SysParam.sysParam.getSysName()%><br/>
			</p>
			<input  id="user" type="text" placeholder="输入账号" autofocus value="<%=name %>" /> <i
				class="fa fa-user"></i> <input  id="pwd" type="password" placeholder="输入密码" />
			<i class="fa fa-key"></i>
			<!-- <a href="#">忘记密码?</a> -->
			<button id="login-button">
				<i class="spinner"></i> <span class="state">登录</span>
			</button>
		</form>
		<div id="error" class="worn" style="color:red;"></div>
		<footer></footer>
	</div>

</body>
</html>
