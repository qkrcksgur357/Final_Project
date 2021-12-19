<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 현황 조회</title>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<link rel="stylesheet" href="/spring/resources/css/common.css">
<style>
.pagination {
 display: flex;
 padding-left: 0;
 list-style: none;
 border-radius: 0.25rem;
 margin: 0 auto;
}

.page-item.active .page-link {
 z-index: 1;
 color: #12192c;
 background-color: #fff;
 border-color: #12192c;
}

li.page-item.disabled>.page-link {
color: #fff;
display: inline-block;
background : #12192c;
padding: 7px;
border: 1px solid #12192c;
font-size: 13px;
cursor: pointer;
}

.page-item>a.page-link {
color: #fff;
display: inline-block;
padding: 7px;
background: #12192c;
border: 1px solid #12192c;
font-size: 13px;
cursor: pointer;
}

.pagination {
 margin-top: 30px;
 margin-left: 600px;
}


h1 {
	text-align: center;
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
<link rel="stylesheet" href="/spring/resources/css/sidebar.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h1>입고 현황 조회</h1>
	<div id="container">
	<div id="inView" class="in-view-content">
	
			<br />
			<p>총 입고 건수: ${totalIn}</p>
			<table id="in-tbl" border="1" style="text-align: center" >
				<tr>
					<th>품목코드</th>
					<th>품목명</th>
					<th>카테고리</th>
					<th>입고수량</th>
					<th>입고단가</th>
					<th>입력일</th>
				</tr>
				
				<c:forEach items="${inlist}" var="InManagement">
					<tr id="${InManagement.incode}">
						<td>${InManagement.procode}</td>
						<td>${InManagement.proname}</td>
						<td>${InManagement.category}</td>
						<td>${InManagement.inNum}</td>
						<td>${InManagement.inPrice }</td>
						<td>${InManagement.inputDate}</td>	
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 외부 아이콘 사용 -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS파일 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script>
	$(function(){
		$("tr[id]").on("click",function(){
				var procode = $(this).find('td').eq(0).html();
				var incode = $(this).attr("id");
				var inNum = $(this).find('td').eq(3).html();
				
				console.log("procode=" + procode);
				console.log("incode=" + incode);
				console.log("inNum=" + inNum);
				
				
				ok = confirm("해당 입고건을 삭제하시겠습니까?");
				
				if(ok){
					alert("해당 입고건이 삭제되었습니다.");
					location.href = "${pageContext.request.contextPath}/in/inDelete.do?incode="+incode + "&" + "inNum=" + inNum + "&" + "procode=" +  procode ;
					
				}
		});
	});
	</script>
	<c:out value="${pageBar}" escapeXml="false"/>
</body>
</html>