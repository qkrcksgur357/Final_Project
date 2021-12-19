<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>입고 관리</title>
   <script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
   <link rel="stylesheet" href="/spring/resources/css/common.css">
   <style>
   h1{
      text-align:center;
   }
   
   #container {
      position: relative;
      width: 700px;
      margin: 0 auto;
  } 
   
   .body {
      margin: 0;
      padding: 0;
      height: 100%;
   }
   
   .inform{
      border-radius: 5px;
      width: 100px;
      height : 40px;
      font-size : 15px;
      background-color: #12192c;
      color : white;
      border : 0;
      outline : 0;
      float : bottom;
      display : inline-block;
   }
   
   #confirminBtn, #insertinBtn{
      float: right;
      width: 100px;
      height: 32px;
    }
  
   
   table {
         border-collapse: collapse;
         border-top: 2px solid #12192c;
         width: 80%;
         border-left : none;
         border-right : none;
      
   }

   th {
         font-weight: bold;
         background-color: #12192c;
         color : white;
         width : 200px;
   }

   th, td {
         border-bottom: 2px solid #12192c;
         padding: 5px;
   }
   

   body {
      margin-top: 200px;
      font-family: 'Trebuchet MS', serif;
      line-height: 1.6
      text-align : center;
   }
   
   </style>
<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <h1>입고 등록</h1>
   <br /><br />
   <div id="container">
   <div id="indiv1">
   <form name="inFrm"
         action="${pageContext.request.contextPath}/in/in_form.do"
         method="post">
   <table>
   <input type="hidden" name="procode" value="${proCodeList}" />
   <tr>
      <th>품목코드</th>
         <td>
         <select name="searchincode" id="procode">
         <c:forEach var="PdVo" items="${proCodeList}">
            <option value="${PdVo.procode}">${PdVo.procode}</option>
         </c:forEach>
      </select>
      </td>
       <input type="submit" class="inform" id="confirminBtn"value="확인" />
      </tr>
      </table>
   </form>
   </div>
   
   <br>
   
   <div id="indiv2">
      <form name="inFrm" action="${pageContext.request.contextPath}/in/in_form_list.do" method="post">
      <table>
                  
         <input type="hidden" name="inlist" value="${inlist}" />
                  
         <tr>
               <th>품목명</th>
               <td>${PdVo.proname}</td>
            </tr>
            <tr>
               <th>카테고리</th>
               <td>${PdVo.category}</td>
            </tr>
            <tr>
               <th>입고단가</th>
               <td>${PdVo.inprice}원</td>
            </tr>            
         <tr>
               <th>현재 재고수량</th>
               <td>${PdVo.stock}개</td>
            </tr>
         </table>
         </form>
         
         <br />
         
       <form name="inFrm"
         action="${pageContext.request.contextPath}/in/inUpdate.do"
         method="post">
      
      <table>
               <th>입고수량</th>
               <td>
               <input type="number" min="0" class="form-control" name="inNum" id="inNum" required>
               <input type="hidden" name="procode" value="${PdVo.procode}" />
               </td>
               <input type="submit" class="inform" id="insertinBtn" value="등록" />
       </table>
       </form>
   </div>
</div>
   <%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- 외부 아이콘 사용 -->
   <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
   <!-- JS파일 불러오기 -->
   <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
   
</body>
</html>