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
				<div class='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' onclick = "location.href="/TenderStore">&nbsp;Домой</button></div>
				
			<!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/logout">Logout</a></div>
			</div>
		
	<!-- End of navigation -->
	
	
	
	<!-- Information about tender --> 
	 
      	<div class="tenderInfoTable"> 
		    <legend><h3><spring:message code="header.tender.mes"/> ${tender.idTenderZakupki}</h3></legend>  
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.idTenderZakupki.mes"/></div><div class='dataTend'>${tender.idTenderZakupki}</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.idCompanyRecepient.mes"/></div><div class='dataTend'>${tender.idCompanyRecepient}</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.cityOfCompany.mes"/></div><div class='dataTend'>${tender.cityOfCompany}</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.price.mes"/></div><div class='dataTend'>${tender.price}&#x20bd;</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.tenderstage.mes"/></div><div class='dataTend'>${tender.tenderStage}</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.procuring.mes"/></div><div class='dataTend'>${tender.procuring}&#x20bd;</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.site.mes"/></div><div class='dataTend'><a href="http:/${tender.site}">${tender.site}</a></div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.date.mes"/></div><div class='dataTend'>${tender.dateTo}</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.procuringContract.mes"/></div><div class='dataTend'>${tender.procuringContract}&#x20bd;</div></div>
				<div class="rowTend"><div class='paramTend'><spring:message code="tender.idinn.mes"/></div><div class='dataTend'>${tender.idInn}</div></div>
							
		<!-- Buttons -->
	
		<input type="submit" class="bt btnEd" onclick = "location.href = '/TenderStore/tenders/updateTender?id=${tender.idTenderZakupki}'" value="<spring:message code="bottons.edit.mes"/>">  
		<input type="submit" class="bt btnBack" onclick = "location.href = '/TenderStore/tenders/${user}'" value="<spring:message code="bottons.tenders.mes"/>">
		<input type="submit" class="bt btnDel" onclick = "location.href = '/TenderStore/tenders/delete/${tender.idTenderZakupki}'" value="<spring:message code="bottons.delete.mes"/>">

   		<!--  -->
   		
    	</div>
		
	<!--  -->
	
    <!-- Information about contact and link to contact page --> 
	            
		<div class="contactSection"> 
				<div id = "contactRef" type='button' onclick='location.href = "/TenderStore/contact/${contact.idInn}"'><h5>${contact.name}</h5></div>
				<div class = 'contactLine'>&#9742;&nbsp${contact.phone}</div>
				<div class = 'contactLine'>&#9993;&nbsp${contact.email}</div>
				<div class = 'contactLine'><spring:message code="contact.city.mes"/>&nbsp${contact.city}</div>
		</div>
	<!--  -->
		

	<!-- Footer here -->
			<div id = "footer">
				<div >@Oleg Gonchar</div>
				<div >contact: o.gonchar@live.com</div>
			</div>
		<!-- End of footer -->
	
	
	</body>
</html>