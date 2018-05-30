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
<link href="<c:url value="/css/contact.css"></c:url>" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
			        <div>
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
	
	

	<div id="feedback"></div>
      <div class="col-md-8 col-md-offset-1 " >   
         <div style = "height: 100%;">
            <div class="panel panel-default">
               <div class=" h-100 panel-heading" style = "height: 1000px;">   
		            
		                  <legend>Contact</legend>  
		                  <div class = "panel panel-default">  
								<h5>${contact.name} </h5>
						  </div>
		                  
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.idTenderZakupki.mes"/></td>
			                  <td class="td">${contact.idInn}</td>
		                  </table>
		                  <br>
		                   <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.idCompanyRecepient.mes"/></td>
			                  <td class="td">${contact.city}</td>
		                  </table>
		                  <br>
		                   <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.cityOfCompany.mes"/></td>
			                  <td class="td">${contact.fullName}</td>
		                  </table>
		                  <br>
		                    <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.price.mes"/></td>
			                  <td class="td">${contact.phone}</td>
		                  </table>
		                  <br>
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.procuring.mes"/></td>
			                  <td class="td">${contact.email}</td>
		                  </table>
		                  
		              <!-- Comment section -->
							<div class="col-md-12" id = "asd">
								<div class="form">
									<c:forEach items="${comments}" var="comments">	  
										<div>  
											<table id= "${comments.id}" class="table table-striped table-bordered table-sm tb col-md-12 " >
												<div><td  class="col-md-1"><span class="text-muted">commented ${comments.date}</span></td></div> <td id="commentText${comments.id}" class="col-md-10"><div><h5>${comments.text}</h5></div></td>
												<td ><button id="btnEd" class="btn btn-warning btnEdit" value="${comments.id}" name="but1"><span class="glyphicon glyphicon-pencil"></span></button>
												<td ><button class="btn btn-danger" onclick = "location.href = '/TenderStore1/contact/delete/${comments.id}/redir/${contact.idInn}'" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
												<td id = "ass"></td>
											</table> 
										</div>  
									</c:forEach>
								</div>    
								<div>  
									<form:form id="myForm" method="POST" commandName="comment" modelAttribute="comment">
										<h4>Add comment: </h4>
											<div class="input-group">
											   <td><form:textarea class="form-control" path="text" rows="3" cols="120" /></td>
											    <span type="submit" class="input-group-addon btn" id="submitMyForm">Send</span>
											    
													
											</div>
									</form:form>
								</div>
							</div>
								
						<!-- -->		
		                <div id="editButton" hidden>
							<div class="form-actions" >
		                    	<input type="submit" class="btn btn-block btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tender.idTenderZakupki}'" value="Edit">  
		                    </div>
		                </div>
    	            </div>
                </div>
	        </div>
		</div> 
 
	
		
				
		    <!-- Tender section -->
				<div class="col-md-3">     
					<table class="table table-sm">
						<tr class="active"><td>Tenders</td></tr> </table> 
							<c:forEach items="${tenders}" var="tenders">	
							<table class="table"><tr class="active"><td><a href="/TenderStore1/tender/${tenders.idTenderZakupki}">${tenders.idTenderZakupki}</a></td>
							<tr class="active"><td>${tenders.objectOfPurchase}</td></tr></table>
							</c:forEach>  
					
				</div>  
			<!--  -->   
			   
			 

				
				
	
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
	
	
	
	<!-- Scripts -->
		
			<script type="text/javascript">
			
			
			(function ($) {
				 $('.btnEdit').on('click', function () {
					alert( document.getElementById('btnEd').value );
					$(document.getElementById('btnEd').value).replaceWith('<div class="input-group">');
					$('#commentText' + document.getElementById('btnEd').value).replaceWith('<textarea class = "addit" id="copy1" path="text" rows="3" cols="65"></textarea>').clone();
					$('#ass').replaceWith('<span type="submit" class="addit input-group-addon btn" id="editMyForm">Send</span>');
				});
			})(jQuery);
			
			
		</script>

	
	
	<!-- Using function to span submit textarea comment form, cause bootstrap do not allow to add addon button to textarea -->
	<script type="text/javascript">
	 (function ($) {
		  $('#submitMyForm').on('click', function () {
		    $('#myForm').submit(); // js fiddle won't allow this
		    
		  });
		  
		})(jQuery);
	 
	 (function ($) {
		  $('#editMyForm').on('click', function () {
			  alert( document.getElementById('btnEd').value );
		    $('#copy1').submit(); // js fiddle won't allow this
		    
		  });
		  
		})(jQuery);
	</script>
	
	
	<!-- End of scripts -->
	
	
</body>
</html>