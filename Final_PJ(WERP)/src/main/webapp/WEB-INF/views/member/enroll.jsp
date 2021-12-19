<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/spring/resources/css/common.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.backstretch.min.js"></script>
<style>
*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box; 
 }
#wrap{
border: 2px solid gray;
    border-radius: 15px;
    padding: 15px;
    background:darkgray;
}
select{
width: 520px;
    border-radius: 15px;
    padding: 2px 5px 2px 5px;
   }
  input[type="submit"],input[type="reset"]{
 padding: 5px;
    margin: 10px 15px 0px 15px;
    width: 150px;
    border-radius: 15px;
  }
  
</style>
</head>
<body>
<div id="container">
	<section id="enroll-content">
		<div id="wrap">
			<div id= enroll-title>
		회원가입
	</div>
	<div id="enroll-container">
				<form name="enrollForm" action="enrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
					<table>
						<tr>
							<th>Id</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="4글자이상" name="userId" id="userId_" required>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능</span>
				            		<span class="guide error">사용 불가</span>
				            		<span class="guide invalid">4글자 미만</span>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				            	</div>
							</td>
						</tr>
						<tr>
							<th>Password</th>
							<td>
								<input type="password" class="form-control" name="userPwd" id="userPwd_" required>
							</td>
						</tr>
						<tr>
							<th>Password Confirm</th>
							<td>	
								<input type="password" class="form-control" id="userPwd2" onchange="pwdCheck()" required>
								<input type="hidden" id="checkResult" value="false">
							</td>
						</tr>  
						<tr>
							<th>Name</th>
							<td>	
							<input type="text" class="form-control" name="empName" id="empName" required>
							</td>
						</tr>
						<tr>
							<th>Gender </th>
							<td>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked style="width:15px;">
									<label for="gender0" style="color:white">남</label>
									<input type="radio" class="form-check-input" name="gender" id="gender1" value="F" style="width:15px;">
									<label for="gender1" style="color:white">여</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>Email</th>
							<td>	
								<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
							</td>
						</tr>
						<tr>
							<th>Phone</th>
							<td>	
								<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11"  required>
							</td>
						</tr>
						<tr>
							<th>Address</th>
							<td>	
								<input type="text" class="form-control" placeholder="" name="address" id="address">
							</td>
						</tr>
						<tr>
							<th>No</th>
							<td>
								<input type="text" class="form-control" name="empNo" id="empNo_" required>
							</td>
						</tr>
						<tr>
							<th>Dept</th>
							<td>	
								<select name=dept>
									<option value='' selected>---부서 선택---</option>
									<option value='인사관리부' >인사관리부</option>
									<option value='회계관리부' >회계관리부</option>
									<option value='재고관리부'>재고관리부</option>
								</select>
							</td>
						</tr> 
						<tr>
							<th>Position </th>
							<td>
								<select name=position>
									<option value='' selected>---직급 선택---</option>
									<option value='사원'>사원</option>
									<option value=' 팀장'>팀장</option>
									<option value='과장'>과장</option>	
								</select>
							</td>
						</tr>
					</table>
					<input type="submit" class="btn btn-outline-success" value="가입" >
					<input type="reset"  class="btn btn-outline-danger" value="취소" onclick="back();">
				</form>
			</div>
			<script>
			$(function(){
				$.backstretch([
					"/spring/resources/image/ERP2.JPG","/spring/resources/image/ERP3.JPG","/spring/resources/image/ERP.JPG"
				],{duration:3500,fade:750});
				/* 아이디 중복검사 이벤트 추가 */
				$("#userId_").on("keyup", function(){
			        var userId = $(this).val().trim();
			        
			        if(userId.length<4) {
			        	$(".guide.error").hide();
			        	$(".guide.ok").hide();
			        	$(".guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/checkIdDuplicate.do",
				            data : {userId:userId},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $(".guide.error").hide();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $(".guide.error").show();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     //console.log(userId);
				});
			});
			var pwd=document.getElementById("userPwd_");
			var pwd2=document.getElementById("userPwd2");
			var result=document.getElementById("checkResult");
			var phone=document.getElementById("phone");
			function back(){
				window.location.href="${pageContext.request.contextPath}/";
			}	
			function pwdCheck(){
					console.log("pwd: "+pwd.value);
					console.log("pwd2: "+pwd2.value);
					if(pwd2.value==pwd.value){
						result.value="true";
					}else{
						result.value="false";
					}
					
					console.log("result: "+result.value);
				}
			function fn_enroll_validate(){
					if(result.value=="false"){
						return false;	
					}
					if(phone.value.length!=11){
						alert("전화번호가 올바르지 않은 형식입니다.");
						return false;
					}
				}
			function validate(){
				var userId = $("#userId_");
				if(userId.val().trim().length<4){
					alert("아이디는 최소 4자리이상이어야 합니다.");
					userId.focus();
					return false;
				}				
				return true;
			}
			</script>
	
		</div>
	</section>
</div>
</body>
</html>