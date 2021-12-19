<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>불량자재 상세보기</title>
	
	<style>
			div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		
	table {
	font-family:Arial, Helvetica, sans-serif;
	color:#black;
	font-size:13.5px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	border:#ccc 1px solid;
	margin-left: 15px;


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
	font-size: 17px;
	
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

td {
width: 180px;
height: 40px;
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

td>input {
background: #f6f6f6;
border: 0;
font-size: 14px;
}

p {
font-size: 24px;
text-align: center;
}

.top-text {
width: 100%;
display: inline-block;
text-align: center;
color: black;
font-size: 24px;
font-weight: bolder;
}
		
.div-b {

margin-left: 700px;

}
		
.div-b>input {
width:70px;
height:30px;
border: 1px solid gray;
background: #eaebec;
margin-left: 5px;
}

#no {
color: blue;
}

.filebox {

background: f6f6f6;
height: 300px;
background: #f6f6f6;


}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5cb85c;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
  margin-top: 320px;
  margin-left: 0;
}

.filebox label:hover {
  background-color: #6ed36e;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"], .filebox input[type="button"]  {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}


	</style>
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/errorP/fileDownload.do?oName="+oName+"&rName="+rName;
		}
		
		
	</script>
</head>
<body>
<div class="top-div">
<div style="display: inline-block">
<img src="${pageContext.request.contextPath }/resources/images/logo.png" width="168" height="82"/>
</div>
<div class="top-text">
 불량자재 조회
</div>
</div>
<br>

		
<table classpacing='0'>
           	<colgroup>
				<col width="100px">
				<col width="200px">
				<col width="200px">
				<col width="250px">
				</colgroup>
				
			
				
					<tr class="top">
						<td>번호</td>
						<td>상품코드</td>
						<td>상품명</td>
						<td>작성일</td>
						<td>내용</td>
						</tr>
						
						<tr class="bottom">					
						<td id="no">${errorP.errorpNo }</td>
						<td>${errorP.procode }</td>		
						<td>${errorP.proname }</td>
						<td>${errorP.inputDate }</td>			
					<td colspan="3">${errorP.errorpContent }</td>
					</tr>																														
				</table>
				<br>
		<div class="wrap">
  		
	</div>
	<div class="filebox" id="image_container" >
 			  <input type="file" class="custom-file-input" name="upFile" id="upFile1" 
 			  data-width="300" data-height="300" accept="image/*" onchange="setThumbnail(event);" multiple>
 			 <label class="custom-file-label" for="upFile1">업로드</label>
 			 <input type="button" id="form_submit" name="form_submit" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/errorP/errorPUpdateView.do?errorpNo=${errorP.errorpNo}'" value="수정" >
 			 <label class="custom-file-label" for="form_submit">수정</label>
			</div>
			

     

	
</body>
</html>