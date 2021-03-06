<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/back/comm.css" />
    <script type="text/javascript" src="<%=path%>/thirdparts/time-text/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
    <script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=path%>/resources/js/calendar.js"></script>
    
	<script type="text/javascript">
    	function addEmp(){
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/adminuser/add.do",
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data.result==true){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					art.dialog.close();
    				}else{
    					alert(data.message);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("新增员工失败，请重试");
                }  
    		});
    	}
    </script>
    
</head>
<body>
<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="员工基本信息">
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
               
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>员工账户：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="adminname" />
                            <form:errors path="*"></form:errors>
                        </td>
                    </tr>
                     
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>所属角色：</td>
                        <td class="white-tr">
                            <select name="roleid">
                        	<option value="-1">请选择角色</option>
                        		<c:forEach items="${roleList}" var="role">
                        			<%-- <c:if test="${role.roleid==emp.roleid }"> --%>
                        			<option  value="${role.roleid}">${role.rolename}</option>
                        			<%-- </c:if> --%>
                        		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                    
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>登录密码：</td>
                        <td class="white-tr">
                            <input type="password" class="form-text" id="txtdeptname" name="adminpass" />
                        </td>
                    </tr>
                    
                </table>
            </div>
        </div>
    </div>
</form>	
</body>
</html>