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
      <!--  jQuery -->
	  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	  <!-- Bootstrap Date-Picker Plugin -->
	  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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
				    	<li class="active"><a href="/TenderStore1/tenders/${user}'">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			    	</ul>
			    	
			<!-- Logging in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="#" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
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
		                  
		                  <!-- Name of company -->
		                 <div class="input-group input-md">
		                   <label class="input-group-addon" for="idCompanyRecepient"><spring:message code="tender.idCompanyRecepient.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="idCompanyRecepient" path="idCompanyRecepient" type="text" class="form:input-large col-lg-8" style="line-height:30px; width:600px; "/>
		                     </div>
		                  </div>
		                  <br>
		                  
		                  <!-- City of company -->
		                  <div class="input-group input-md">
		                   <label class="input-group-addon" for="cityOfCompany"><spring:message code="tender.cityOfCompany.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="cityOfCompany" path="cityOfCompany" type="text" class="form-control"/>
		                     </div>
		                  </div>
		                  <br>
		                  
		                  <!-- Price of tender  -->
		                    <div class="input-group input-md">
		                   <label class="input-group-addon" for="price"><spring:message code="tender.price.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="price" path="price" type="text" class="form-control"/>
		                     </div>
		                  </div>
		                  <br>
		                  
		                  <!-- Deposit on participation -->
		                  <div class="input-group input-md">
		                  <label class="input-group-addon" for="procuring"><spring:message code="tender.procuring.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="procuring" path="procuring" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                     
		                   <!-- Stage of tender -->
		                   <div class="form-group">
		                     <label class="input-group-addon" for="tenderStage"><spring:message code="tender.tenderstage.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:radiobutton path="tenderStage" value="filing" />filing
		                        <form:radiobutton path="tenderStage" value="consideration" />consideration
		                        <form:radiobutton path="tenderStage" value="complited" />complited
		                        <form:radiobutton path="tenderStage" value="archived" />archived
		                     </div>
		                  </div>
		                 <br>
		                 
		                 <!-- Site of tender procedure -->
		                 <div class="input-group input-md">
		                  <label class="input-group-addon" for="site"><spring:message code="tender.site.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="site" path="site" type="text" class="form-control"/>
		                     </div>
		                     </div>
		                     <br>
		                   
		                     <div class="input-group input-md">
						         <form:label cssClass="control-label" path="dateTo">Last day for participation</form:label>
      							  <div class="controls">
						     <form:input path="dateTo" cssClass="form-control" placeholder="${updateTender.dateTo}" />
						      </div>
						      </div>
						      <br>
						       <div class="input-group input-md">
						         <form:label cssClass="control-label" path="dateTender">Day of procedure</form:label>
      							  <div class="controls">
						     <form:input path="dateTender" cssClass="form-control" placeholder="${updateTender.dateTender}" /> 
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
		                  <label class="input-group-addon" for="idInn"><spring:message code="tender.idinn.mes"/></label>
		                     <div class="input-group-addon">
		                        <form:input id="idInn" path="idInn" type="text" class="form-control"/>
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
		                           class="btn btn-block btn-primary btn-danger" onclick = "location.href = '/TenderStore1/tenders/${user}" value="Back">
		                     </div>
        			       </fieldset>
               			</form:form>
    	            </div>
                </div>
	        </div>
		</div>
    </div>   
         <!-- End of Edit section -->
         
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
	
	
    <!-- Scripts for calendar view for  date selection -->    
      </body>
      <script>
		    $(document).ready(function(){
		        var date_input=$('input[name="dateTo"]');
		        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		        date_input.datepicker({
		            format: 'mm-dd-yyyy',  
		            container: container,
		            todayHighlight: true,
		            autoclose: true,
		        })
		    })
		    
		    $(document).ready(function(){
		        var date_input=$('input[name="dateTender"]');
		        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		        date_input.datepicker({
		            format: 'mm-dd-yyyy',  
		            container: container,
		            todayHighlight: true,
		            autoclose: true,
		        })
		    })
    
	</script>
	
	<!--   -->
	
</html>