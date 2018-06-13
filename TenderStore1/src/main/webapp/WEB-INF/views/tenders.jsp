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
				<div class='headerSection'>	<button id='home' onclick="location.href = 'index.html'">&nbsp;Домой</button></div>
				<div class = "headerSection">	<button id="filtersSectionToggle">Фильтры</button></div>

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


	<!-- Filters section -->

		<div id="filtersSection">
			<!-- Stage filter-->
			<div class="filtersContainer">
				<button class="filtersToggle" data-target="#stageChackList">Этап Закупки</button>
				<div id="stageChackList" class="dropdown-menu">
						<div class='buttonWrapper'><button class="options stageCheck" state='unchecked' value='filling'/>Подача</button></div>
						<div class='buttonWrapper'><button class="options stageCheck" state='unchecked' value='consideration'/>Рассмотрение</button></div>
						<div class='buttonWrapper'><button class="options stageCheck" state='unchecked' value='complited'/>Завершенные</button></div>
				</div>
		</div>
		<!--  -->

		<!-- Site filter -->
			<div class="filtersContainer">
				<button class="filtersToggle" data-toggle="collapse" data-target="#siteCheckList">Сайт процедуры</button>
				<div id="siteCheckList" class="dropdown-menu">
					<div class='buttonWrapper'><button class="options siteCheck" state='unchecked' value='www.sberbank-ast.ru'/>sberbank-ast.ru</button></div>
					<div class='buttonWrapper'><button class="options siteCheck" state='unchecked' value='www.rts-tender.ru'/>rts.ru</button></div>
					<div class='buttonWrapper'><button class="options siteCheck" state='unchecked' value='www.mmvb.ru'/>mmvb.ru</button></div>
				</ul>
			</div>
		</div>
		<!--  -->

		<!-- Price filter -->
			<div class="filtersContainer">
				<button class="filtersToggle" data-toggle="collapse" data-target="#priceBordersToggle">Цена</button>
				<div id="priceBordersToggle" class="dropdown-menu"><input type="text" id="minPrice" class="priceInputs"> - <input type="text" id="maxPrice" class="priceInputs"></div>
		</div>
		<!--  -->

		<!-- ImportanceFilter -->
			<div class="filtersContainer">
				<button class="filtersToggle" data-toggle="collapse" data-target="#importanceFlagToggle">Важность</button>
				<div id="importanceFlagToggle" class="dropdown-menu">
					<ul>
						<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='sberbank' />Только важные
						</label></li>
				</ul>
			</div>
		</div> <!--  -->
				<div><button id="btnFilterConfim" class="btn">Применить</button></div>
	</div>
		<!-- End of filters -->


	<!-- Tenders information blocks -->

	<div class="tendersContainer" id ='tendersFilingContainer'>
		<c:forEach items="${tendersfiling}" var="tendersfiling">
			<div class='tendcont' id = "tender${tendersfiling.idTenderZakupki}">
				<div class="tendStageFill tend"><span class="lower">Подача</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}')">
					${tendersfiling.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tendersfiling.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tendersfiling.idTenderZakupki}'"><div class="overflow">${tendersfiling.idCompanyRecepient}<br>
							<br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tendersfiling.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tendersfiling.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersfiling.idTenderZakupki}'">Edit</div>
			</div>
		
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tendersfiling.idTenderZakupki}">
				<table class="tbl">
						<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData objectOfPurchase">${tendersfiling.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData procuring">${tendersfiling.procuring}</td></tr>
						<tr> <td class="tenderTableData">Сайт</td>
							<td class="tenderTableData site">${tendersfiling.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData dateTo">${tendersfiling.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData dateTender">${tendersfiling.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData procuringContract">${tendersfiling.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div class="tendersContainer" id ='tendersConsiderationContainer'>
		<c:forEach items="${tendersconsideration}" var="tendersconsideration">
			<div class='tendcont' id = "tender${tendersconsideration.idTenderZakupki}">
				<div class="tendStageCons tend"><span class="lower">Рассмотрение</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}')">
					${tendersconsideration.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tendersconsideration.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tendersconsideration.idTenderZakupki}'"><div class="overflow">${tendersconsideration.idCompanyRecepient}<br>
							<br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tendersconsideration.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tendersconsideration.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}'">Edit</div>
			</div>
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tendersconsideration.idTenderZakupki}">
				<table class="tbl">
						<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData objectOfPurchase">${tendersconsideration.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData procuring">${tendersconsideration.procuring}</td></tr>
						<tr> <td class="tenderTableData">Сайт</td>
							<td class="tenderTableData site">${tendersconsideration.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData dateTo">${tendersconsideration.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData dateTender">${tendersconsideration.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData procuringContract">${tendersconsideration.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div class="tendersContainer" id ='tendersComplitedContainer'>
		<c:forEach items="${tenderscomplited}" var="tenderscomplited">
			<div class='tendcont' id = "tender${tenderscomplited.idTenderZakupki}">
				<div class="tendStageCompl tend"><span class="lower">Подача</span></div>
				<div class="tendid tend" type="button"  data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}')">
					${tenderscomplited.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span><form class="popup">Ссылка на Zakupki.gov</form>${tenderscomplited.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span></div>
				<div class="tendName tend" type="button" onclick="location.href = '/TenderStore/tender/${tenderscomplited.idTenderZakupki}'"><div class="overflow">${tenderscomplited.idCompanyRecepient}<br>
							<br><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></div>
				<div class="tendCity tend">${tenderscomplited.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></div>
				<div class="tendPrice tend">${tenderscomplited.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></div>
				<div class='tendInf tend' type="button" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></div>
				<div class="tendEdit tend" type="button" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}'">Edit</div>
			</div>
		<!-- Sliding table -->
			<div class="collapse" id="theSection${tenderscomplited.idTenderZakupki}">
					<table class="tbl">
							<tr><td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData objectOfPurchase">${tenderscomplited.objectOfPurchase}</td></tr>
						<tr><td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData procuring">${tenderscomplited.procuring}</td></tr>
						<tr> <td class="tenderTableData">Сайт</td>
							<td class="tenderTableData site">${tenderscomplited.site}</td></tr>
						<tr><td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData dateTo">${tenderscomplited.dateTo}</td>	</tr>
						<tr><td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData dateTender">${tenderscomplited.dateTender}</td>	</tr>
						<tr><td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData procuringContract">${tenderscomplited.procuringContract}</td></tr>
				</table>
			</div>
		</c:forEach>
	</div>

	<!-- End of Tenders information blocks-->

	<!-- Notification -->
	<div id = 'notif'></div>

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
	<script type="text/javascript" src="<c:url value='/js/filters.js'></c:url>"></script>


</body>
</html>
