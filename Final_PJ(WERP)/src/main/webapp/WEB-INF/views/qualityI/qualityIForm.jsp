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
	<title>게시글 작성</title>
	
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

table th{ 
font-size: 14px;
}

table td{
height: 38px;
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
	font-weight: bold;
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



.input-group {
width: 100%;
height: 300px;
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

.filebox input[type="file"], .filebox input[type="submit"]  {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

.search-btn {
widhth:20px;
height:20px;
}

	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=errorpContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	function managerButton() {
		var url = "${pageContext.request.contextPath}/member/memberList.do";
		var name = "popup1";
	    var _width = '350';
	    var _height = '500';				 			    
	    var _left = Math.ceil(( window.screen.width - _width )/2 + 50);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 			
		window.open(url,name,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top, );
		
		
	}
	
	function procodeButton() {
		var url = "${pageContext.request.contextPath}/errorP/proCodeList.do";
		var name = "popup1";
	    var _width = '350';
	    var _height = '500';				 			    
	    var _left = Math.ceil(( window.screen.width - _width )/2 + 50);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 			
		window.open(url,name,'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top, );
		
		
	}
	
	function goSubmit() {
		var procode = $("[name=procode]").val();

		if(procode=="") {
			alert("다시 입력해주세요.");
		}
		else {
		window.opener.name = "listForm";
		document.qualityiFrm.target = "listForm";
		document.qualityiFrm.action="${pageContext.request.contextPath}/qualityI/qualityIFormEnd.do"
		alert("등록완료");
		document.qualityiFrm.submit();
		
		self.close();
		}
	}
				


	</script>
</head>
<body> 
<div class="top-div">
<div style="display: inline-block">
<img src="${pageContext.request.contextPath }/resources/images/logo.png" width="168" height="82"/>
</div>

<div class="top-text">
 품질검사 요청
</div>
</div>


<br>
<form id="Frm" name="qualityiFrm" method="post"  enctype="multipart/form-data" >
<table classpacing='0'>
				<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			
		
				</colgroup>
				
					<tr class="top">
						<td>품목코드
						 <button class="search-btn" onclick="procodeButton();"><i class="fas fa-search"></i>	</button>
     				  <i class="glyphicon glyphicon-search"></i></td>
						<td><input type="text" class="form-control"  name="procode" id="procode" required style="text-align:center; width:160px; height:20px;" readonly ></td>				
						<td>품목명</td>
						<td><input type="text" class="form-control" name="proname" id="proname" required style="text-align:center; width:160px; height:20px;" readonly> </td>
						</tr>
						
						<tr>
						<td>품목개수</td>
						<td><input type="text" class="form-control" name="qualityiCount" required style="text-align:center; width:160px; height:20px;"></td>
						 <td>담당자
					 <button class="search-btn" onclick="managerButton();"><i class="fas fa-search" ></i>	</button>
     				  <i class="glyphicon glyphicon-search"></i>
      				 </td>
      				 <td><input type="text" class="form-control" name="manager" id="manager" required style="text-align:center; width:160px; height:20px;"  ></td>
						</tr>
						
					
						
		
				</table>
				
				
				<br>
				
	     	<div class="filebox" id="image_container" >
 			  <input type="file" class="custom-file-input" name="upFile" id="upFile1" 
 			  data-width="300" data-height="300" accept="image/*" onchange="setThumbnail(event);" multiple>
 			 <label class="custom-file-label" for="upFile1">업로드</label>
 			 <input type="submit" id="form_submit" name="form_submit" class="btn btn-outline-success" value="저장" onclick="goSubmit();">
 			 <label class="custom-file-label" for="form_submit">저장</label>
			</div>
				</form>
	
				   
				
				
				 
				
				


</body>
</html>