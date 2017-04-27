<%@page import="com.hh.system.util.date.DateFormat"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsOrganization"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsRole"%>
<%@page import="com.hh.system.util.Check"%>
<%@page import="com.hh.usersystem.bean.usersystem.SysMenu"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsUser"%>
<%@page import="com.hh.system.util.SysParam"%>
<%@page import="com.hh.system.util.SystemUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%
	Gson gson = new Gson();
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	UsUser hhXtYh = (UsUser) session.getAttribute("loginuser");
	String headpic = hhXtYh.getHeadpic();

	List<UsRole> roleList = hhXtYh.getRoleList();
	String jsTextStr = "";
	for (UsRole hhXtJs : roleList) {
		jsTextStr += hhXtJs.getText() + ",";
	}
	if (!"".equals(jsTextStr)) {
		jsTextStr = "角色【" + jsTextStr.substring(0, jsTextStr.length() - 1) + "】";
	}
	String orgTextStr = "";
	UsOrganization jg = hhXtYh.getOrg();
	UsOrganization bm = hhXtYh.getDept();
	UsOrganization gw = hhXtYh.getJob();
	String str = "";
	if (jg != null) {
		str += jg.getName() + "/";
	}
	if (bm != null) {
		str += bm.getName() + "/";
	}
	if (gw != null) {
		str += gw.getName() + "/";
	}
	if (Check.isNoEmpty(str)) {
		str = str.substring(0, str.length() - 1);
		orgTextStr = "【" + str + "】";
	}
	String textStr = "欢迎您，"+hhXtYh.getText();
	if (!"".equals(orgTextStr)) {
		textStr = orgTextStr+textStr;
	}
	textStr+="<br><img onClick='openCalendar()' style=\"cursor: pointer;\" width=\"16\" height=\"16\" src=\"/hhcommon/images/extjsico/17460310.png\" >&nbsp;"+DateFormat.getDate("yyyy年MM月dd日 （EEE）");
	if (Check.isNoEmpty(headpic) && !headpic.startsWith("/hhcomm")) {
		headpic = "system-File-download?params={id:'" + headpic + "'}";
	}

	if (Check.isNoEmpty(headpic)) {
		headpic = " <img id='headpicimg' onClick='updateUser()' style=\"cursor: pointer;\" width=\"50\"		height=\"50\"		src=\""
		+ headpic + "\" />";
	} else {
		headpic = "<img id='headpicimg' onClick='updateUser()' style=\"cursor: pointer;\" width=\"50\"		height=\"50\"		src=\"/hhcommon/images/icons/user/100/no_on_line_user.jpg\" />";
	}

	String sysImg = SysParam.sysParam.getSysImg2();
	if (Check.isNoEmpty(sysImg)) {
		sysImg = "<img style='' width='50' height='50' src=" + sysImg + " />";
	}
%>
<%=SystemUtil.getBaseDoctype()%>
<html>
<head>
<title><%=SysParam.sysParam.getSysName()%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="keywords" content="struts,spring,hibernate,extjs">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=SysParam.sysParam.getSysIcon2()%>" />
<link rel="stylesheet" type="text/css"
	href="/hhcommon/opensource/jquery/layout/layout-default-latest.css" />
<%=SystemUtil.getJqueryCss()%>
<script type="text/javascript">var theme = '<%=hhXtYh.getTheme()%>';</script>
<link rel="stylesheet" type="text/css"
	href="/hhcommon/opensource/jquery/hhjqueryui.css" />

<style type="text/css">
.ui-layout-center, /* has content-div */ .ui-layout-west,
	/* has Accordion */ .ui-layout-east .ui-layout-content {
	/* content-div has Accordion */
	padding: 0;
	overflow: hidden;
}

.ui-layout-center P.ui-layout-content {
	line-height: 1.4em;
	margin: 0; /* remove top/bottom margins from <P> used as content-div */
}

h4 { /* Headers & Footer in Center & East panes */
	background: #EEF;
	border: 1px solid #BBB;
	border-width: 0 0 1px;
	padding: 7px 10px;
	margin: 0;
}

