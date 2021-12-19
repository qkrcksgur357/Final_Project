<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
<link rel="stylesheet" href="/spring/resources/css/common.css">
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<style>
#buttonDiv {
	width: 500px;
	margin: 0 auto;
	padding: 0 auto;	
	color: white;
}

#buttonDiv input {
	margin: 0px 5px 0px 5px;
    border-radius: 15px;
    height: 40px;
    background: #12192c;
    color: white;
    font-size: 1.0vw;
    font-weight: bold;
}

.btn btn-outline-succes {
	color: white;
	width: 50px;
	background: red;
}

</style>
</head>
<c:import url="../common/header.jsp"/>
<c:import url="../common/sidebar.jsp"/>
<div id="contents">
	<section id="personalInfo">
		<div id="update-container">
			<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/memberUpdate.do" method="post" onsubmit="return fn_update_validate();" id="updateForm" >
				<table id="updateTable">
					<thead>
						<th>${member.empName} 님의 정보
					</thead>
					<tr>
						<th>Id</th>
							<td>
								<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" value="${member.userId}" readonly required>
							</td>
					</tr>
					<tr>
						<th>Password</th>
							<td>
								<input type="password" class="form-control" name="userPwd" id="userPwd" required>
							</td>
					</tr>
					<tr>
						<th>Name</th>
							<td>	
								<input type="text" class="form-control" placeholder="이름" name="userName" id="userName" value="${member.empName}"  readonly required>
							</td>
					</tr>	
					<tr>
							<th>Gender </th>
							<td>
								<select class="form-control" name="gender" required>
								  <option value="" disabled selected>성별</option>
								  <option value="M" ${member.gender=='M'?'selected':'' }>남</option>
								  <option value="F" ${member.gender=='F'?'selected':'' }>여</option>
								</select>
							</td>
					</tr>
					<tr>
							<th>Email</th>
							<td>	
								<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${member.email}" required>
							</td>
						</tr>
						<tr>
							<th>Phone</th>
							<td>	
								<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${member.phone}" required>
							</td>
						</tr>
						<tr>
							<th>Address</th>
							<td>	
								<input type="text" class="form-control" placeholder="주소" name="address" value="${member.address}" id="address">
							</td>
						</tr>
				</table>
				<br />
				<div id="buttonDiv">
					<input type="submit" class="btn btn-outline-success" value="수정" >
					<input type="button" class="btn btn-outline-success" onclick="cancel();" value="취소">
					<input type="button" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/memberDelete.do'" value="탈퇴">
	
				</div>
			</form>
		</div>
	</section>
</div>
<script>
	function fn_update_validate(){
	var phone=document.getElementById("phone");
		if((phone.value.length!=11)&&(phone.value!="${member.phone}")){
			alert("전화번호가 올바르지 않은 형식입니다.");
			return false;
		}
	}
</script>
<c:import url="../common/footer.jsp"/>
</html>