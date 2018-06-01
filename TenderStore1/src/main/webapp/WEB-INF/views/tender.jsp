<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

 <html>
     <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
     <link href="<c:url value="/css/tender.css"></c:url>" rel="stylesheet" />
     <title>${tender.idTenderZakupki}</title>
     </head> 
     <body>
      
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
				    	<li class="active"><a href="/TenderStore/tenders/${user}">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			     
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="#" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			
				</div>
			</div>
		</nav>  
		
	<!-- End of navigation -->
	
	<!-- Information about tender --> 
		

	 
      <div class="mainDiv shadow">  
      	<div class="marg">
		                  <legend><h3><spring:message code="header.tender.mes"/> ${tender.idTenderZakupki}</h3></legend>  
		                  
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.idTenderZakupki.mes"/></td>
			                  <td class="td">${tender.idTenderZakupki}</td>
		                  </table>
		                  <br>
		                   <table class = "tbl">
			                  <td class="td"><spring:message code="tender.idCompanyRecepient.mes"/></td>
			                  <td class="td">${tender.idCompanyRecepient}</td>
		                  </table>
		                  <br>
		                   <table class = "tbl">
			                  <td class="td"><spring:message code="tender.cityOfCompany.mes"/></td>
			                  <td class="td">${tender.cityOfCompany}</td>
		                  </table>
		                  <br>
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.price.mes"/></td>
			                  <td class="td">${tender.price}</td>
		                  </table>
		                  <br>
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.tenderstage.mes"/></td>
			                  <td class="td">${tender.tenderStage}</td>
		                  </table> 
		                  <br>
		                    <table class = "tbl">
			                  <td class="td"><spring:message code="tender.procuring.mes"/></td>
			                  <td class="td">${tender.procuring}</td>
		                  </table>
		                  <br>
		                    <table class = "tbl">
			                  <td class="td"><spring:message code="tender.site.mes"/></td>
			                  <td class="td"><a href="http:/${tender.site}">${tender.site}</a></td>
		                  </table>
		                  <br>
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.date.mes"/></td>
			                  <td class="td">${tender.dateTo}</td>
		                  </table>
		                  <br>
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.procuringContract.mes"/></td>
			                  <td class="td">${tender.procuringContract}</td>
		                  </table>
		                  <br>
		                  <table class = "tbl">
			                  <td class="td"><spring:message code="tender.idinn.mes"/></td>
			                  <td class="td">${tender.idInn}</td>
		                  </table>
		                    
		                      <br>
		                        <div class="form-actions">
		                        <input type="submit" class="bt btnEd" onclick = "location.href = '/TenderStore/tenders/updateTender?id=${tender.idTenderZakupki}'" value="<spring:message code="bottons.edit.mes"/>">  
		                     </div>
		                        <br>

		                       <div class="form-actions">
		                        <input type="submit" class="bt btnBack" onclick = "location.href = '/TenderStore/tenders/${user}'" value="<spring:message code="bottons.tenders.mes"/>">
		                     </div>
		                     <br>
		                     
		                      <div class="form-actions">
		                        <input type="submit" class="bt btnDel" onclick = "location.href = '/TenderStore/tenders/delete/${tendersfiling.idTenderZakupki}'" value="<spring:message code="bottons.delete.mes"/>">
		                     </div>
		     </div>    
    	</div>
            
		<div class="contDiv shadow"> 
		  <div class="marg">
		
					<table id = contactsTable >
					 <div colspan="2" id = "contactRef"><a href="/TenderStore/contact/${contact.idInn}">${contact.name}</a></div>
					
							<tr><td class="td"'><spring:message code="contact.phone.mes"/></td>
					
							<td class="td">${contact.phone}</td>
						
							<tr><td class="td"'><spring:message code="contact.email.mes"/></td>
							<td class="td">${contact.email}</td>
			
							<tr><td class="td"'><spring:message code="contact.city.mes"/></td>
							<td class="td">${contact.city}</td> 
					</table>
				</div>
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