<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	
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

margin-left: 650px;

}
		
.div-b>input {
width:70px;
height:30px;
border: 1px solid gray;
background: #eaebec;
margin-left: 5px;
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
 품질검사 요청건
</div>
</div>
<br>

		
<table classpacing='0'>
           	<colgroup>
				<col width="200px">
				<col width="350px">
				<col width="200px">
				<col width="350px">
				<col width="200px">
				
			
				
					<tr class="top">
						<td>날짜</td>
						<td>담당자</td>
						<td>품목코드</td>
						<td>품목명</td>
						<td>합계</td>
						<td>상태</td>
						</tr>
						
						<tr class="bottom">					
						<td>${qualityI.qualityiDate }</td>
						<td>${qualityI.manager }</td>		
						<td>${qualityI.procode }</td>	
						<td>${qualityI.proname}</td>
						<td>${qualityI.qualityiCount }</td>		
						<td>${qualityI.state}</td>
					</tr>
					
					
				
												
				</table>
				<br>
		<div class="wrap">
  		
	</div>
	<div class="div-b">
   	 <input type="button" onclick="location.href='${pageContext.request.contextPath}/qualityI/qualityIUpdateView.do?qualityiNo=${qualityI.qualityiNo}'" value="수정"></button>
	 <input type="button" value="삭제"
      />
      </div>
     
	
	

	
</body>
</html>