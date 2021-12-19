<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/spring/resources/css/sidebar.css">
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="${pageContext.request.contextPath}/" class="nav__logo">WERP</a>
                </div>
                 <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">품목 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                             <a href="${pageContext.request.contextPath}/pd/pdManage" class="collapse__sublink">- 품목 등록</a>
                            <a href="${pageContext.request.contextPath}/pd/list" class="collapse__sublink">- 품목 조회</a>
                    
                        </ul>
                    </div>
                    
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">입출고 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                       <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/in/in_form.do" class="collapse__sublink">-입고등록</a>
                            <a href="${pageContext.request.contextPath}/in/inView.do" class="collapse__sublink">-입고현황 조회</a>
                    		<a href="${pageContext.request.contextPath}/out/out_form.do" class="collapse__sublink">-출고등록</a>
                            <a href="${pageContext.request.contextPath}/out/outView.do" class="collapse__sublink">-출고현황 조회</a>
                        </ul>
                    </div>
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">품질 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                             <a href="${pageContext.request.contextPath}/errorP/errorPList.do" class="collapse__sublink">- 불량자재 등록</a>
                             <a href="${pageContext.request.contextPath}/errorP/errorPList.do" class="collapse__sublink">- 불량자재 조회</a>
                             <a href="${pageContext.request.contextPath}/qualityI/qualityIList.do" class="collapse__sublink">- 품질검사 요청건</a>
                            
                        </ul>
                    </div>

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">A/S 관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/AS/ASReceipt.do" class="collapse__sublink">- A/S 접수 조회</a>
                           
                        </ul>
                    </div>

                  

                </div>
                <a href="javascript:void(0)" class="nav__link" onclick="logout(); return false;">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">로그아웃</span>
                </a>
            
        </nav>
    </div>

    <!-- 외부 아이콘 사용 -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS파일 불러오기 -->
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</body>