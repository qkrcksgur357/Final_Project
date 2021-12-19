<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>품목 관리</title>
	<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
	<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
	<link rel="stylesheet" href="/spring/resources/css/common.css">
	<style>
	   h1{
      text-align:center;
   }
   
   #container {
      position: relative;
      width: 700px;
      margin: 0 auto;
  } 
   
   .body {
      margin: 0;
      padding: 0;
      height: 100%;
   }
   
   .inform{
      border-radius: 5px;
      width: 100px;
      height : 40px;
      font-size : 15px;
      background-color: #12192c;
      color : white;
      border : 0;
      outline : 0;
      float : bottom;
      display : inline-block;
      
   }
   
   #insert_Btn{
      float: right;
      width: 100px;
      height: 32px;
      margin : auto;
    }
  
   #insertbtntd{
   	border-bottom: none;
   }
   table {
         border-collapse: collapse;
         border-top: 2px solid #12192c;
         width: 80%;
         border-left : none;
         border-right : none;
         
   }

   th {
         font-weight: bold;
         background-color: #12192c;
         color : white;
         width : 200px;
   }

   th, td {
         border-bottom: 2px solid #12192c;
         padding: 5px;
   }
   

   body {
      margin-top: 200px;
      font-family: 'Trebuchet MS', serif;
      line-height: 1.6
      text-align : center;
   }
	</style>

	
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h1>품목 등록</h1>
	<br /><br />
	<div id ="container">
	<div id="indiv1">
	 <div class="admin_content_main">
                    	<form action="${pageContext.request.contextPath}/pd/pdEnroll" method="post" id="enrollForm">
                    		<table>
                    		<tr>
                    			<th>품목코드</th>
                    			<td><input name="procode"/></td>
                    		</tr>
                    		<tr>
                    			<th>품목명</th>
                    			<td><input name="proname"/></td>
                    		</tr>
                    		<tr>
                    			<th>카테고리</th>
                    			<td><input name="category" /></td>
                    		</tr>
                    		<tr>
                    			<th>입고단가</th>
                    			<td><input name="inprice" /></td>
                    		</tr>
                    		<tr>
                    			<th>출고단가</th>
                    			<td><input name="outprice" /></td>
                    		</tr>
                    		<tr>
                    			<th>입력일</th>
                    			<td><input name="inputdateStr" placeholder="yyyy-MM-dd 로 입력해주세요"/></td>
                    		</tr>
                    		<tr>
                    			<th>재고수량</th>
                    			<td><input name="stock"/></td>
                    			 
                    		</tr>
                    		
                    		</table>
                    		<table>
                    		<tr></tr>
                    			<td id=insertbtntd><input type="submit" class="inform" id="insert_Btn" value="등록" /></td>	
                    		</table>
                    		
                    		          
							
                    		
                   		</form>
	</div>
	</div>
	</div>  
	<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 외부 아이콘 사용 -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS파일 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
</body>
</html>