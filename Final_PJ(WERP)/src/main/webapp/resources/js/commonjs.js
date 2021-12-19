/**
 * 
 */
 
 function getContextPath(){
 	return sessionStorage.getItem("contextpath");
 }
 function fn1(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/';
 }
 function fn2(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/';
 }
 function fn3(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/in/in_form.do';
 }
 function fn4(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/in/inView.do';
 }
 function fn5(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/out/out_form.do';
 }
  function fn6(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/out/outView.do';
 }
 function fn7(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/errorP/errorPList.do';
 }
 function fn8(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/qualityI/qualityIList.do';
 }
 function fn9(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/AS/ASReceipt.do';
 }
 function fn10(){
 	var contextpath=getContextPath();
 	window.location.href=contextpath+'/';
 }
 function goEnroll(){
			window.location.href=getContextPath()+'/enroll.do';
}
function loginForm(){
			var del=document.getElementById("cancelDiv");
			var del2=document.getElementById("menu-item");
			del.style.display="none";
			del2.style.display="none";
			
			var content = document.getElementById("menu-content");
			
			var loginBar=document.createElement("div");
			var loginTitleBar=document.createElement("div");
			
			var titleImg=document.createElement("div");
			var loginTitle=document.createElement("h2");
			var closeBtn=	document.createElement("div");
			
						
			var loginContent = document.createElement("form");
			
			var idLb= document.createElement("label");
			var idBar =document.createElement("input");

			var pwdLb = document.createElement("label");
			var pwdBar= document.createElement("input");
			
			var btnBar=document.createElement("div");
			var submitBtn=document.createElement("input");
			var cancelBtn =document.createElement("input");
			
			pwdLb.innerHTML="<br/>비밀번호";

			pwdBar.setAttribute("type","password");
			pwdBar.setAttribute("name","userPwd");
			pwdBar.setAttribute("id","userPwd_");
			pwdBar.setAttribute("required","true");
			
			idLb.innerHTML="아이디";
			idLb.style.float="left";
			
			idBar.setAttribute("type","text");
			idBar.setAttribute("name","userId");
			idBar.setAttribute("id","userId_");
			idBar.setAttribute("required","true");
			
			var loc= getContextPath()+"/Login.do";
			
			loginContent.setAttribute("action",loc);
			loginContent.setAttribute("method","post");
			loginContent.setAttribute("id","loginForm");
			
			
			submitBtn.setAttribute("type","submit"); cancelBtn.setAttribute("type","button");
			submitBtn.setAttribute("value","로그인"); cancelBtn.setAttribute("value","취소");
			submitBtn.setAttribute("id","loginBtn"); cancelBtn.setAttribute("id","cancelBtn");
			submitBtn.style.color="black"; cancelBtn.style.color="black";
																cancelBtn.setAttribute("onclick","closeLoginForm();");
			
			btnBar.appendChild(submitBtn);
			btnBar.appendChild(cancelBtn);
			btnBar.setAttribute("id","btnBar");
			
			loginContent.appendChild(idLb); loginContent.appendChild(idBar);
			loginContent.appendChild(pwdLb); loginContent.appendChild(pwdBar);
			loginContent.appendChild(btnBar);
			
			titleImg.innerHTML="<img src='/spring/resources/image/loginLogo.png' alt='로고'>";
			
			
			loginTitle.innerHTML="로그인";
			
			closeBtn.innerHTML="X";
			closeBtn.setAttribute("onclick","closeLoginForm();");
			closeBtn.setAttribute("id","closeBtn");
			closeBtn.setAttribute("class","closeBtn");
			
			
			loginTitleBar.appendChild(titleImg);
			loginTitleBar.appendChild(loginTitle);
			loginTitleBar.appendChild(closeBtn);
			
			loginTitleBar.setAttribute("id","loginTitle");
			
			
			loginBar.appendChild(loginTitleBar);
			loginBar.appendChild(loginContent);
			loginBar.setAttribute("id","loginBar");
			
			content.appendChild(loginBar);
}
function logout(){
window.location.href=getContextPath()+"/Logout.do";
}
function cancel(){
	var returnMsg = confirm("작성중이던 내용을 취소하고 돌아가시겠습니까?");
	if(returnMsg){
		window.location.href=getContextPath();
	}else{
		return 0;
	}
}
function Chat() {
		
		window.open(getContextPath()+"/chat.go",'chatPop','width=350, height=650, menubar=no, status=no, toolbar=no, location=no,titlebar=no,resizable=no');
 
     }
     
     function Notifications() {
    	 alert("test");
    	 
     }
     
     function Person(x) {
     	var userId=x;
    	 window.location.href=getContextPath()+"/memberView.do?userId="+userId;
    	 
     }
function closeLoginForm(){
	var loginForm=document.getElementById("loginBar");
	var menuItem=document.getElementById("menu-item");
	var cancelDiv=document.getElementById("cancelDiv");
	
	
	loginForm.remove();
	cancelDiv.style.display="flex";
	menuItem.style.display="flex";
}
function closeMenuForm(){
	var menuForm=document.getElementById("selectMenu");
	var startBtn = document.getElementById("startBtn");
	
	menuForm.remove();
	window.location.replace(getContextPath());
}	