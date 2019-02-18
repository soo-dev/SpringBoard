<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
  <br />
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <c:if test="${empty login}">
                <div class="pull-left image">
                    <img src="${path}/resources/dist/user/default-user.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Guest</p>
                        <%-- Status --%>
                    <a href="#"><i class="fa fa-circle text-danger"></i> OFFLINE</a>
                </div>
            </c:if>
            <c:if test="${not empty login}">
                <div class="pull-left image">
                    <img src="${ path }/resources/dist/user/default-user.png"" class="img-circle" alt="User Image"> 
                </div>
                <div class="pull-left info">
                    <p>${login.user_name}</p>
                        <%-- Status --%>
                    <a href="#"><i class="fa fa-circle text-success"></i> ONLINE</a>
                </div>
                <br />
                <br />
            </c:if>
        </div>

        <br />
      
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">포트폴리오</li>
            <li class="treeview">
                <a href="#"><i class="fa fa-folder"></i> 
                	<span>Duck Hunts</span>
                </a>
                
                <a href="#"><i class="fa fa-folder"></i> <span>Spring Board</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="${path}/board/list"><i class="fa fa-pencil"></i> CRUD 게시판 </a></li>
                    <li><a href="${path}/board/paging/list"><i class="fa fa-pencil"></i> 페이징 게시판 </a></li>
                    <li><a href="${path}/board/paging/search/list"><i class="fa fa-pencil"></i> 최종 게시판 </a></li>
                </ul>
                <a href="#"><i class="fa fa-folder"></i> 
                	<span>JS To Do List</span>
                </a>
                
            </li>
           

        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>