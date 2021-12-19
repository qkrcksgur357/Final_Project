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
	<title>품질검사 요청건</title>
	<link rel="stylesheet" href="/spring/resources/css/common.css">

	<style>
	li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.pagination {
    display: flex;
    padding-left: 0;
    list-style: none;
    border-radius: 0.25rem;
}

.page-item.active .page-link {
    z-index: 1;
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

li.page-item.disabled>.page-link {
	color: black;
	display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #999;
    font-size: 12px;
    cursor: pointer;
}

li.page-item {
height:40px;
}

.page-item>a.page-link {
	display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #999;
    font-size: 12px;
    cursor: pointer;
    height: 40px;
}

.pagination  {       

margin-top: 5px; 
margin-left: 705px;

}

table {
	font-family:Arial, Helvetica, sans-serif;
	color:black;
	font-size:13.5px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin-top: 10px;
	margin-left: 200px;
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

.procode {
color: blue;
cursor : pointer;
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
	cursor: pointer;
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

.qualityi-search {
margin-left: 280px;
font-weight: bold;

}

#location-tag { 
margin-top: 90px;
margin-left: 150px;

}

#location-tag > a {
color: blue;
}
.qualityi-btn {
margin-left: 250px;
margin-top: 5px;
}
.qualityi-btn>input  {

width:70px;
height:30px;
border: 1px solid gray;
background: #eaebec;
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

margin-left: 250px;

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
input:-ms-input-placeholder {color:#a8a8a8; } 
input::-webkit-input-placeholder {color:#a8a8a8;} 
input::-moz-placeholder {color:#a8a8a8;} 

#state-color {
color: red;


}


	</style>
	
	
	

	
	<script>
		function fn_goqualityiForm(){
			var url="${pageContext.request.contextPath}/qualityI/qualityIForm.do";
			var name = "popup";
			var _width = '840';
		    var _height = '690';				 			    
		    var _left = Math.ceil(( window.screen.width - _width )/2 + 50);
		    var _top = Math.ceil(( window.screen.height - _height )/2); 			
			window.open(url,name,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
		}
		
		
		
		$(function(){
			$("td[id]").on("click",function(){
				var qualityiNo = $(this).attr("id");
				var url = "${pageContext.request.contextPath}/qualityI/qualityIView.do?qualityiNo="+qualityiNo;
				var name = "popup";
			    var _width = '840';
			    var _height = '650';				 			    
			    var _left = Math.ceil(( window.screen.width - _width )/2 + 50);
			    var _top = Math.ceil(( window.screen.height - _height )/2); 			
				window.open(url,name,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);

				
			});
		});
		
		function allChecked(target){
			
			if($(target).is(":checked")){
				//체크박스 전체 체크
				$(".chk").prop("checked", true);
			}
			
			else{
				//체크박스 전체 해제
				$(".chk").prop("checked", false);
			}
		}
		
		//자식 체크박스 클릭 이벤트
		function cchkClicked(){
			
			//체크박스 전체개수
			var allCount = $("input:checkbox[name=cchk]").length;
			
			//체크된 체크박스 전체개수
			var checkedCount = $("input:checkbox[name=cchk]:checked").length;
			
			//체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 체크박스 전체 체크
			if(allCount == checkedCount){
				$(".chk").prop("checked", true);
			}
			
			//같지않으면 전체 체크박스 해제
			else{
				$("#allCheckBox").prop("checked", false);
			}
		}

		function SelectDelete(){
			
			
			var procode = new Array();
			$("input:checkbox[name='cchk']:checked").each(function() {
				procode.push($(this).val());
			});
			console.log(procode);
			if( procode.length >= 1 ) {
			if(confirm("삭제하시겠습니까?")){
				
				$.ajax({
			        type : 'post'
			       ,url : '${pageContext.request.contextPath}/qualityI/qualityIDelete.do'
			        ,data : { cchk : procode }
			       ,dataType : 'text'
			       ,success : function(data) {
						
						location.reload();
						alert("삭제 되었습니다.");
						
			       }
			      
			   })	
		
		}
			}
			
			else {
				alert("체크박스를 선택하세요.");
			}
		}	
		
		
		function Alldelete() {	
			if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/qualityI/qualityIAlldelete.do',			
				dataType : 'text',
				success : function(data) {
					
					location.reload();
					alert("삭제 되었습니다.");
					
		       }
			
			
			})
			}
			
		}

	
		
			
		
	</script>
	
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/sidebar.jsp"/>
	
	
	<div id="location-tag">
	<a href="#">품질관리</a> >
	<a href="#">품질검사 요청건</a>
	</div>
	<br>
	
	<%-- 검색 jsp --%> 
	<form class="navbar-form">
  <div class="form-group navbarleft">
  
  <select class= "search-option" name="key">

<%--페이지 이동시에도 옵션 유지 --%>
<option value="DATE" ${(key == "DATE")?"selected":"" }>날짜</option> 
<option value="MANAGER" ${(key == "MANAGER")?"selected":"" }>담당자</option>
<option value="CODE" ${(key == "CODE")?"selected":"" }>품목코드</option> 
<option value="NAME" ${(key == "NAME")?"selected":"" }>품목명</option>

</select>

   <input type="text" class="search-input" placeholder="검색어를 입력해주세요." name="word" value="${word}">
    <button class="search-btn" type="submit"><i class="fas fa-search" ></i>	</button>
        <i class="glyphicon glyphicon-search"></i>
    </div>
     
      </button>
</form>

<%-- 검색 jsp --%>
	
				<table classpacing='0'>
				<colgroup>
				<col width="50px">
				<col width="70px">	
				<col width="150px">
				<col width="200px">
				<col width="200px">
				<col width="220px">
				<col width="100px">
				<col width="150px">	
					
				</colgroup>
				
					<tr class="top">
					 <td><input type="checkbox" id="allCheckBox" class="chk" onclick="allChecked(this)"></td>
						<td>번호</td>
						<td>날짜</td>
						<td>담당자</td>
						<td>품목코드</td>
						<td>품목명</td>
						<td>합계</td>
						<td>상태</td>
						
					</tr>
				
					<c:forEach items="${list}" var="b"> 
					<tr class="even">
					<td><input type="checkbox" class="chk" name="cchk" onclick="cchkClicked()" value="${b.qualityiNo}"></td>
						<td id="${b.qualityiNo}" class="qualityiNo">${b.qualityiNo}</td>
						<td>${b.qualityiDate}</td>
						<td>${b.manager}</td>
						<td>${b.procode}</td>
						<td>${b.proname}</td>
						<td>${b.qualityiCount}</td>
						<td id="state-color">${b.state}</td>
					
				
					</tr>
					</c:forEach>
				</table>
				<div class="qualityi-btn">
				<input type="button" value="등록" id="btn-add"  onclick="fn_goqualityiForm();"/>
				<input type="button" value="선택삭제" id="btn-add2" onclick="SelectDelete();"/>
				<input type="button" value="전체삭제" id="btn-add3" onclick="Alldelete();"/>
				</div>
				<c:out value="${pageBar}" escapeXml="false"/>
				<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>