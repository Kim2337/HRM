<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<title>사원 정보</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
$(function(){
	
	var url="depts.do";
	
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,dataType:"json" })
		.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var i=0; i < args.length; i++) {
			$("#dept").append("<option value='"+args[i].deptno+"'>"+args[i].dname+"</option>");
		// $("#dept").append("<option value='"+args[i]+"'>"+args[i]+"</option>");
			//	 $("#btn").append("<input type='button' value='"+args[i].deptno+"'>"+args[i].dname+"</button>");
			 }
			 
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝

function selectDept(){

	var deptno=$("#dept").val();

	var url="emps.do";
	var params="deptno="+deptno;
	$.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){			
			$("#emp").text("");
			 for(var idx=0; idx<    args.length; idx++) {				 	
					// $("#emp").append("<li>"+args[idx].name+"</li>"+"<li value='"+args[idx].empno+"'>"+args[idx].level+"</li>"+"<li value='"+args[idx].empno+"'>"+args[idx].email+"</li>"+"<li value='"+args[idx].empno+"'>"+args[idx].phonenum+"</li>"+"<hr>");	
				 $("#emp").append("<div  class='container' width='20%' cellspacing='0'><div class='card-box'><img src='${pageContext.request.contextPath}/resources/img/Contact.PNG' class='photo'><div class='info'><h3 class='therapist-name'>"+args[idx].name+"</h3>"+"<div class='title'>"+args[idx].level+"</div>"+"<img src='${pageContext.request.contextPath}/resources/img/Phone.png' width='15px' height='10px'>"+ args[idx].phonenum+"<br>"+"<img src='${pageContext.request.contextPath}/resources/img/Email.png' width='15px' height='10px'>"+ args[idx].email);	
					

					 }
		})
	    .fail(function(e) {
	    	alert(e.responseText);
	    });	
}
</script>

<style>
.subtitle {
  color: #598bff;
  text-align: center;
  margin: auto;
  margin-top: 150px;
}

.card-box {
  background-color: white;
  border-left: solid 20px #3b9ad0;
  width: 500px;
  height: 264px;
  border-radius: 18px;
  box-shadow: 0px 4.5px 14px rgba(0, 0, 0, 0.1);
  margin: auto;
  margin-top: 50px;
  display: grid;
  grid-template-areas:
    "photo info "
    "expertise expertise";
  grid-template-columns: 25% 1fr ;
  transition: all 0.2s ease-out;
  
  &:hover {
    box-shadow: 0px 6px 14px rgba(0, 0, 0, 0.12);
    transform: translatey(-6px);
    .photo{
      transform: rotate(0.03turn);
    }
  }
  
}

.photo {
  height: 136px;
  margin-top: 36px;
  margin-left: 40px;
  transition: all 0.3s ease-out;
  
}

.info {
  grid-area: info;
  margin-top: 44px;
  margin-left: 100px;
}

h3 {
  margin-bottom: 4px;
}

.title {
  font-size: 14px;
  font-weight: regular;
}

.languages {
  font-size: 14px;
  font-weight: regular;
  color: grey;
}

 
  button {
  background-color: #0500ff;
  color: white;
  border: none;  
  font-size: 14px;
  font-weight: bold;
  border-radius: 25px;
  height: 40px;
  padding-left: 16px;
  padding-right: 16px;
    margin-top: 8px;
    cursor: pointer;
  transition: all 0.3s ease-out;  
    
    &:hover {
    transform: translatey(-2px);
    color: #FECEBF;
    box-shadow: 0px 4px 4px rgba(254, 206, 191, 0.6);    
  } 
  }
</style>

<!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">


</head>
<body id="page-top">
 <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/HRMProjectMain/jsp/user/main">
        <div class="sidebar-brand-icon rotate-n-15">
        </div>
        <div class="sidebar-brand-text mx-3">HRM<sup>Project</sup></div>
      </a>

      <!-- Divider -->
      <!-- <hr class="sidebar-divider my-0"> -->

	<br>

      <!-- Heading -->
      <div class="sidebar-heading">
       	 메뉴
      </div>
	 <hr class="sidebar-divider">
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/HRMProjectMain/jsp/approve/appboard?pageNum=1">
          <i class="fas fa-fw"></i>
          <span>결재</span>
        </a>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw"></i>
          <span>채팅</span>
        </a>
      </li>
      <!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw"></i>
          <span>캘린더</span>
        </a>
      </li>
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw"></i>
          <span>투표</span>
        </a>
      </li>
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw"></i>
          <span>근태관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/HRMProjectMain/jsp/contact/list.do">
          <i class="fas fa-fw"></i>
          <span>게시판</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/HRMProjectMain/jsp/contact/list.do">
          <i class="fas fa-fw"></i>
          <span>연락처</span>
        </a>
      </li>
 
     <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               
                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/profile.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	프로필
                </a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
              	   로그아웃
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
        
        
         <!-- Begin Page Content -->
       
<div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">
              <select id="dept" onchange="selectDept()">	<!-- onchange로 선택이 될때마다 cityList()실행 -->
  <option value="">::부서선택::</option>
</select></h6>
<form name="search" action="members/search.do">
<select name="searchOption">
 <option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>이름 </option>
  <option value="dname" <c:out value="${map.searchOption == 'dname'?'selected':''}"/>>부서명</option>
</select>
<input name="keyword" value="${map.keyword }">
<button id="search">검색 </button>

<script>
  $(function(){
	  $("#search").click(function(){
		  document.search.submit();
		  })
	  })
</script>


</form>
</div> 
<!-- 드롭다운 버전  -->

<div class="container-fluid">     
<div id="emp">
</div>



<div id="empInfo"></div>
          <!-- End of Main Content -->
 <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; ERP Project Website2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
        </div>
        <div class="modal-body">로그아웃을 하고싶으면 현재 창의 로그아웃 버튼을 클릭해주세요</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="/HRMProjectMain/jsp/user/logout">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
        
</body>
</html>