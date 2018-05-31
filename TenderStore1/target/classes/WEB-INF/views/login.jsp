<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

 <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
      <link href="<c:url value="/css/login.css"></c:url>" rel="stylesheet" />
      <title>Log In</title>
      
</head>
<body>
   <!-- Navigation bar -->
		<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
			<div class="container-fluid">
			    <div class="navbar-header">
			        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
			        </button>
			        <div class="col-md-5">
   						<img src="<c:url value="/img/logo1.png">  
     				    </c:url>" alt="image"  style = "height:50px">  
     				</div>
				</div>
			<!-- Home and add -->
				<div class="collapse navbar-collapse" id="the-menu">
			    	<ul class="nav navbar-nav">
				    	<li class="active"><a href="/TenderStore1">&nbsp;Home</a></li>
			       
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="/TenderStore1/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp; News&nbsp;<span class="badge">4</span></a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	 
			
				</div>
			</div>
		</nav>  
		
	<!-- End of navigation -->
	  
	  
	  
	  <!--  Ligon form -->
   <div class="container">
      <div class="row">
         <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
               <div class="panel-heading">
                  <h3 class="panel-title">Please sign in</h3>
               </div>
               <div class="panel-body" >
<c:url var="loginUrl" value="/login" />
                  <form action="${loginUrl}" method="post" class="form-horizontal">
                     
                     <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                           <p>Invalid username and password.</p>
                        </div>
                     </c:if>
                     
                     <c:if test="${param.logout != null}">
                        <div class="alert alert-success">
                           <p>You have been logged out successfully.</p>
                        </div>
                     </c:if>
                     
                     <c:if test="${param.accessDenied != null}">
                        <div class="alert alert-danger">
                           <p>Access Denied: You are not authorised! </p>
                        </div>
                     </c:if>
                     
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="username"><i
                           class="fa fa-user"></i></label> <input type="text" class="form-control"
                           id="userId" name="userId" placeholder="Enter Username"
                           required>
                     </div>
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="password"><i
                           class="fa fa-lock"></i></label> <input type="password"
                           class="form-control" id="password" name="password"
                           placeholder="Enter Password" required>
                     </div>

                     <div class="form-actions">
                        <input type="submit"
                           class="btn btn-block btn-primary btn-default" value="Log in">
                     </div>
                     
                     
                  </form>
               </div>
            </div>
         </div>
         
      </div>
   </div>
   <h4 align="center"> <a href="/TenderStore1/registration">Registration</a></h4>
</body>
