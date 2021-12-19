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
<link rel="stylesheet" href="/spring/resources/css/common.css">
<style>

h1 {
	text-align: center;
}

#container {
	position: relative;
	width: 700px;
	margin: 0 auto;
}

#modify_Btn, #delete_Btn {
      border-radius: 5px;
      width: 100px;
      height : 32px;
      font-size : 15px;
      background-color: #12192c;
      color : white;
      border : 0;
      outline : 0;
      float : right;
      display : inline-block;
      margin-left: 30px;
      margin-top: 30px;
}
    
.body {
	margin: 0;
	padding: 0;
	height: 100%;
}

.inputArea{
	magin-top: 500px;
}


div {
	border-top-left-radius: 0px;
	border-top-right-radius: 13px;
	border-bottom-left-radius: 13px;
	border-bottom-right-radius: 13px;
}

tr:nth-child(n+2):hover {
	background-color: #d3d3d3;
	cursor: pointer;
}

table {
	border-collapse: collapse;
	border-top: 2px solid #12192c;
	width: 100%;
	border-left: none;
	border-right: none;
}

th {
	font-weight: bold;
	background-color: #12192c;
	color : white;
}

th, td {
	border-bottom: 2px solid #12192c;
	padding: 5px;
	border-left: none;
	border-right: none;
}

body {
	margin-top: 200px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6 text-align: center;
}
</style>


</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h1>품목 상세조회</h1>
	<br /><br />
	<div class="admin_content_main">
	<div id ="container">
	<div id="indiv1" class="in-view-content">	
		
			<div class="form_section">
				<form role="form" action="${pageContext.request.contextPath}/pd/modify" 
				      method="post" autocomplete="off">
				<input type="hidden" name="n" value="${pd.procode}" />
				<table id="in-tbl" border="1" style="text-align : center">
				<tr>
					<th>품목코드</th>
					<td><span>${pd.procode}</span></td>
					
				</tr>
				<tr>
					<th>품목명</th>
					<td><span>${pd.proname}</span></td>
					
				</tr>
				<tr>
					<th>카테고리</th>
					<td><span>${pd.category}</span></td>
					
				</tr>
				<tr>
					<th><label for="inprice">입고단가</label></th> 
					<td><span><fmt:formatNumber value="${pd.inprice}" pattern="###,###,###원" /></span></td>
					
				</tr>
				<tr>
					<th><label for="outprice">출고단가</label></th> 
					<td><span><fmt:formatNumber value="${pd.outprice}" pattern="###,###,###원" /></span></td>
					
				</tr>
				<tr>
					<th>재고수량</th>
					<td><span>${pd.stock}</span></td>
					
				</tr>
				</table>
	
					<div class="inputArea">
						<button type="submit" id="modify_Btn" class="btn btn-warning">수 정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger" onclick="deletePd();">삭 제</button>
					</div>
					
						<script>
							var formObj = $("form[role='form']");
/* 
							$("#modify_Btn").click(function() {
								formObj.attr("action", "${pageContext.request.contextPath}/pd/modify");
								formObj.attr("method", "get");
								formObj.submit();
							});
 */
							function deletePd() {
								location.href = '${pageContext.request.contextPath}/pd/delete?n=${pd.procode}';
							};
							
							$("#delete_Btn").click(function(){
								 
								 var con = confirm("정말로 삭제하시겠습니까?");
								 
								 if(con) {      
								  formObj.attr("action", "/pd/delete");
								  formObj.submit();
								 }
								});
						</script>
					

				</form>
			</div>

		
	</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 외부 아이콘 사용 -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS파일 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
</body>
</html>