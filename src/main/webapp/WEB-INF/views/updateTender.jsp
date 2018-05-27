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
      <title>Edit Tender</title>
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
	
	<!-- Edit Section -->
     <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
               <div class="panel-heading">
		            <form:form  method="POST" modelAttribute="updateTender" class="form-horizontal">
		               <fieldset>
		                  <legend>Edit tender</legend>  
		                 <div class="input-group input-md">
		                   <label class="input-group-addon" for="idCompanyRecepient"><spring:message code="tender.idCompanyRecepient.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="idCompanyRecepient" path="idCompanyRecepient" type="text" class="form:input-large col-lg-8" style="line-height:30px; width:600px; "/>
		                     </div>
		                  </div>
		                  <br>
		                  <div class="input-group input-md">
		                   <label class="input-group-addon" for="cityOfCompany"><spring:message code="tender.cityOfCompany.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="cityOfCompany" path="cityOfCompany" type="text" class="form-control"/>
		                     </div>
		                  </div>
		                  <br>
		                    <div class="input-group input-md">
		                   <label class="input-group-addon" for="price"><spring:message code="tender.price.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="price" path="price" type="text" class="form-control"/>
		                     </div>
		                  </div>
		                  <br>
		                  <div class="input-group input-md">
		                  <label class="input-group-addon" for="procuring"><spring:message code="tender.procuring.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="procuring" path="procuring" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                   <div class="form-group">
		                     <label class="input-group-addon" for="tenderStage"><spring:message code="tender.tenderstage.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:radiobutton path="tenderStage" value="filing" />filing
		                        <form:radiobutton path="tenderStage" value="consideration" />consideration
		                        <form:radiobutton path="tenderStage" value="complited" />complited
		                     </div>
		                  </div>
		                 <br>
		                 <div class="input-group input-md">
		                  <label class="input-group-addon" for="cite"><spring:message code="tender.cite.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="cite" path="cite" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                     <div class="input-group input-md">
		                  <label class="input-group-addon" for="dateTo"><spring:message code="tender.date.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="dateTo" path="dateTo" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                     <div class="input-group input-md">
		                  <label class="input-group-addon" for="procuringContract"><spring:message code="tender.procuringContract.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="procuringContract" path="procuringContract" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                  <div class="input-group input-md">
		                  <label class="input-group-addon" for="idinn"><spring:message code="tender.idinn.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="idinn" path="idinn" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                     <br>
		                     <br>
		                       <div class="form-actions">
		                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Submit">
		                     </div>
		                     <br>
		                    <div class="form-actions">
		                        <input type="submit"
		                           class="btn btn-block btn-primary btn-danger" onclick = "location.href = '/TenderStore1/tenders/${user}'" value="Back">
		                     </div>
        			       </fieldset>
               			</form:form>
    	            </div>
                </div>
	        </div>
		</div>
    </div>   
         <!-- Tend of Edit section -->
         
         <!-- Footer here -->
		<div class = "navbar-fixed-bottom">
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