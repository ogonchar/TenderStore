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
<c:url var="home" value="/" scope="request" />
<script src="${jqueryJs}"></script>
<script type="text/javascript" src="<c:url value="/resources/js/contact.js" />"></script>
<link href="<c:url value="/css/contact.css"></c:url>" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- There are some links to CDN -->    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>
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
				    	<li class="active"><a href="/TenderStore/tenders/${contact.owner}">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			        <!-- 	<li id="AddTenderP"><a href="/TenderStore/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li> -->
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="/TenderStore/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
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
							<div class="col-md-12">
								<div class="form">
									<c:forEach items="${comments}" var="comments">	  
										<div>  
											<table id= "${comments.id}" class="table col-md-12 " >
												<div><td  class="col-md-1"><span id = "dateinfo" class="text-muted">${comments.date}</span></td></div> <td id="commentText${comments.id}" class="col-md-10 commenttext"><div><h5>${comments.text}</h5></div></td>
												<td ><button id="btnEdit${comments.id}" class="btn btnEdit" value="${comments.id}"><span class="glyphicon glyphicon-pencil"></span></button>
												<td ><button id="btnDel${comments.id}" class="btn btn-del" onclick = "location.href = '/TenderStore/contact/delete/${comments.id}/redir/${contact.idInn}'" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
												<td id = "editconf${comments.id}"></td>
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
		               
    	            </div>
                </div>
	        </div>
		</div> 
 
	
		
				
		    <!-- Tender section -->
				<div class="col-md-3">     
					<table class="table table-sm table-bordered">
						<tr class="active"><td>Tenders</td></tr> </table> 
							<c:forEach items="${tenders}" var="tenders">	
							<table class="table table-bordered"><tr class="active"><td><a href="/TenderStore/tender/${tenders.idTenderZakupki}">${tenders.idTenderZakupki}</a></td>
							<tr class="active"><td>${tenders.objectOfPurchase}</td></tr>
							<tr class="active"><td>${tenders.price} рублей</td></tr></table>
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
		
			<script>
			(function ($) {
				  $('#submitMyForm').on('click', function () {
				    $('#myForm').submit(); // js fiddle won't allow this
					  });
					})(jQuery);
				 
			
			/* Replacing comment text field with textarea to edit comment */
				$(function() {
				    $('.btnEdit').on('click', function() {
				    	var idOper = $(this).val();
				    	$('#btnEdit'+idOper).replaceWith('<button id="btned' + idOper+'" value="' + idOper+ '" type="submit" class="addit btn" >Send</button>');
				    	var input = $('<textarea />', {
				    			'id' : 'commenttext' + idOper,
				    	        'type': 'text',
				    	        'class': 'datePicker', 
				    	        'rows' :'3',
				    	        'cols' :'65',
				    	        'text': $('#commentText'+idOper).text()
				    	    });
				        $('#commentText'+idOper).replaceWith(input); 
				        $('#btnDel'+idOper).hide(); 
				   
				/* On clicked send button send info on server and replace everything back */
				 $(document).on("click", ".addit", function(e) {  
					 e.preventDefault();
					 	var text = $("#commenttext"+idOper).val() + ":::" +  idOper;
					 	$.ajax({ 
							type : "POST",
							contentType: "text/plain",
							url : "${home}editcomment",
							datatype : "text",
							data : text,  
							success : function(data) {  
							},
							error : function(e) {
								alert('error');  
							},
						});
					 	$("#commenttext"+idOper).replaceWith('<td class = "col-md-10 commenttext" id="commentText' + idOper + '" class="col-md-10"><div>' + $("#commenttext"+idOper).val() + '</div></td>');
					 	$('#btned'+idOper).replaceWith('<button id="btnEdit' + idOper + '" class="btnEdit btn" value="' + idOper + '"><span class="glyphicon glyphicon-pencil"></span></button>');
					 	$('#btnDel'+$(this).attr('value')).show(); 
					});
				    });
				});	 (jQuery);
					 
		</script>
 
		
	<!-- End of scripts -->
	
	
</body>
</html>