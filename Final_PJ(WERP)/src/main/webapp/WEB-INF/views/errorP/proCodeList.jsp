<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<html>
<head>
	<meta charset="UTF-8">
	<title>품목 검색</title>
	<link rel="stylesheet" href="/spring/resources/css/common.css">

	<style>


table {
	font-family:Arial, Helvetica, sans-serif;
	color:#black;
	font-size:13.5px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin-top: 10px;
	margin-right: auto;
	border:#ccc 1px solid;


	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
.top td {
	padding:15px;
 	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
	text-align: center;
	font-weight: bold;
}
.top td:first-child{
	text-align: center;
}
table tr:first-child .top td:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;

}
table tr:first-child .top td:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
	padding-left:20px;
}

table tr td {
	padding:12px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	text-align: center;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}

table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
	
#btn-add {
 color: #fff;
 background-color: #007bff; 
 border: 1px solid #ffffff;
}

#search-form {

margin-left : 280px;

}

.btn { 
width: 150px;
height: 50px;

}

.navbar-form {

margin-left: 0;

}

.even {
cursor: pointer;
}

.search-option {
width: 80px;
height: 25px;
text-align: left;
border: 2px solid #999;
}

.search-input {
width: 200px;
height: 23px;
border: 2px solid #999;
}

.search-btn {
 
width: 33px;
height: 33px;
}

.procode {
color: blue;
}
input:-ms-input-placeholder {color:#a8a8a8; } 
input::-webkit-input-placeholder {color:#a8a8a8;} 
input::-moz-placeholder {color:#a8a8a8;} 
	</style>
	<script type="text/javascript">
	
		
		$(function(){
			$("tr[id]").on("click",function(){
			   var tr = $(this);
			   var td = tr.children();
			 
				var procode = $(this).attr("id");
			    var proname = td.eq(1).text();
			    
				 	
				opener.document.getElementById("procode").value = procode;
				opener.document.getElementById("proname").value = proname;
				close();				
				
			});
		});
		



	
	
		
			
		
	</script>
	
</head>
<body>
	
	
	<%-- 검색 jsp --%> 
	<form class="navbar-form">
  <div class="form-group navbarleft">
    <select class= "search-option" name="key">
    <option value="CODE" ${(key == "NO")?"selected":"" }>품목코드</option> 
	<option value="NAME" ${(key == "NAME")?"selected":"" }>품목명</option>
	</select>
   <input type="text" id="search-input" class="search-input" placeholder="검색어를 입력해주세요." name="word" value="${word}">
    <button class="search-btn" type="submit"><i class="fas fa-search" ></i>	</button>
        <i class="glyphicon glyphicon-search"></i>
    </div>
     
      </button>
</form>

<%-- 검색 jsp --%>
	
				<table classpacing='0'>
				<colgroup>
				<col width="250px">
				<col width="250x">
			
					
				</colgroup>
				
					<tr class="top">
					
						<td>상품코드</td>
						<td>상품명</td>
					
						
					</tr>
				
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.procode}" class="even">
				
						<td class="procode">${b.procode}</td>
						<td id="${b.proname}" class= "proname">${b.proname}</td>
							
				
					</tr>
					</c:forEach>
					
				</table>
				
				
				
	
	
</body>
</html>