#tabs li .ui-icon-close {
	float: left;
	margin: 0.4em 0.2em 0 0;
	cursor: pointer;
}

#add_tab {
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/web/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/jui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/layout/jquery.layout-latest.min.js"></script>
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/layout/jquery.layout.resizePaneAccordions-latest.js"></script>

<!--<script type="text/javascript" src="/hhcommon/opensource/jquery/layout/themeswitchertool.js"></script> 
	<script type="text/javascript" src="/hhcommon/opensource/jquery/layout/debug.js"></script>
	  -->

<script type="text/javascript"
	src="/hhcommon/opensource/jquery/mainframe.js"></script>
<script type="text/javascript"
	src="/hhcommon/opensource/jquery/hhjqueryui.js"></script>


<script type="text/javascript">
	$.hh.property.loginUser = <%=gson.toJson(hhXtYh)%>;
    var contextPath = '<%=request.getContextPath()%>';
    var sysName = '<%=SysParam.sysParam.getSysName()%>';

	var $tabs = null;
	var centerHeight;
	var centerIframe;
	
	var Menu = {
		getTreeChildrens : function(menuid) {
			var menuList = $.hh.property.loginUser.menuList;
			var resultTreeChildrens = [];
			for (var i = 0; i < menuList.length; i++) {
				var hhXtCd = menuList[i];
				if (hhXtCd.node == menuid) {
					var treeNode = {};
					jQuery.extend(treeNode, hhXtCd);
					treeNode.id = hhXtCd.id;
					treeNode.pId = hhXtCd.node;
					treeNode.name = hhXtCd.text;
					treeNode.img = hhXtCd.icon;
					treeNode.isParent = hhXtCd.leaf == 0;
					treeNode.open = hhXtCd.expanded == 1;
					Menu.addTreeChildrens(treeNode, menuList);
					resultTreeChildrens.push(treeNode);
				}
			}
			return resultTreeChildrens;
		},
		addTreeChildrens : function(parentTreeNode, menuList) {
			parentTreeNode.children = [];
			for (var i = 0; i < menuList.length; i++) {
				var hhXtCd = menuList[i];
				if (hhXtCd.node == parentTreeNode.id) {
					var treeNode = {};
					jQuery.extend(treeNode, hhXtCd);
					treeNode.id = hhXtCd.id;
					treeNode.pId = hhXtCd.node;
					treeNode.name = hhXtCd.text;
					treeNode.img = hhXtCd.icon;
					treeNode.isParent = hhXtCd.leaf == 0;
					treeNode.open = hhXtCd.expanded == 1;
					Menu.addTreeChildrens(treeNode, menuList);
					parentTreeNode.children.push(treeNode);
				}
			}
		}
	}

	var menu = {};
	var menuList = $.hh.property.loginUser.menuList;

	for (var i = 0; i < menuList.length; i++) {
		var hhXtCd = menuList[i];
		menu[hhXtCd.id] = {
			id : hhXtCd.id,
			data : Menu.getTreeChildrens(hhXtCd.id),
			onClick : function(data) {
				addTab(data);
			}
		}
	}

	$(document)
			.ready(
					function() {
						myLayout = $('body')
								.layout(
										{
											west : {
												size : 163,
												spacing_closed : 22,
												togglerLength_closed : 140,
												togglerAlign_closed : "top",
												togglerContent_closed : "菜<BR><BR><BR>单",
												togglerTip_closed : "展开菜单",
												sliderTip : "展开菜单",
												slideTrigger_open : "click",
												onresize : $.layout.callbacks.resizePaneAccordions,
												initClosed:$.hh.property.loginUser.propertysMap.mainlayout=='close',
												ondrag_start : function() {
													$('iframe').hide();
												},
												ondrag_end : function() {
													$('iframe').show();
												},
												//resizable :false,
												togglerContent_open : "<",
												onopen :function(a){
													if(window.layoutclick){
														Request
														.request(
																'usersystem-user-updateProperty',
																{
																	doing : false,
																	defaultMsg:false,
																	data:{
																		'paramsMap.mainlayout':'open'
																	},
																	callback : function(result) {
																		
																	}});
													}
													window.layoutclick=false;
												},
												onclose :function(a){
													if(window.layoutclick){
														Request
														.request(
																'usersystem-user-updateProperty',
																{
																	doing : false,
																	defaultMsg:false,
																	data:{
																		'paramsMap.mainlayout':'close'
																	},
																	callback : function(result) {
																		
																	}});
													}
													window.layoutclick=false;
												}
											},
											north : {
												spacing_closed : 18,
												togglerLength_closed : 140,
												togglerContent_closed : "展开",
												togglerTip_closed : "展开",
												sliderTip : "展开",
												slideTrigger_open : "click",
												onresize : $.layout.callbacks.resizePaneAccordions,
												resizable : false,
												togglerContent_open : "^",
												spacing_open : 0
											},
											north__slidable : false,
											south__spacing_open : 0,
											center__onresize : function(a, b) {
												centerHeight = b[0].style.height
														.replace('px', '');
												if (centerIframe) {
													centerIframe.height = centerHeight - 35;
												}
											}
										});
						
						$('body').find('.ui-layout-resizer').each(
								function() {
									$(this).css('background-color',
											$.hh.property.classObject.themeHead);
									$(this).find('.ui-layout-toggler').css('background-color',
											$.hh.property.classObject.themeContent);
									$(this).dblclick(function(){
										window.layoutclick=true;
									});
									$(this).find('.ui-layout-toggler').click(function(){
										window.layoutclick=true;
									});
								});
						$('body')
								.find('[title=Close]')
								.each(
										function() {
											$(this)
													.css(
															'background-color',
															$.hh.property.classObject.themeContent);
											$(this)
													.parent('div')
													.css(
															'background-color',
															$.hh.property.classObject.themeHead);
										});
						
						
						
						$("#accordion1").accordion({
							heightStyle : "fill"
						});

						//addThemeSwitcher('.ui-layout-north',{ top: '12px', right: '5px' });
						setTimeout(myLayout.resizeAll, 1000);
						$tabs = $("#tabs")
								.tabs(
										{
											activate : function(event, ui) {
												var uiid = ui.newPanel[0].id;
												centerIframe = document
														.getElementById(uiid
																+ 'iframe');
												if (centerIframe) {
													$(centerIframe).attr(
															'height',
															centerHeight - 35);
												}
											}
										});
						
						
						$tabs.delegate("span.ui-icon-close", "click",
								function() {
									var panelId = $(this).closest("li")
											.remove().attr("aria-controls");
									$("#" + panelId).remove();
									$tabs.tabs("refresh");
								});
						
						$('body').children().each(function() {
							var layout_div = $(this);
							if (layout_div.is('div')) {
								layout_div.css({
									'border-color' :$.hh.property.classObject.themeHead
								});
							}
						});
						$('.ui-layout-center').css('overflow','hidden');
						$('#tabs').css('overflow','hidden');

					});

	var bodyRightMenu = {
		data : [ {
			text : '刷新页面',
			img : $.hh.property.img_refresh,
			onClick : function() {
				document.location.reload();
			}
		} ]
	};

	function updatepassword_click() {
		var dialog = new DialogClass({
			width : 580,
			height : 250,
			url : 'jsp-usersystem-user-changepassword'
		});
		dialog.show();
	}

	function openOrg() {
		addTab({
			id : 'onlineorgtree',
			text : '用户信息',
			vsj : 'jsp-usersystem-org-onlineorgtree'
		});
	}
	
	function openCalendar(){
		addTab({
			id : 'calendar',
			text : '日历',
			vsj : 'jsp-system-tools-calendar'
		});
	}

	function openUserGroup() {
		addTab({
			id : 'usergroup_maindiv',
			text : '自定义用户组',
			vsj : 'jsp-usersystem-usergroup-grouplist'
		});
	}

	function updateUser() {
		Dialog.open({
			url : 'jsp-usersystem-user-useredit?id='+$.hh.property.loginUser.id,
			params : {
				systemmanagerhide : true,
				callback : function(data) {
					$.hh.timeout({
						callback : function() {
							document.location.reload();
						}
					});
				}
			}
		});
	}
	function updateThemes() {
		Dialog.open({
			width : 620,
			height : 450,
			url : 'jsp-usersystem-user-themes'
		});
	}
	function btnmhqh_click() {
		Doing.show();
		Request.href('system-login-updateDesktopType?desktop=desktop');
	}
	function logout_click() {
		Dialog.confirm({
			message : '您确认要退出系统？',
			callback : function(result) {
				if (result == 1) {
					Request.href("usersystem-login-logout");
				}
			}
		});
	}
	var closerightmenu = {
		data : [
				{
					img : "/hhcommon/images/extjsico/delete2.gif",
					text : "关闭",
					onClick : function(data) {
						data.content.find('span').trigger('click');
					}
				},
				{
					img : "/hhcommon/images/icons/arrow/arrow_refresh.png",
					text : "刷新",
					onClick : function(data) {
						var iframe = window.frames[data.content
								.attr('aria-controls')
								+ 'iframe'];
						if (iframe) {
							iframe.location.reload();
						}
					}
				},
				{
					img : "/hhcommon/images/extjsico/delete2.gif",
					text : "关闭其他",
					onClick : function(data) {
						data.content
								.parent('ul')
								.children()
								.each(
										function() {
											if (data.content
													.attr('aria-controls') != $(
													this).attr('aria-controls')) {
												$(this).find('span').trigger(
														'click');
											}
										});
					}
				}, {
					img : "/hhcommon/images/extjsico/delete2.gif",
					text : "关闭所有",
					onClick : function(data) {
						data.content.parent('ul').children().each(function() {
							$(this).find('span').trigger('click');
						});
					}
				} ]
	}

	function init() {
		var menuul = $('#closerightmenu').find('ul');
		menuul.hide();
		menuul.css({
			'border' : '1px solid ' + $.hh.property.classObject.themeContent,
			'position' : 'absolute',
			'z-index' : 9999999999
		});
	}

	var tabTemplate = "<li ><a href='###href###' >###label###</a> <span class='ui-icon ui-icon-close' role='presentation'>Remove Tab</span></li>";
	function addTab(treeNode) {
		if (!treeNode.vsj) {
			treeNode.vsj = treeNode.src;
		}

		if (treeNode.leaf == false) {
			return;
		}
		var label = treeNode.text;
		var id = treeNode.id;
		var index = $('#tabs a[href="#' + treeNode.id + '"]').parent().index();
		var src = treeNode.vsj;
		if (index < 0) {
			if (treeNode.openType == 1) {
				Request.submit(src);
				return;
			}

			var li = $(tabTemplate.replace(/###href###/g, "#" + id).replace(
					/###label###/g, label));
			
			li.find('span').click(function(){
				$.hh.clearIframe(id + 'iframe');
			});

			li.contextmenu(function(event) {
				$('#closerightmenu').find('ul').data('dom', $(this));
				$(document).one("click", function() {
					$('#closerightmenu').find('ul').hide();
				});
				$('#closerightmenu').find('ul').show().css({
					left : event.clientX + 'px',
					top : event.clientY + 'px'
				});
				return false;
			});

			$tabs.find(".ui-tabs-nav").append(li);
			//$.hh.setFrameParams(id+'iframe',treeNode);
			$tabs
					.append("<div id='" + id + "' style='padding:0px' ><iframe id='"
							+ id
							+ "iframe'  name='"
							+ id
							+ "iframe'  frameborder=0  width=100% height=100% src='"
							+ src + "' /></div>");
			$tabs.tabs("refresh");
		}else{
			var iframeSrc = $tabs.find('#'+id+'iframe').attr('src');
			if(iframeSrc!=src){
				$tabs.find('#'+id+'iframe').attr('src',src);
			}
		}
		$("#tabs").tabs("option", "active", index);
		if($('[role=tablist]')[0].scrollHeight>36){
			$('.hh_tabButtonLeft').show();
			$('.hh_tabButtonRight').show();
		}
	}

	function loadMainTab() {

		/*
		$tabs.find(".ui-tabs-nav").append(
				'<li><a href="#onlineorgtree" style="">首页</a></li>');
		var id = 'onlineorgtree';
		$tabs
				.append("<div id='" + id + "' style='padding:0px' ><iframe id='"
						+ id
						+ "iframe'  name='"
						+ id
						+ "iframe' frameborder=0  width=100% height=100% src='jsp-usersystem-org-onlineorgtree' /></div>");
		 */
		
		$tabs
			.find(".ui-tabs-nav")
			.append(
					'<li><a href="#onlineorgtree" style="">门户</a></li>');
		var id = 'onlineorgtree';
		$tabs
			.append("<div id='" + id + "' style='padding:0px' ><iframe id='"
					+ id
					+ "iframe'  name='"
					+ id
					+ "iframe' frameborder=0  width=100% height=100% src='jsp-usersystem-org-onlineorgtree' /></div>");
		
		/*
		
		$tabs
		.find(".ui-tabs-nav")
			.append(
					'<li><a href="#jsp-system-portlets-portlets" style="">门户</a></li>');
		var id = 'jsp-system-portlets-portlets';
		$tabs
			.append("<div id='" + id + "' style='padding:0px' ><iframe id='"
					+ id
					+ "iframe'  frameborder=0  width=100% height=100% src='' /></div>");
		 */

		$tabs.tabs("refresh");
		$("#tabs").tabs("option", "active", 0);
	}

	$(document)
			.ready(
					function() {
						loadMainTab();

						var mysetInterval = null;
						var mysetInterval2 = null;

						function loadData() {
							Request
									.request(
											'usersystem-System-loadDataTime',
											{
												doing : false,
												callback : function(result) {
													if (result.success != false == false
															|| result.sessionstatus == 'timeout') {
														clearInterval(mysetInterval);
													} else {

														var message_span = $('#message_span');
														var message = result.message;
														
														var onlineuser = result.onlineuser;
														
														if (message || onlineuser) {
															var messageText = '';
															
															if(onlineuser){
																messageText+='在线<font class=hh_green>'
																	+ onlineuser.count
																	+ '</font>人;';
															}
															if(message){
																messageText+='您有<font class=hh_red>'
																	+ message.count
																	+ '</font>条未读消息;';
															}
															
															message_span
																	.render({
																		'text' : messageText,
																		params : message
																	});
														}
														if(window.frames['onlineorgtreeiframe'] && window.frames['onlineorgtreeiframe'].renderAllQuickMenu){
															window.frames['onlineorgtreeiframe'].renderAllQuickMenu(result);
														}
														var allMessage = message.allMessage;
														if (allMessage) {
															try{
																if(window.frames['onlineorgtreeiframe'] && window.frames['onlineorgtreeiframe'].renderAllMessage){
																	window.frames['onlineorgtreeiframe'].renderAllMessage(allMessage);
																}
																if($.hh.property.mainWindow && $.hh.property.mainWindow.renderAllMessage){
																	$.hh.property.mainWindow.renderAllMessage(allMessage);
																}
															}catch(e){
																
															}
														}
														/*
														var onlineuser_span = $('#onlineuser_span');
														var onlineuser = result.onlineuser;
														if (onlineuser) {
															onlineuser_span
																	.render({
																		'text' : '<font color=red>('
																				+ onlineuser.count
																				+ ')</font>'
																	});
														}
														*/

														if (message	&&  message.count > 0) {
															if (mysetInterval2 == null) {
																mysetInterval2 = setInterval(
																		function() {
																			if (document.title == sysName) {
																				document.title = "您有新的未读消息！！";
																			} else {
																				document.title = sysName;
																			}
																		}, 700);
															}
														} else {
															document.title = sysName;
															clearInterval(mysetInterval2);
															mysetInterval2 = null;
														}
													}
												}
											});
						}

						setTimeout(function() {
							loadData();
							mysetInterval = setInterval(loadData, 1000 * 60);
						}, 3000);

					});

	function openMessage(){
		addTab({
			id : 'onlineorgtree',
			text : '门户',
			vsj : 'jsp-usersystem-org-onlineorgtree'
		});
		//$.hh.property.mainWindow = Request.openwin('jsp-usersystem-org-onlineorgtree',{id:'onlineorgtree'});
	}
	var scrollTop = 0
	$(function(){
		$('.hh_tabButtonLeft').click(function(){
			scrollTop = scrollTop-36;
			if(scrollTop<0){
				scrollTop=0;
			}
			$('[role=tablist]').animate({scrollTop: scrollTop})
		});
		
	});
	$(function(){
		$('.hh_tabButtonRight').click(function(){
			scrollTop = scrollTop+36;
			if(scrollTop>$('[role=tablist]')[0].scrollHeight){
				scrollTop=0;
			}
			$('[role=tablist]').animate({scrollTop:scrollTop})
		});
		
	});
</script>
<style type="text/css">
	a {
		text-decoration: none;
	}
	</style>
</head>
<body>

	<div class="ui-layout-north ui-widget-header"
		style="display: none; padding: 0px; border: 0px;">
		<!-- <input id="aaa" /><%=hhXtYh.getId()%>
		<a href="javascript:test();">test</a> -->
		<table width="100%">
			<tr>
				<td>
					<table>
						<tr>
							<td><%=sysImg%></td>
							<td>
							<a href="<%=request.getContextPath()%>/"><font
								style="font-size: 30px; font-weight: 200; padding: 0px 7px; text-shadow: 0 1px 0 #fff;"><%=SysParam.sysParam.getSysName()%></font>
							</a>
							</td>
						</tr>
					</table>
				</td>
				<td align="right">
					<table>
						<tr>
							<td align=center><font style="font-weight: 200;">
									 <%=textStr%>
							</font></td>
							<td><%=headpic%></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div
		class="ui-layout-south ui-widget-content ui-widget-header ui-corner-all"
		style="display: none; padding: 5px; text-align: right; border: 0px;">
		<!--<span xtype="button" config="onClick:btnmhqh_click,text:'门户切换'"></span> -->
		<span id="message_span" xtype="button" config=" icon :'hh_message'  ,		onClick : openMessage "></span>
		<!--<span id="onlineuser_span" xtype="button"
			config="onClick: openOrg ,icon:'hh_img_org'  "></span> --> <span
			id="usergroup_span" xtype="button"
			config="onClick: openUserGroup ,icon:'hh_img_group'  "></span> <span
			xtype="button"
			config="onClick: updateThemes ,text:'样式切换' ,textHidden:true,icon:'hh_img_themes'  "></span>
		<span xtype="button"
			config="onClick:updatepassword_click ,text:'修改密码' ,textHidden:true,icon:'hh_img_lock'  "></span>
		<span xtype="button"
			config="onClick:logout_click,text:'退出' ,textHidden:true,icon:'hh_img_delete' "></span>
	</div>

	<div class="ui-layout-center" style="display: none;">
		<!-- <h3 class="ui-widget-header">Center Pane</h3> -->
		<div id="tabs" class="ui-layout-content ui-widget-content"
			style="padding: 0px;">
			<div>
			<ul style="height: 32px; overflow: hidden; border: 0px;">
			
			</ul>
			<div class="hh_tabButtonLeft"></div>
			<div class="hh_tabButtonRight"></div>
			</div>
		</div>
	</div>

	<div class="ui-layout-west" style="display: none;">
		<div id="accordion1" class="basic">
			<%
				List<SysMenu> menuList = hhXtYh.getMenuList();
					int i = 0;
					for (SysMenu hhXtCd : menuList) {
						if ("root".equals(hhXtCd.getNode())) {
			%>
			<h3 <%=i == 0 ? "style='margin:0px;' " : ""%>>
				<img src="<%=hhXtCd.getIcon()%>" />&nbsp;<a href="#"><font
					size=2><%=hhXtCd.getText()%></font></a>
			</h3>
			<div style="padding: 0px;">
				<!-- <ul id="" class="ztree"></ul> -->
				<span xtype=menu id="<%=hhXtCd.getId()%>"
					configVar="menu['<%=hhXtCd.getId()%>']"></span>
			</div>
			<%
				i++;
					}
				}
			%>
		</div>
	</div>

	<span xtype=menu id="closerightmenu" configVar="closerightmenu"></span>
	<span xtype="rightMenu" configVar="bodyRightMenu"></span>
</body>
</html>
