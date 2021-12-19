<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS 접수 목록</title>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
<link rel="stylesheet" href="/spring/resources/css/common.css">
<style>
.pagination {
   display: flex;
   padding-left: 0;
   list-style: none;
   border-radius: 0.25rem;
   margin: 0 auto;
}

.page-item.active .page-link {
   z-index: 1;
   color: #12192c;
   background-color: #fff;
   border-color: #12192c;
}

li.page-item.disabled>.page-link {
   color: #fff;
   display: inline-block;
   background : #12192c;
   padding: 7px;
   border: 1px solid #12192c;
   font-size: 13px;
   cursor: pointer;
}

.page-item>a.page-link {
   color: #fff;
   display: inline-block;
   padding: 7px;
   background: #12192c;
   border: 1px solid #12192c;
   font-size: 13px;
   cursor: pointer;
}

.pagination {
   margin-top: 30px;
   margin-left: 410px;
}

h1 {
   text-align: center;
}

div {
   border-top-left-radius: 0px;
   border-top-right-radius: 13px;
   border-bottom-left-radius: 13px;
   border-bottom-right-radius: 13px;
}

tr:nth-child(n+2):hover {
   background-color: #d3d3d3;
   cursor: pointer;
}

table {
   border-collapse: collapse;
    border-top: 2px solid #12192c;
    width: 100%;
    border-left: none;
    border-right: none;
}

th {
   font-weight: bold;   
   background-color: #12192c;
   color: white;
}

th, td {
   border-bottom: 2px solid #12192c;
   padding: 5px;
}

th:first-child, td:first-child {
   border-left: none;
}

#tabs {   
   width: 1000px;
   margin: 0 auto;
   margin-top: 50px;
   z-index: 0;
}

body {
   margin-top: 100px;
   font-family: 'Trebuchet MS', serif;
   line-height: 1.6;
}

#container {
     position: relative;
      width: 700px;
      margin: 0 auto;
}

ul.tabs {
   margin: 0px;
   padding: 0px;
   list-style: none;
}

ul.tabs li {
   cursor: pointer;
   width: 100px;
   display: inline-block;
   background-color: #12192c;
   color: white;
   text-align: center;
   transition: .25s ease;
   border: none;
   padding: 10px;
   border-radius: 12px 12px 0 0;
}

ul.tabs li:hover {
   background: #424242;
   color: #fff;
}

ul.tabs li.current {
   background: #ededed;
   color: #222;
}

ul.tabs li.current {
   background: #ededed;
   color: #222;
}

.tab-content {
   display: none;
   background: #ededed;
   padding: 15px;
}

