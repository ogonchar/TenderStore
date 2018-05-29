<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<section>
		<div class="jumbotron" >
			<div class="container">
				<h1>tender ${tender.idTenderZakupki}</h1>
			</div>
		</div>
	</section>
<div class="collapse" id="theSection${tender.idTenderZakupki}">
						<table class ="table">
						<tr><td><spring:message code="tender.idCompanyRecepient.mes"/></td>
							<td>${tender.idCompanyRecepient}</td></tr>
							<tr><td><spring:message code="tender.cityOfCompany.mes"/></td>
							<td>${tender.cityOfCompany}</td></tr>
							<tr><td><spring:message code="tender.price.mes"/></td>
							<td>${tender.price}</td></tr>
							<tr><td><spring:message code="tender.dateTender.mes"/></td>
							<td>${tender.dateTender}</td></tr>
							<tr><td><spring:message code="tender.procuring.mes"/></td>
							<td>${tender.procuring}</td></tr>
							<tr><td><spring:message code="tender.cite.mes"/></td>
							<td>${tender.cite}</td></tr>
							<tr><td><spring:message code="tender.cite.mes"/></td>
							<td>${tender.cite}</td></tr>
							<tr><td><spring:message code="tender.dateTender.mes"/></td>
							<td>${tender.dateTender}</td></tr>
							<tr><td><spring:message code="tender.procuringContract.mes"/></td>
							<td>${tender.procuringContract}</td></tr>
						</table>
					</div>

</body>
</html>