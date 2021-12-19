<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
<title>WERP-시작하기</title>
<link rel="stylesheet" href="/spring/resources/css/common.css">
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.backstretch.min.js"></script>
<style>
body{
	font-family:'Nanum Gothic', sans-serif;
}
 a{
 	text-decoration:none;
 }
 *{
	margin:0;
	padding:0;
	box-sizing:border-box;
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box; 
 }
 #wrap{
 	text-align: center;
    position: relative;
    margin-top: -10%;
}
 #startPage{
    text-align: center;
    position: relative;
    margin-top:39%;
    padding: 10px;
 }
.startBtn{
  font-family:'Nanum Gothic', sans-serif;
  position: absolute;
  top: calc(50% - 30px);
  right: calc(50% - 115px);
  width: 200px;
  height: 60px;
  background: #12192c;
  box-shadow: 1px 2px 2px 1px;
  font-weight: bold;
  border: 0;
  color: white;
  border-radius: 30px;
  line-height: 60px;
  text-align: center;
  letter-spacing: 5px;
  overflow: hidden;
  transition: all .3s cubic-bezier(.67,.13,.1,.81), transform .15s cubic-bezier(.67,.13,.1,.81);
  }
/*input[type="button"] .startBtn:hover {}*/

.startBtn:hover{
	right: calc(50% - 200px);
	width: 400px;
	background: #12192c;
	box-shadow: 1px 2px 2px 1px;
  	border: 0;
    color: white;
}
.startBtn:active{
	transform: translateY(3px);
}
.startBtn:before, .startBtn:after {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100%;
  opacity: 1;
  transition: all .3s cubic-bezier(.67,.13,.1,.81);
}
.startBtn:before {
  font-family:'Nanum Gothic', sans-serif;
  font-size: 18px;
  content: 'START WERP';
}
.startBtn:after {
  font-family:'Nanum Gothic', sans-serif;
  content: 'CLICK TO SELECT MENU';
  font-size: 18px;
  top: -60px;
  opacity: 0;
}
.startBtn:hover:after {
  top: 0px;
  opacity: 1;
}
.startBtn:hover:before {
  top: 60px;
  opacity: 0;
}
/*menu*/
.selectMenu{
      justify-content: center;
    align-items: center;
    background: rgba(0,0,0,.7);
    height: -webkit-fill-available;
    width: -webkit-fill-available;
    position: fixed;
    margin-top:-31%;
}
/*left:18%, width :1000px*/
.menu-content{
	padding: 15px;
    left: 35%; 
    top: 10%;
    position: absolute;
    width: 420px;
    height: 500px;
    display: grid;
    grid-template-rows: 0.2fr 1fr;
    background-color: #12192c;
		
}
.menu-content .loginDiv,.menu-content .enrollDiv{
	width: 180px;
    height: 180px;
    background-color: rgb(255,255,255,.85);
    border-radius: 20px;
    transition: all .3s cubic-bezier(.67,.13,.1,.81), transform .15s cubic-bezier(.67,.13,.1,.81);
}
.menu-content .loginDiv:hover{
	transform:scale(1.1);
	background-color: #424242;
}
.menu-content .enrollDiv:hover{
	transform:scale(1.1);
	background-color: #424242;
}
.menu-content #menu-item{
	top: 10%;
    position: absolute;
    width: 420px;
    height: 450px;
    display: flex;
    
    justify-content: space-around;
    background-color: rgba(255,255,255,0%);
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
}
.menu-content #cancelDiv{
    background-color: rgba(255,255,255,0%);
    display: flex;
    justify-content: flex-end;
    position: absolute;
    width: -webkit-fill-available;
}
.menu-content .enrollDiv:hover #enrollimg{
	opacity:0;
	transform: translateX(100px);
}
.menu-content .loginDiv:hover #loginimg{
	opacity:0;
	transform: translateX(-100px);
}
#enrollimg{
    position: absolute;
	right: 20px;
    width: 170px;
	transition: all 1s ease-in;
	
}
 #loginimg{
 	width: 152px;
    position: absolute;
    left: 25px;
    transition: all 1s ease-in;
    height: 145px;
 }
#loginText, #enrollText{
    color: white;
	position: relative;
    top: 140px;
    font-size: 30px;
    font-family:'Nanum Gothic', sans-serif;
    opacity: 0;
    transition:all 1.25s cubic-bezier(0.49, 1.53, 1, 0.99) 0.25s, transform 1.25s cubic-bezier(0.49, 1.53, 1, 0.99) 0.25s ;
 }
 .menu-content .loginDiv:hover #loginText, .menu-content .enrollDiv:hover #enrollText{
 	opacity:1;
 	transform:translateY(-100px);
 }
