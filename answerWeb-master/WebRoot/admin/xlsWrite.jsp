<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>User Account - Bootstrap Admin</title>

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />

  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=basePath%>css/bootstrap-responsive.min.css"
        rel="stylesheet" />


  <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" />

  <link href="<%=basePath%>css/adminia.css" rel="stylesheet" />
  <link href="<%=basePath%>css/adminia-responsive.css" rel="stylesheet" />


  <link href="<%=basePath%>css/pages/plans.css" rel="stylesheet" />


  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <script type="text/javascript">

  </script>
</head>


<body>

<div class="navbar navbar-fixed-top">

  <div class="navbar-inner">

    <div class="container">

      <a class="btn btn-navbar" data-toggle="collapse"
         data-target=".nav-collapse"> <span class="icon-bar"></span> <span
              class="icon-bar"></span> <span class="icon-bar"></span>
      </a> <a class="brand" href="#">答题系统后台管理</a>

      <div class="nav-collapse">

        <ul class="nav pull-right">
          <li><a href="#"></a>
          </li>

          <li class="divider-vertical"></li>

          <li class="dropdown"><a data-toggle="dropdown"
                                  class="dropdown-toggle " href="#"> ${admins.adminname} <b
                  class="caret"></b>
          </a>

            <ul class="dropdown-menu">

              <li><a
                      href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i
                      class="icon-lock"></i> 修改密码</a></li>

              <li class="divider"></li>

              <li><a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a></li>
            </ul></li>
        </ul>

      </div>
      <!-- /nav-collapse -->

    </div>
    <!-- /container -->

  </div>
  <!-- /navbar-inner -->

</div>
<!-- /navbar -->




<div id="content">

  <div class="container">

    <div class="row">

      <div class="span3">

        <div class="account-container">

          <div class="account-avatar">
            <img src="${pageContext.request.contextPath}/resource/images/headshot.png" alt="" class="thumbnail" />
          </div>
          <!-- /account-avatar -->

          <div class="account-details">

            <span class="account-name">${admins.adminname}</span> <span
                  class="account-role"><c:choose>
            <c:when test="${admins.adminflag==1}">普通管理员</c:when>
            <c:otherwise>超级管理员</c:otherwise>
          </c:choose></span> <span class="account-actions">
							</span>

          </div>
          <!-- /account-details -->

        </div>
        <!-- /account-container -->

        <hr />

        <ul id="main-nav" class="nav nav-tabs nav-stacked">

          <li class="active"><a
                  href="${pageContext.request.contextPath}/selectUserByExample"> <i
                  class="icon-home"></i> 用户管理
          </a></li>

          <li><a
                  href="${pageContext.request.contextPath}/selectQuestion?toid=1">
            <i class="icon-th-list"></i> 试题库管理
          </a></li>

          <li><a href="${pageContext.request.contextPath}/admin/questionType.jsp">
            <i class="icon-th-large"></i> 目录管理
          </a></li>

          <li><a href="${pageContext.request.contextPath}/showXlsPage">
            <i class="icon-book"></i> 批量导入
          </a></li>


        </ul>

        <hr />

        <br />

      </div>
      <!-- /span3 -->



      <div class="span9">



        <div class="row">

          <div class="span9">



            <div class="widget-header">
              <i class="icon-th-list"></i>
              <h3>批量导入</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div>
                导入学生
              </div>
              <div>
                <input type="file" name="file1" id="file1" accept="application/vnd.ms-excel"/>
                <input type="button" onclick="uploadFile1()" id="submit" value="上传">
              </div>

              <div>
                导入题库
              </div>
              <div>
                <input type="file" name="file2" id="file2" onchange="uploadFile2()" accept="application/vnd.ms-excel"/>
                <input type="button" onclick="select_flie2()" value="上传">
              </div>
            </div>

            <!--   </div>  /widget -->

          </div> <!-- /span9 -->

<%--          <div class="span9">--%>



<%--            <div class="widget-header">--%>
<%--              <i class="icon-th-list"></i>--%>
<%--              <h3>批量导出</h3>--%>
<%--            </div>--%>
<%--            <!-- /widget-header -->--%>
<%--            <div class="widget-content">--%>
<%--              <div>--%>
<%--                导入学生--%>
<%--              </div>--%>
<%--              <div>--%>
<%--                <input type="file" name="file1" id="file1" onchange="uploadFlie1()" accept="application/vnd.ms-excel,application/msword"/>--%>
<%--                <input type="button" onclick="select_flie()" value="上传">--%>
<%--              </div>--%>

<%--              <div>--%>
<%--                导入题库--%>
<%--              </div>--%>
<%--              <div>--%>
<%--                <input type="file" accept="application/vnd.ms-excel,application/msword"/>--%>
<%--                <input type="submit" name="uploadFile2" id="uploadFile2">--%>
<%--              </div>--%>
<%--              --%>
<%--            </div>--%>

<%--            <!--   </div>  /widget -->--%>

<%--          </div> <!-- /span9 -->--%>

        </div> <!-- /row -->

      </div> <!-- /span9 -->


    </div> <!-- /row -->


  </div> <!-- /container -->

</div> <!-- /content -->


<div id="footer">

  <div class="container">
    <hr />
    <p>&copy; 2021  答题系统.</p>
  </div> <!-- /container -->

</div> <!-- /footer -->





<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>


<script src="<%=basePath%>js/bootstrap.js"></script>
<script src="<%=basePath%>js/excanvas.min.js"></script>
<script src="<%=basePath%>js/jquery.flot.js"></script>
<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
<script src="<%=basePath%>js/bootstrap.js"></script>
<script src="<%=basePath%>js/charts/bar.js"></script>
<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath%>js/excanvas.min.js"></script>
<script src="<%=basePath%>js/jquery.flot.js"></script>
<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
<script src="<%=basePath%>js/bootstrap.js"></script>
<script src="<%=basePath%>js/charts/bar.js"></script>

<script type="text/javascript">
  $("#submit").click(function (){
    var str="我是一个字符串";
    var array=['我','是','数','组'];
    var file1=$('#file1').get(0).files[0];

    var formData=new FormData();
    formData.append("str",str);
    formData.append("array",JSON.stringify(array));
    formData.append("file1",file1);
    $.ajax({
      url:'${pageContext.request.contextPath}/insertUserByXls',
      type:"post",
      data:formData,
      contentType:false,
      processData:false,
      success:function (data){
        alert(data);
      },
      error:function (){
        alert("error");
      }
    });

  });
</script>
</body>
</html>























