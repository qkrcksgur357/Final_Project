<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* REMOVE THIS, USE YOUR OWN  */
html,body {
 
font-family:'Nanum Gothic', sans-serif;
  
}
.copyright{
	font-family:'Nanum Gothic', sans-serif;
	text-algin: center;
}
.dummy_page {
  height: 200px;
  width: 100%;
  background-color: #f0f0f0;
  text-align: center;
  box-sizing: border-box;
  padding: 60px 0px;
}
/* STYLES SPECIFIC TO FOOTER  */
.footer {
  width: 100%;
  position: relative;
  height: auto;
  
}
.footer .col {
  width: 190px;
  height: auto;
  float: left;
  margin-left: 50px;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  padding: 0px 20px 20px 20px;
}
.footer .col h1 {
  margin: 0;
  padding: 0;
  font-family: inherit;
  font-size: 15px;
  line-height: 17px;
  padding: 20px 0px 5px 0px;
  color: black;
  font-weight: bolder;
  text-transform: uppercase;
  letter-spacing: 0.250em;
}
.footer .col ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.footer .col ul li {
  color: gray;
  font-size: 14px;
  font-family: inherit;
  font-weight: bold;
  padding: 5px 0px 5px 0px;
  cursor: pointer;
  transition: .2s;
  -webkit-transition: .2s;
  -moz-transition: .2s;
}

.footer .col ul li:hover {
  color: #ffffff;
  transition: .1s;
  -webkit-transition: .1s;
  -moz-transition: .1s;
}
.clearfix {
  clear: both;
}
@media only screen and (min-width: 1280px) {
  .contain {
    width: 1200px;
    margin: 0 auto;
  }
}
  }
 
}
@media only screen and (max-width: 950px) {
  .footer .col {
    width: 33%;
  }
  .footer .col h1 {
    font-size: 14px;
  }
  .footer .col ul li {
    font-size: 13px;
  }
}
@media only screen and (max-width: 500px) {
    .footer .col {
      width: 50%;
    }
    .footer .col h1 {
      font-size: 14px;
    }
    .footer .col ul li {
      font-size: 13px;
    }
}
@media only screen and (max-width: 340px) {
  .footer .col {
    width: 100%;
  }
}
#img {
margin-top: 30px;
margin-left:30px;	
}

</style>
</head>

<body>

<!-- FOOTER START -->
<footer>
<div class="footer">
  <div class="contain">
  <div class="col">
  <img id= "img" src="${pageContext.request.contextPath }/resources/images/logo.png" width="168" height="82">
  </div>
  <div class="col">
    <h1>MyPage</h1>
    <ul>
      <li onclick='Person("${member.userId}")'>정보수정</li>
      <li>받은목록</li>
      <li>채팅관리</li>  
    </ul>
  </div>
  <div class="col">
    <h1>입출고 관리</h1>
    <ul>
      <li onclick="fn3(); return false;">입고등록</li>
      <li onclick="fn4(); return false;">입고현황</li>
      <li onclick="fn5(); return false;">출고등록</li>
      <li onclick="fn6(); return false;">출고현황</li>
    </ul>
  </div>
  <div class="col">
    <h1>품질 관리</h1>
    <ul>
      <li onclick="fn7(); return false;">불량자재 등록</li>
      <li  onclick="fn7(); return false;">불량자재 현황</li>
      <li  onclick="fn8(); return false;">품질검사 요청건</li>
    </ul>
  </div>
  <div class="col">
    <h1>A/S 관리</h1>
    <ul>
      <li onclick="fn9(); return false;"  >A/S 접수조회</li>

    </ul>
  </div>

  
<div class="clearfix"></div>
 <div class="copyright">
     © Copyright 2021 35s2 Class | Education | KH Academy reserved by 1조<br>
     			   | 강민석 |  김경식 |  박찬혁 |  조희연 |  최정윤 | 
   </div>
   

</div>
</div>
<!-- END OF FOOTER -->
</footer>
</body>
</html>