</style>
</head>
<body>
	<div id="wrap">
		<div id="startPage">
			
			<c:if test="${empty member}">
				<button class="startBtn" id="startBtn" type="button"  onclick="start();"></button>
			</c:if>
			<c:if test="${!empty member}">
				<c:redirect url="/index.do">
				</c:redirect>
			</c:if>	
			<!--  <input type="button" id="startBtn" value="WERP-시작하기" onclick="start();"/>-->
		</div>
	</div>
	<script>
	var wrap=document.getElementById("wrap");
	var cont=document.getElementById("startPage");
	var delChild=document.getElementById("startBtn");
	$(function(){
		$.backstretch([
			"/spring/resources/image/ERP.JPG","/spring/resources/image/ERP2.JPG","/spring/resources/image/ERP3.JPG"
		],{duration:3000,fade:750});
	});
	
	
		function start(){
		var DownKeyframe = new KeyframeEffect(
		delChild, [
					{transform: 'translateY(0px)', opacity:'1'}, 
					{transform: 'translateY(60px)',opacity:'0'}				
			],
			{	duration: 250, fill:'forwards'}
		);
		var Ani = new Animation(DownKeyframe,document.timeline);
		Ani.play();
		Promise.all(
			delChild.getAnimations().map(
				function(animation){
					return animation.finished
				}
			)
		).then(
			function(){
				//delChild.remove();
				delChild.style.display="none";
				var Menu=document.createElement("div");
				var Menu_content=document.createElement("div");
				var Menu_item=document.createElement("div");
				var cancelDiv= document.createElement("div");
				
				
				var loginDiv=document.createElement("div");
			//	var loginTitle=document.createElement("span");
				var login=document.createElement("a");

				
				var enrollDiv=document.createElement("div");
			//	var enrollTitle=document.createElement("span");
				var enroll=document.createElement("a");
				
				
				Menu.setAttribute("class","selectMenu");
				Menu.setAttribute("id","selectMenu");
				
				Menu_content.setAttribute("class","menu-content");
				Menu_content.setAttribute("id","menu-content");
				
				Menu_item.setAttribute("id","menu-item");
				
				cancelDiv.setAttribute("id","cancelDiv");
				
				cancelDiv.innerHTML="X";
				cancelDiv.style.padding="15px 30px 15px 15px";
				cancelDiv.setAttribute("onclick","closeMenuForm();");
				
			//	login.setAttribute("type","button");
				loginDiv.setAttribute("name","loginDiv");
				loginDiv.setAttribute("id","loginDiv");
				loginDiv.setAttribute("class","loginDiv");
				loginDiv.style.padding="10px";								
				
				//loginTitle.setAttribute("id","loginTitle");
			//	loginTitle.innerHTML="LOGIN";
				
				login.setAttribute("href","javascript:void(0);");
				login.setAttribute("class","loginImg");
				login.setAttribute("onclick","loginForm();return false;");
				
				
				//enroll.setAttribute("href","button");
				enrollDiv.setAttribute("name","enrollDiv");
				enrollDiv.setAttribute("id","enrollDiv");
				enrollDiv.setAttribute("class","enrollDiv");
				
			//	enrollTitle.setAttribute("class","title");
				
				enroll.setAttribute("href","javascript:void(0);");
				enroll.setAttribute("class","enrollImg");
	     		enroll.setAttribute("onclick","goEnroll(); return false;");
				
	    		
	     		login.innerHTML="<img src='/spring/resources/image/signin1.png' alt='로그인' id='loginimg'><div id='loginText'>LOGIN</div>"; 		
	    		enroll.innerHTML="<img src='/spring/resources/image/notes.png' alt='회원가입' id='enrollimg'><div id='enrollText'>ENROLL</div>";
	     		
	     		//loginDiv.appendChild(loginTitle);
	    		loginDiv.appendChild(login);
	     		
	     	//	enrollDiv.appendChild(enrollTitle);
	    		enrollDiv.appendChild(enroll);
	     		
	    	
	    		
				Menu_item.appendChild(loginDiv); 
				Menu_item.appendChild(enrollDiv);
				
				Menu_content.appendChild(cancelDiv);
				Menu_content.appendChild(Menu_item);
				
				Menu.appendChild(Menu_content);
				
				wrap.appendChild(Menu);	
			});
		}
		
	</script>
</body>

</html>