.tab-content.current {
   display: inherit;
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

</style>


<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <h1>A/S 조회</h1>
   <div id="tabs">
      <ul class="tabs">
         <li class="tab-link current" data-tab="tab-1">전체</li>
         <li class="tab-link" data-tab="tab-2">접수대기</li>
         <li class="tab-link" data-tab="tab-3">접수완료</li>
         <li class="tab-link" data-tab="tab-4">수리진행</li>
         <li class="tab-link" data-tab="tab-5">수리완료</li>
         <li class="tab-link" data-tab="tab-6">전달완료</li>
      </ul>
      
      <!-- AS 전체 -->
      <div id="tab-1" class="tab-content current">
      <form class="navbar-form">
         <div class="form-group navbarleft">

            <select class="search-option" name="key">
               <%--페이지 이동시에도 옵션 유지 --%>
               <option value="CODE" ${(key == "CODE")?"selected":"" }>품목코드</option>
               <option value="NAME" ${(key == "NAME")?"selected":"" }>고객명</option>
            </select> 
            <input type="text" class="search-input" placeholder="검색어를 입력해주세요."
                  name="word" value="${word}">
            <button class="search-btn" type="submit">
               <i class="fas fa-search"></i>
            </button>
            <i class="glyphicon glyphicon-search"></i>
         </div>
         </button>
      </form>
      
      
         <p>총 접수 건수 : ${totalAS}건</p>
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <tr id="${AS.asCode}">
                  <td>${AS.asDate}</td>
                  <td>${AS.customer}</td>
                  <td>${AS.proCode}</td>
                  <td>${AS.asTitle}</td>
                  <td>${AS.asExpectedDate}</td>
                  <td>${AS.asStage}</td>
               </tr>
            </c:forEach>
         </table>
      </div>

      <!-- 접수 대기 -->
      <div id="tab-2" class="tab-content">
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <c:if test="${AS.asStage eq '접수 대기'}">
                  <tr id="${AS.asCode}">
                     <td>${AS.asDate}</td>
                     <td>${AS.customer}</td>
                     <td>${AS.proCode}</td>
                     <td>${AS.asTitle}</td>
                     <td>${AS.asExpectedDate}</td>
                     <td>${AS.asStage}</td>
                  </tr>
               </c:if>
            </c:forEach>
         </table>
      </div>

      <!-- 접수 완료 -->
      <div id="tab-3" class="tab-content">
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <c:if test="${AS.asStage eq '접수 완료'}">
                  <tr id="${AS.asCode}">
                     <td>${AS.asDate}</td>
                     <td>${AS.customer}</td>
                     <td>${AS.proCode}</td>
                     <td>${AS.asTitle}</td>
                     <td>${AS.asExpectedDate}</td>
                     <td>${AS.asStage}</td>
                  </tr>
               </c:if>
            </c:forEach>
         </table>
      </div>

      <!-- 수리 진행 -->
      <div id="tab-4" class="tab-content">
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <c:if test="${AS.asStage eq '수리 진행'}">
                  <tr id="${AS.asCode}">
                     <td>${AS.asDate}</td>
                     <td>${AS.customer}</td>
                     <td>${AS.proCode}</td>
                     <td>${AS.asTitle}</td>
                     <td>${AS.asExpectedDate}</td>
                     <td>${AS.asStage}</td>
                  </tr>
               </c:if>
            </c:forEach>
         </table>
      </div>

      <!-- 수리 완료 -->
      <div id="tab-5" class="tab-content">
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <c:if test="${AS.asStage eq '수리 완료'}">
                  <tr id="${AS.asCode}">
                     <td>${AS.asDate}</td>
                     <td>${AS.customer}</td>
                     <td>${AS.proCode}</td>
                     <td>${AS.asTitle}</td>
                     <td>${AS.asExpectedDate}</td>
                     <td>${AS.asStage}</td>
                  </tr>
               </c:if>
            </c:forEach>
         </table>
      </div>

      <!-- 전달 완료 -->
      <div id="tab-6" class="tab-content">
         <table id="tbl-as" style="text-align: center">
            <tr>
               <th style="width: 180px">접수일</th>
               <th style="width: 180px">고객명</th>
               <th style="width: 180px">품목코드</th>
               <th style="width: 180px">제목</th>
               <th style="width: 180px">수리예정일</th>
               <th style="width: 180px">접수현황(단계)</th>
            </tr>
            <c:forEach items="${list}" var="AS">
               <c:if test="${AS.asStage eq '전달 완료'}">
                  <tr id="${AS.asCode}">
                     <td>${AS.asDate}</td>
                     <td>${AS.customer}</td>
                     <td>${AS.proCode}</td>
                     <td>${AS.asTitle}</td>
                     <td>${AS.asExpectedDate}</td>
                     <td>${AS.asStage}</td>
                  </tr>
               </c:if>
            </c:forEach>
         </table>
      </div>




      <%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
      <script
         src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- 외부 아이콘 사용 -->
      <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
      <!-- JS파일 불러오기 -->
      <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/tab.js"></script>
      <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

      <script>
         $(function() {
            $("tr[id]").on("click",function() {
                  var asCode = $(this).attr("id");
                  console.log("asCode=" + asCode);
                  location.href = "${pageContext.request.contextPath}/AS/ASView.do?asCode="
                               + asCode;
            });
         });
      </script>
      
      <c:out value="${pageBar}" escapeXml="false" />
      <br />
      <br />
      <br />
      <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>