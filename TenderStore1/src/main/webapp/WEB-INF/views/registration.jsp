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
      <style type="text/css">
      #header{
		width: 100%;
		background-color: rgba(260,260,260, 0.5);
		overflow:auto;
		height:40px;
	}
	.logo{
	float:left;
	}
	#home{
		height:100%;
		width: 100%;
		border: none;
		float:left;
		background-image: linear-gradient(to left, #BDBBBE 0%, #9D9EA3 100%), radial-gradient(88% 271%, rgba(255, 255, 255, 0.25) 0%, rgba(254, 254, 254, 0.25) 1%, rgba(0, 0, 0, 0.25) 100%), radial-gradient(50% 100%, rgba(255, 255, 255, 0.30) 0%, rgba(0, 0, 0, 0.30) 100%);
 		background-blend-mode: normal, lighten, soft-light;
	}
	.headerSection{
		float:left;
		height:100%;
		width:7%;
	}
	.headerSectionRight{
		float:right;
		height:100%;
		width:6%;
		background-color: rgba(260,260,260, 0.5);
		border-right: 1px solid darkgrey;
		text-align: center;
		padding-top: 10px;
	}
	</style>
      </head>
      <body style="background-image: url('<c:url value="/img/back.jpg"></c:url>');">
      
        <!-- Navigation bar -->
		<div id="header">
				<div class='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' href="/TenderStore">&nbsp;Домой</button></div>
				
			<!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/logout">Logout</a></div>
			</div>
 
		
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