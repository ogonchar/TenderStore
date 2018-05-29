<%@page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/css/tenders.css"></c:url>" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script   src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<!-- There are some links to CDN -->    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- End of links -->
 

<title>Contact</title>
</head>
<body>

<!-- Main container-->
	<div class = "container col-md-12"> 
	
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
				    	<li class="active"><a href="/TenderStore1/tenders/${contact.owner}">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			        <!-- 	<li id="AddTenderP"><a href="/TenderStore1/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li> -->
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="/TenderStore1/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			
				</div>
			</div>
		</nav>  
		</div>
	<!-- End of navigation -->
	 
	<div>
	<div class = "col-md-7 col-md-offset-2">  
	<h2>${contact.name} </h2>
	</div>
		<div class="col-md-6 col-md-offset-2">  
			<!-- Information about contact  -->
				<div id="theSection"> 
					<table class ="table rounded table-striped table-bordered table-sm">
						<tr><td><spring:message code="contact.idinn.mes"/></td>
						<td>${contact.idInn}</td></tr>
						<tr><td><spring:message code="contact.city.mes"/></td>
						<td>${contact.city}</td></tr>
						<tr><td><spring:message code="contact.fullName.mes"/></td>
						<td>${contact.fullName}</td></tr>
						<tr><td><spring:message code="contact.phone.mes"/></td>
						<td>${contact.phone}</td></tr>
						<tr><td><spring:message code="contact.email.mes"/></td>
						<td>${contact.email}</td></tr>
					</table>
				</div>
			<!--  -->
						
						
			<!-- Comment section -->
				<div class="col-md-12">
					<div class="form">
						<c:forEach items="${comments}" var="comments">	  
							<div>  
								<table class="table table-striped table-bordered table-sm tb col-md-12 ">
									<div><td  class="col-md-1"><span class="text-muted">commented ${comments.date}</span></td></div> <td  class="col-md-10"><div><h5>${comments.text}</h5></div></td>
									<td ><button class="btn btn-danger" onclick = "location.href = '/TenderStore1/contact/delete/${comments.id}/redir/${contact.idInn}'" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
								</table> 
							</div>  
						</c:forEach>
					</div>    
					<div>  
						<form:form method="POST" commandName="comment" modelAttribute="comment">
							<h4>Add comment: </h4>
								<td><form:textarea class="form-control" path="text" rows="3" cols="120" /></td>
								<tr><td colspan="3"><input type="submit" /></td></tr>
						</form:form>
					</div>
				</div>
			<!-- -->		
			
			</div>   
				
		    <!-- Tender section -->
				<div class="col-md-3 col-md-offset-1">     
					<table class="table table-sm">
						<tr class="active"><td>Tenders</td></tr> </table> 
							<c:forEach items="${tenders}" var="tenders">	
							<table class="table"><tr class="active"><td><a href="/TenderStore1/tender/${tenders.idTenderZakupki}">${tenders.idTenderZakupki}</a></td>
							<tr class="active"><td>${tenders.objectOfPurchase}</td></tr></table>
							</c:forEach>  
					
				</div>  
			<!--  -->   
			   
			 
	</div> 
					
				
	
		      	<!-- Footer here -->
		<div class = " wrapper navbar-fixed-bottom">
			<div class = "wrapper col-md-6">
			@Oleg Gonchar
			</div>
			<div class = "wrapper col-md-6">
			contact: o.gonchar@live.com
			</div>
		</div>
	<!-- End of footer -->
</body>
</html>