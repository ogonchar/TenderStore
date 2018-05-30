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
      <link href="<c:url value="/css/updateTender.css"></c:url>" rel="stylesheet" />
      <title>Registration</title>
      </head>
      <body>
      
        <!-- Navigation bar -->
		<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
			<div class="container-fluid">
			    <div class="navbar-header">
			        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
			        </button>
			        <div class="col-md-5">
   						<img src="<c:url value="/img/logo.png">
     				    </c:url>" alt="image"  style = "height:50px">    
     				</div>
				</div>
			<!-- Home and add -->
				<div class="collapse navbar-collapse" id="the-menu">
			    	<ul class="nav navbar-nav">
				    	<li class="active"><a href="/TenderStore1">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			        <!-- 	<li id="AddTenderP"><a href="/TenderStore1/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li> -->
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="#" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp; News&nbsp;<span class="badge">4</span></a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			<!-- AddByParser -->
			    	<form class="form-horizontal" id="search-form">
			    	<div class="input-group mb-5">
						  <input type="text" class="form-control" placeholder="Add tender by parser" id="keyword">
						  <div class="input-group-btn">
						    <button class="btn btn-outline-secondary" type="submit" id="bth-search">B</button>
						  </div>
						</div>
						</form>
			<!--  -->
				</div>
			</div>
		</nav>  
		
	<!-- End of navigation -->
	
	<!-- Registration form -->
	<section class="container">
	 <div class="container">
      <div class="row">
         <div class="col-md-6 col-md-offset-4">  
            <div class="panel panel-default">
               <div class="panel-heading">
                  
            <form:form  method="POST" modelAttribute="newUser" class="form-horizontal">
               <fieldset>
                  <legend>Registration</legend>
                  <div class="input-group input-sm">
                        <label class="input-group-addon" for="name"><i
                           class="fa fa-user"></i></label> <input type="text" class="form-control"
                           id="name" name="name" placeholder="Enter Username"
                           required>
                     </div>
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="password"><i
                           class="fa fa-user"></i></label> <input type="text" class="form-control"
                           id="password" name="password" placeholder="Enter password" required>
                     </div>
                     <div class="input-group input-sm">
                        <label class="input-group-addon" for="email"><i
                           class="fa fa-user"></i></label> <input type="text" class="form-control"
                           id="email" name="email" placeholder="Enter Email" required>
                     </div>
                  <div class="form-actions">
                        <input type="submit"
                           class="btn btn-block btn-primary btn-default" value="Submit">
                     </div>
                  
                 

                  
               </fieldset>
                </form:form>
                </div>
                </div>
                </div>
                </div>
                </div>
         </section>

</body>
</html>