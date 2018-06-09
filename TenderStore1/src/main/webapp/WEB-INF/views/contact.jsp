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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/css/contact.css"></c:url>" rel="stylesheet" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<title>Contact</title>
</head>

<body style="background-image: url('<c:url value="/img/back.jpg"></c:url>');">

<!-- Main container-->
	
	<!-- Navigation bar -->
			<div id="header">
				<div id='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' href="/TenderStore/tenders">Домой</button></div>
				
			<!--  --> <!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'>	<a href="/TenderStore/logout">Logout</a></div>
			</div>
	<!-- End of navigation -->
	
	

	<!-- Info section -->
      <div id="contactInfoTable"> 
  	   		 <legend>${contact.name}</legend>   
					<div class="rowr"><div class='paramDiv'><spring:message code="contact.idinn.mes"/></div><div class='dataDiv'>${contact.idInn}</div></div>
					<div class="rowr"><div class='paramDiv'><spring:message code="contact.city.mes"/></div><div class='dataDiv'>${contact.city}</div></div>
					<div class="rowr"><div class='paramDiv'><spring:message code="contact.fullname.mes"/></div><div class='dataDiv'>${contact.fullName}</div></div>
					<div class="rowr"><div class='paramDiv'><spring:message code="contact.phone.mes"/></div><div class='dataDiv'>${contact.phone}</div></div>
					<div class="rowr"><div class='paramDiv'><spring:message code="contact.email.mes"/></div><div class='dataDiv'>${contact.email}</div></div>
		                  
		              <!-- Comment section -->
						<c:forEach items="${comments}" var="comments">	  
											<div id= "${comments.id}" class="commentsDiv" >
												<span id = "dateinfo" class="commentDate text-muted">${comments.date}</span>
												<div  id = "commentText${comments.id}" class="commenttext"><h5>${comments.text}</h5></div>
												<div class='btnDiv'><button id="btnEdit${comments.id}" class="btnEdit" value="${comments.id}"><span class="glyphicon glyphicon-pencil"></span></button>
												<button id="btnDel${comments.id}" class="btn-del" onclick = "location.href = '/TenderStore/contact/delete/${comments.id}/redir/${contact.idInn}'" type="submit"><span class="glyphicon glyphicon-remove"></span></button></div>
												<td id = "editconf${comments.id}"></td>
										</div>  
									</c:forEach>
									<form:form id="myForm" method="POST" commandName="comment" modelAttribute="comment">
										<h4>Add comment: </h4>
											<div class="input-group">
											   <td><form:textarea class="form-control" path="text" rows="3" cols="120" /></td>
											    <span type="submit" class="input-group-addon btn" id="submitMyForm"><spring:message code="button.commentadd.mes"/></span>
											</div>
									</form:form>
								</div>
						<!-- -->		
		               
				
		    <!-- Tenders section -->
				<div id="tendersSection"> 
							<c:forEach items="${tenders}" var="tenders">	
							<div id = 'linkToTender' type='button' onclick='location.href="/TenderStore/tender/${tenders.idTenderZakupki}"'><h5>${tenders.idTenderZakupki}</h5></div>
							<div class = 'tenderRow'>${tenders.objectOfPurchase}</div>
							<div class = 'tenderRow'>${tenders.price}&#x20bd;</div>
							</c:forEach>
				</div>  
			
			<!--  -->   
			
		<!-- Footer here -->
			<div class = "footer">
				<div >@Oleg Gonchar</div>
				<div >contact: o.gonchar@live.com</div>
			</div>
		<!-- End of footer -->
	
	 
	<!-- Scripts -->
		
			<script> 
		
				 
		</script>
 
		<script type="text/javascript" src="<c:url value="/js/contact.js" />"></script>
	<!-- End of scripts -->
	
	
</body>
</html>