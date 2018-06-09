<%@page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/css/tenders.css"></c:url>" rel="stylesheet" /> 


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<!-- There are some links to CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js" type="text/javascript"></script> 

<!-- End of links -->


<title>Your tenders</title>
</head>
<body style="background-image: url('<c:url value="/img/back3.jpg"></c:url>');">


	<!-- Form for pop up warnings -->
		<form class="area">
		<div class="fixed " id="popUps"></div>
		</form>


	<!-- Navigation bar -->
		<div id="header">
				<div class='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' onclick="location.href = '/TenderStore'">&nbsp;Домой</button></div>
 
			<!-- AddByParser -->
				<input type="text" placeholder="Добавить аукцион по номеру на Zkupki.gov.ru" id="tenderId"> 
				<button type="submit" id="bthAddTender">add</button>

			<!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'>	<a href="/TenderStore/logout">Logout</a></div>
			</div>
	<!-- End of navigation -->
	
	<!-- I don;t know why but without this div header bubbled will fix later!!!!! -->
	<div style = 'color: lightgrey'>.</div>



	<!-- Tenders information blocks -->

	<div class="tendersContainer">
		<c:forEach items="${tendersfiling}" var="tendersfiling">
			<div class='tendcont'>
				<div class="tendStageFill tend"><span class="lower">Подача</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tendersfiling.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tendersfiling.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tendersfiling.idTenderZakupki}'"><div class="overflow">${tendersfiling.idCompanyRecepient}<br>
							<form class="popup">Ссылка на страницу аукциона</form><br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tendersfiling.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tendersfiling.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersfiling.idTenderZakupki}'">Edit</div>
			</div>
		
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tendersfiling.idTenderZakupki}">
				<table class="tbl">
					<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tendersfiling.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tendersfiling.procuring}</td></tr>
						<tr><td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tendersfiling.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tendersfiling.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tendersfiling.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tendersfiling.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div class="tendersContainer">
		<c:forEach items="${tendersconsideration}" var="tendersconsideration">
			<div class='tendcont'>
				<div class="tendStageCons tend"><span class="lower">Подача</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tendersconsideration.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tendersconsideration.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tendersconsideration.idTenderZakupki}'"><div class="overflow">${tendersconsideration.idCompanyRecepient}<br>
							<form class="popup">Ссылка на страницу аукциона</form><br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tendersconsideration.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tendersconsideration.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}'">Edit</div>
			</div>
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tendersconsideration.idTenderZakupki}">
				<table class="tbl">
					<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tendersconsideration.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tendersconsideration.procuring}</td></tr>
						<tr> <td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tendersconsideration.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tendersconsideration.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tendersconsideration.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tendersconsideration.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div class="tendersContainer">
		<c:forEach items="${tenderscomplited}" var="tenderscomplited">
			<div class='tendcont'>
				<div class="tendStageCompl tend"><span class="lower">Подача</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tenderscomplited.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tenderscomplited.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tenderscomplited.idTenderZakupki}'"><div class="overflow">${tenderscomplited.idCompanyRecepient}<br>
							<form class="popup">Ссылка на страницу аукциона</form><br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tenderscomplited.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tenderscomplited.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}'">Edit</div>
			</div>
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tenderscomplited.idTenderZakupki}">
					<table class="tbl">
						<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tenderscomplited.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tenderscomplited.procuring}</td></tr>
						<tr> <td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tenderscomplited.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tenderscomplited.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tenderscomplited.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tenderscomplited.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>

	<!-- End of Tenders information blocks-->



	<!-- Footer here --> 
	<div class=" wrapper navbar-fixed-bottom">
		<div>
			<form method="get" action="/TenderStore/archive/${user}">
				<button class="btn btn-lg btn-block" style='color:white'type="submit">Archive</button>
		</form>
	</div>
		<div class="wrapper col-md-6">@Oleg Gonchar</div>
		<div class="wrapper col-md-6">contact: o.gonchar@live.com</div>
	</div>
	<!-- End of footer -->
	
	<script type="text/javascript" src="<c:url value='/js/tenders.js'></c:url>"></script>

</body>
</html>
