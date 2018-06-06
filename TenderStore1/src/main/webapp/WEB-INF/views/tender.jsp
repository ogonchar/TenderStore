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
     <body style="background-image: url('<c:url value="/img/back.jpg"></c:url>');">
      
      
      
        <!-- Navigation bar -->
	<div id="header">
				<div class='headerSection'>
					<img src="<c:url value="/img/logo1.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' href="/TenderStore">&nbsp;Домой</button></div>
				
			<!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'>	<a href="/TenderStore/logout">Logout</a></div>
			</div>
		
	<!-- End of navigation -->
	
	<!-- Information about tender --> 
		

	 
      <div class="mainDiv shadow">  
      	<div class="marg">
		                  <legend><h3><spring:message code="header.tender.mes"/> ${tender.idTenderZakupki}</h3></legend>  
		                  
		                  
		                    <div class="rowr"><div class='paramDiv'><spring:message code="tender.idTenderZakupki.mes"/></div><div class='dataDiv'>${tender.idTenderZakupki}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.idCompanyRecepient.mes"/></div><div class='dataDiv'>${tender.idCompanyRecepient}</div></div>
		                  <div class="rowr"><div class='paramDiv'><spring:message code="tender.cityOfCompany.mes"/></div><div class='dataDiv'>${tender.cityOfCompany}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.price.mes"/></div><div class='dataDiv'>${tender.price}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.tenderstage.mes"/></div><div class='dataDiv'>${tender.tenderStage}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.procuring.mes"/></div><div class='dataDiv'>${tender.procuring}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.site.mes"/></div><div class='dataDiv'><a href="http:/${tender.site}">${tender.site}</a></div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.date.mes"/></div><div class='dataDiv'>${tender.dateTo}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.procuringContract.mes"/></div><div class='dataDiv'>${tender.procuringContract}</div></div>
                      <div class="rowr"><div class='paramDiv'><spring:message code="tender.idinn.mes"/></div><div class='dataDiv'>${tender.idInn}</div></div>
		                 
		                    
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
			<div class="contactSection shadow">
				<div id = "contactRef"><a href="/TenderStore/contact/3911011965">${contact.name}</a></div>
				<div class = 'contactDiv'>&#9742;&nbsp${contact.phone}</div>
				<div class = 'contactDiv'>&#9993;&nbsp${contact.email}</div>
				<div class = 'contactDiv'><spring:message code="contact.city.mes"/>&nbsp${contact.city}</div>
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