<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js" language="javascript"></script>
	<script type="text/javascript">
	
	$(function() {
		$("#formadd").validate();
	});
	
    	function AddS(){
    		var name =$("#name").val();
    		var url =$("#url").val();
    		var status =$("#status").val();
    		var serverStatus =$("#serverStatus").val();
    		var defaultStatus =$("#defaultStatus").val();
    		var loadStatus =$("#loadStatus").val();
    		var serverArea =$("#serverArea").val();
    		if(name==null || name==""){
    			alert("服务器名称不能为空！");
    			
    			return false;
    		}
    		if(url==null || url==""){
    			alert("服务器地址不能为空！");
    			
    			return false;
    		}
    		/* if(status!=1 ||status!=0){
    			alert("服务器开启状态不能为空！");
    			
    			return false;
    		}
    		if(serverStatus!=1 ||serverStatus!=2){
    			alert("服务器状态不能为空！");
    			
    			return false;
    		}
    		if(defaultStatus!=1 ||defaultStatus!=2){
    			alert("服务器默认状态不能为空！");
    			
    			return false;
    		}
    		if(loadStatus!=1||loadStatus!=2||loadStatus!=3){
    			alert("服务器加载状态不能为空！");
    			
    			return false;
    		} */
    		if(serverArea==null || serverArea==""){
    			alert("服务器区不能为空！");
    			
    			return false;
    		}
    		
    		
    		
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/gameServer/addServer",
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data=="length"){
    					alert("所填的区已超10个");
    				}
    				if(data=="ok"){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					art.dialog.close();
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    				}else{
    					
    					alert("新增失败");
    					
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("新增服失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

   
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="服基本信息">
      
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>服务器名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="name" name="name" />
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>分布服务器：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="url" name="url" />
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>是否开启：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="status" value="1" name="status" />是
                            <input type="radio" class="" id="status" value="0" name="status" />否
                        </td>
                    </tr> 
                   
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>服务器状态：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="serverStatus" value="1" name="serverStatus" />测试服
                            <input type="radio" class="" id="serverStatus" value="2" name="serverStatus" />正式服
                        </td>
                    </tr> 
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>服务器默认：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="defaultStatus" value="1" name="defaultStatus" />默认服务器
                            <input type="radio" class="" id="defaultStatus" value="2" name="defaultStatus" />非默认服务器
                        </td>
                    </tr> 
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>服务器承载状态：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="loadStatus" value="1" name="loadStatus" />维护
                            <input type="radio" class="" id="loadStatus" value="2" name="loadStatus" />流畅
                            <input type="radio" class="" id="loadStatus" value="3" name="loadStatus" />火爆
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>服务器特殊状态：</td>
                        <td class="white-tr">
                            <input type="checkbox" class="" id="specialStatus" value="1" name="specialStatus" />推荐
                            <input type="checkbox" class="" id="specialStatus" value="2" name="specialStatus" />新服
                        </td>
                    </tr>
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>区：</td>
                        <td class="white-tr">
                            S<input type="text" class="" id="serverArea" value="" name="serverArea" />区
                            
                        </td>
                    </tr>	
						
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>开始时间：</td>
                        <td class="white-tr">
                            <input type="text" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',autoPickDate:true,minDate: '%y-%M-%d 00:00:00'})" class="form-text" id="txtdeptname" name="beginTime" />
                        </td>
                    </tr>
            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>