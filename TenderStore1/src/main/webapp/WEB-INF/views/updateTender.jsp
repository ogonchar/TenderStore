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
      <body style="background-image: url('<c:url value="/img/back3.jpg"></c:url>');">
      
        <!-- Navigation bar -->
        
		<div id="header">
				<div class='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' onclick = "location.href="/TenderStore">&nbsp;Домой</button></div>
				
			<!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/logout">Logout</a></div>
			</div>
		
	<!-- End of navigation -->
	
	<!-- Edit Section --> <div class="container">
   		
   			  <div class="mainDiv shadow">    
		            <form:form  method="POST" modelAttribute="updateTender" class="form-horizontal">
		               <fieldset>
		                  <legend><spring:message code="header.edit.mes"/></legend>  
		                  
		                  <!-- Name of company -->
		               
		                  <table class="tbl">
			                  <td><spring:message code="tender.idCompanyRecepient.mes"/></td>
			                  <td><form:input id="idCompanyRecepient" path="idCompanyRecepient" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                  
		                  <!-- City of company -->
		                   <table class="tbl">
			                  <td class="td"><spring:message code="tender.cityOfCompany.mes"/></td>
			                  <td class="td"><form:input id="cityOfCompany" path="cityOfCompany" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                 
		                  
		                  <!-- Price of tender  -->
		                   <table class="tbl">
			                  <td class="td"><spring:message code="tender.price.mes"/></td>
			                  <td class="td"><form:input id="price" path="price" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                  
		                  <!-- Deposit on participation -->
		                  <table class="tbl">
			                  <td class="td"><spring:message code="tender.procuring.mes"/></td>
			                  <td class="td"><form:input id="procuring" path="procuring" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                     
		                   <!-- Stage of tender -->
		                   <table class="tbl">
			                  <td class="td"'><spring:message code="tender.tenderstage.mes"/></td>
			                  
		                       <td class="td">
		                       <form:radiobutton path="tenderStage" value="filing" /><spring:message code="stages.filling.mes"/>
		                       <form:radiobutton path="tenderStage" value="consideration" /><spring:message code="stages.consideration.mes"/>
		                       <form:radiobutton path="tenderStage" value="complited" /><spring:message code="stages.complited.mes"/>
		                       <form:radiobutton path="tenderStage" value="archived" /><spring:message code="stages.archived.mes"/>
		                   
		                  </table>
		                  <br>
		                 
		                 <!-- Site of tender procedure -->
		                 <table class="tbl">
			                  <td class="td"'><spring:message code="tender.site.mes"/></td>
			                  <td class="td"><form:input id="site" path="site" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                 
		                  <!-- Dates -->
		                   <table class="tbl">
			                  <td class="td ">
			                  <div class="dateInput">
						         <form:label cssClass="control-label" path="dateTo"><spring:message code="tender.date.mes"/></form:label>
						     <form:input class= "dateInput" path="dateTo" cssClass="form-control" placeholder="${updateTender.dateTo}" />
						     </div>
						      </td>
			                  <td class="td">
			                   <div class="dateInput">
						         <form:label cssClass="control-label" path="dateTender"><spring:message code="tender.dateTender.mes"/></form:label>
						     <form:input path="dateTender" cssClass="form-control" placeholder="${updateTender.dateTender}" /> 
						     </div>
						     </td>
						     
		                  </table>
		                  <br><br><br> 
		                  
		                   <!-- Procuring tender -->
		                     <table class="tbl">
			                  <td class="td"><spring:message code="tender.procuringContract.mes"/></td>
			                  <td class="td"><form:input id="procuringContract" path="procuringContract" type="text" class="form-control"/></td>
		                  </table>
		                  <br>
		                  
		                  <!-- INN -->
		                  <table class="tbl">
			                  <td class="td"><spring:message code="tender.idinn.mes"/></td>
			                  <td class="td"><form:input id="idInn" path="idInn" type="text" class="form-control"/></td>
		                  </table>
		                     <br>
		                     <br>
		                     
		                     <!-- Buttons -->
		                       <div class="form-actions">
		                        <input type="submit" class="bt btnSubmit" value="<spring:message code="bottons.submit.mes"/>">
		                     </div>
		                     <br>
		                    <div class="form-actions">
		                        <input type="submit"
		                           class="bt btnBack" onclick = "location.href = '/TenderStore/tenders/${user}" value="<spring:message code="bottons.tenders.mes"/>"> 
		                     </div>
        			       </fieldset>
               			</form:form>
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