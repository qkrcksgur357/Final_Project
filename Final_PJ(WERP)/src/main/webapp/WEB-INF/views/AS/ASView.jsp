<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ASview 페이지 입니다</title>
<link rel="stylesheet" href="/spring/resources/css/common.css">
<style>
h1 {
	text-align: center;
}

#container {
	position: relative;
	width: 900px;
	margin: 0 auto;
}

.body {
	margin: 0;
	padding: 0;
	height: 100%;
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
	color: white;
}

th, td {
	border-bottom: 2px solid #12192c;
	padding: 5px;
}

th:first-child, td:first-child {
	border-left: none;
	border-right: none
}

body {
	margin-top: 200px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6 text-align: center;
}

.btn {
	width: 85px;
	height: 30px;
	cursor: pointer;
	background-color: #1A1A3A;
	border: 0px;
	color: white;
	-webkit-border-radius: 8px;
	margin-left: 10px;
}

#deleteBtn {
	display: inline;
	float: bottom;
}

.btn:hover {
	cursor: pointer;
	transform: translateY(3px);
	box-shadow: 0px 0px 0px;
}

.btn:active {
	box-shadow: 2px 3px 9px inset;
	transform: translateY(6px);
}

.productInfoBtn {
	width: 130px;
	height: 30px;
	cursor: pointer;
	background-color: #1A1A3A;
	border: 0px;
	color: white;
	-webkit-border-radius: 8px;
	margin-left: 10px;
}

.productInfoBtn:hover {
	transform: translateY(3px);
	box-shadow: 0px 0px 0px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="container">
		<div id="update" class="div">
			<br /> <br /> <br /> <br />
			<p>AS 상세조회 > ${AS.customer}님</p>
			<form action="${pageContext.request.contextPath}/AS/updateAS.do"
				method="post">

				<input type="hidden" name="asCode" value="${AS.asCode}" />
				<table id="tbl-as" border="1" style="text-align: center">
					<tr>
						<th style="width: 180px">접수일</th>
						<th style="width: 100px">고객명</th>
						<th style="width: 200px">품목코드</th>
						<th style="width: 200px">제목</th>
						<th style="width: 330px">접수내용</th>
						<th style="width: 120px">수리예정일</th>
						<th style="width: 230px">접수현황(단계)</th>
					</tr>
					<tr id="${AS.asCode}">
						<td>${AS.asDate}</td>
						<td>${AS.customer}</td>
						<td>${AS.proCode}</td>
						<td>${AS.asTitle}</td>
						<td>${AS.asContent}</td>
						<td><input type="date" name="date"
							value="${AS.asExpectedDate}" /></td>
						<td><select name="stage">
								<option value="접수 대기">접수 대기</option>
								<option value="접수 완료">접수 완료</option>
								<option value="수리 진행">수리 진행</option>
								<option value="수리 완료">수리 완료</option>
								<option value="전달 완료">전달 완료</option>
						</select></td>
					</tr>
				</table>
				<br /> <input type="button" class="productInfoBtn"
					id="productInfoBtn" value="상품 정보 확인"
					onclick="location.href='${pageContext.request.contextPath}/AS/productInfo.do?proCode=${AS.proCode}' + '&' + 'asCode=${AS.asCode}'" />
				<input type="submit" class="btn" value="수정" /> 
				<input type="button" class="btn" id="deleteBtn" value="삭제"
					onclick="location.href='${pageContext.request.contextPath}/AS/deleteAS.do?asCode=${AS.asCode}'" />
			</form>
			<br />
		</div>
	</div>




	<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 외부 아이콘 사용 -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS파일 불러오기 -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
</body>
</html>