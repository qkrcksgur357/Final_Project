<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/spring/resources/js/commonjs.js" ></script>
</head>
<body>
<div id="container">
		
		<div id="board-container">
			<form name="errorPFrm" action="${pageContext.request.contextPath}/errorP/errorPUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" id="errorp" name="errorpNo" value="${ errorP.errorpNo }" />
					<input type="text" class="form-control" placeholder="상품코드" name="procode" id="procode" value="${ errorP.procode }" required>
				<input type="text" class="form-control" placeholder="상품명" name="proname" id="proname" value="${ errorP.proname }" required>
				 <input type="text" class="form-control" name="errorpContent" placeholder="내용" value="${ errorP.errorpContent }" required></textarea>
				<input type="text" class="form-control" placeholder="상품갯수" name="errorpCount" id="errorpCount" value="${ errorP.errorpCount }" required>
				<c:forEach items="${attachmentList}" var="a" varStatus="vs">
					<div class="rows">
						<button type="button" class="btn btn-outline-success col-8"
							onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');" download>
						첨부파일${vs.count} - ${a.originalFileName }
					</button>
					<button type="button" class="btn btn-outline-danger col-3"
							onclick="fileDelete(this, '${a.attachmentNo}', '${a.renamedFileName }');">파일 삭제</button>
					</div>
				</c:forEach>
				
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일1</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				  </div>
				</div>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일2</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				  </div>
				</div>
			   
				<br />
				<input type="submit" id="btn_modify" class="btn btn-outline-success" value="수정 완료" /> &nbsp;
				<input type="button"  class="btn btn-outline-danger" value="삭제" onclick= "deleteCheck();"/>
			</form>
		</div>
		<c:import url="../common/footer.jsp"/> 
		
	</div>
	
</body>
</html>