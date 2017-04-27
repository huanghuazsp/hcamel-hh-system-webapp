<%@page import="com.hh.usersystem.service.impl.MenuService"%>
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

	if (Check.isNoEmpty(headpic) && !headpic.startsWith("/hhcomm")) {
		headpic = "system-File-download?params={id:'" + headpic + "'}";
	}

	if (Check.isNoEmpty(headpic)) {
		headpic = " <img id='headpicimg' onClick='' style=\"cursor: pointer;\" width=\"30\"		height=\"30\"		src=\""
				+ headpic + "\" />";
	} else {
		headpic = "<img id='headpicimg' style=\"cursor: pointer;\" width=\"30\"		height=\"30\"		src=\"/hhcommon/images/icons/user/100/no_on_line_user.jpg\" />";
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
<%=SystemUtil.getMobileBaseJs()%>
<%=SystemUtil.getUser()%>
<style type="text/css" media="screen">
.ui-page {backface- visibility :hidden;-webkit-backface- visibility :hidden;-moz-backface-
	visibility :hidden;
	
}

.ui-dialog-contain {
	width: 92.5%;
	max-width: 500px;
	margin: 10% auto 15px auto;
	padding: 0;
	position: relative;
	top: -15px;
}
</style>

</head>
<body>
		<%=SystemUtil.getMobileHead("") %>
		<div data-role="content">
			<span id="messDivspan" xtype="pagelist" configVar=" pagelistConfig "></span>
		</div>
		<script type="text/javascript">
		function init() {
			messageInit();
		}
		
		var pagelistConfig = {
				itemRender:function(data){
					if(data.img){
						return '<table width=100% liid="'+data.id+'"><tr><td><img width=20px height=20px src="'+data.img+'" class="ui-li-icon"/>&nbsp;'+data.text+'</td><td style="text-align:right;" litype=rightText>'+(data.rightText||'')+'</td></tr></table>';
					}else{
						return data.text;
					}
					
				},
				itemClick:function(data){
					console.log(data);
				}
		}
		
		
		var timeoutTime = 3;
		var errorlength = 0;
		function messageInit() {
			$.ajax({
				type : "POST",
				url : "message-SysMessage-poll",
				dataType : "json",
				timeout : 70000, //超时时间,设置为60s.
				data : {
					timeout : timeoutTime
				},
				success : function(result) {
					if (timeoutTime == 3) {
						timeoutTime = 60;
						renderAllMessage(result.allMessage)
					}
					for (var i = 0; i < result.length; i++) {
						showMessage2(result[i]);
					}
					messageInit();
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					if (errorlength > 6) {
						errorLoad();
					} else {
						setTimeout(messageInit, 2000)
					}
					errorlength++;
				}
			});
		}
		function renderAllMessage(allMessage) {
			for (var i = 0; i < allMessage.length; i++) {
				if (allMessage[i].count) {
					allMessage[i].rightText = '<font class="hh_red">'
							+ allMessage[i].count + '</font>';
				}
				convertMenuImg(allMessage[i]);
			}
			renderMessDivspan({
				data : allMessage
			});
		}

		
		function convertMenuImg(data){
			if(data.sendObjectType==0){
				var headpic = data.headpic || '/hhcommon/images/icons/user/100/no_on_line_user.jpg';
				if (data.headpic && data.headpic.indexOf("/hhcomm")==-1) {
					headpic = "system-File-download?params={id:'" + headpic + "'}";
				}
				data.img=headpic
			}else if(data.sendObjectType==6 || data.sendObjectType==7){
				data.img='/hhcommon/images/icons/group/group.png';
			}else if(data.sendObjectType==2){
				data.img='/hhcommon/images/icons/user/group.png';
			}else if(data.sendObjectType==1){
				data.img='/hhcommon/images/myimage/org/org.png';
			}else if(data.sendObjectType==11){
				data.img='/hhcommon/images/icons/email/email.png';
			}else if(data.sendObjectType==12){
				data.img='/hhcommon/images/extjsico/txt.gif';
			}else if(data.sendObjectType==13){
				data.img='/hhcommon/images/icons/newspaper/newspaper.png';
			}else if(data.sendObjectType==14){
				data.img='/hhcommon/images/icons/telephone/telephone.png';
			}
			
		}
		
		function renderMessDivspan(data){
			if(data){
				$('#messDivspan').getWidget().loadData(data);
			}
		}
		
		function showMessage2(result) {
			var message = result.message;
			if (message && message.message) {
				renderMsg(message);
			}

			var allMessage = result.allMessage;
			if (allMessage) {
				renderAllMessage(allMessage);
			}
		}
		
		function renderMsg(message) {
			var selectData = $('#userdiv').data('data');
			if (selectData && (message.objectId == selectData.id)) {
				appendMessage(message);
			} else {
				var li = $('#messDivspan').find('[liid=' + message.objectId + ']');
				if (li.length > 0) {
					var count = $.hh.toInt(li.find('[litype=rightText]').text());
					var rightText = '<font class="hh_red">' + (count + 1)
							+ '</font>';
					li.find('[litype=rightText]').html(rightText);
				} else {
					var ul = $('#messDivspan').find('ul');

					var objectId = '';
					var objectName = '';
					var objectHeadpic = '';

					if (message.sendObjectType == 0) {
						objectId = message.sendUserId;
						objectName = message.sendUserName;
						objectHeadpic = message.sendHeadpic;
					} else {
						objectId = message.toObjectId;
						objectName = message.toObjectName;
						objectHeadpic = message.toObjectHeadpic;
					}

					var data = {
						id : objectId,
						text : objectName,
						headpic : objectHeadpic,
						sendObjectType : message.sendObjectType,
						rightText : '<font class="hh_red">1</font>'
					};
					
					convertMenuImg(data);

					var dataList = $('#messDivspan').data('data');
					dataList.unshift(data);
					renderMessDivspan({
						data : dataList
					});

					Request.request('usersystem-user-addCylxrObject', {
						data : {
							'paramsMap.yhId' : loginUser.id,
							'paramsMap.cylxrId' : data.id,
							'paramsMap.cylxrName' : data.text,
							'paramsMap.headpic' : data.headpic,
							'paramsMap.type' : data.sendObjectType
						},
						defaultMsg : false
					});

				}
			}
		}
		</script>
	<%=SystemUtil.getMobileDown() %>
</body>
</html>
