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
<script src="${jqueryJs}"></script>
<c:url var="home" value="/" scope="request" />
<script type="text/javascript" src="js/tenders.js"></script>
<link href="<c:url value="/css/tenders.css"></c:url>" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<!-- There are some links to CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- End of links -->


<title>Your tenders</title>
</head>
<body style="background-image: url('<c:url value="/img/back.jpg"></c:url>');">



<form class="area">
<div class="fixed " id="feedback"></div>
</form>
	<!-- Main container--> 
		<div id="header">
				<div class='logo'>
					<img src="<c:url value="/img/logo.png"></c:url>" alt="image"  style = "height:40px"> </div> 
				<div class='headerSection'>	<button id='home' href="/TenderStore">&nbsp;Домой</button></div>
					<div id="filters">	<button id="filtersSectionToggle">Фильтры</button></div>

				<!-- AddByParser -->
				<input type="text" placeholder="Добавить аукцион по номеру на Zkupki.gov.ru" id="tenderId"> 
				<button type="submit" id="bthAddTender">add</button>

			<!--  --> <!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'>	<a href="/TenderStore/logout">Logout</a></div>
			</div>
	<!-- End of navigation -->


	<!-- Filters section -->
	
	<div id="filtersSection">
		<!-- Stage filter-->
		<div class="filtersContainer">
			<button class="filtersToggle" data-toggle="collapse" tender.tenderstage.mes data-target="#stageChackList"><spring:message code="filters.filterStage.mes" /></button>
			<div id="stageChackList" class="dropdown-menu">
				<ul>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='filling' /> <spring:message code="stages.filling.mes" />
					</label></li>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='consideration' /> <spring:message code="stages.consideration.mes" />
					</label></li>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='complited' /> <spring:message code="stages.complited.mes" />
					</label></li>
					<li role="separator" class="divider"></li>

			</ul>
		</div>
	</div> 
	<!--  --> 
	
	<!-- Site filter -->
		<div class="filtersContainer">
			<button class="filtersToggle" data-toggle="collapse" data-target="#siteCheckList"><spring:message code="filters.filterSite.mes" /></button>
			<div id="siteCheckList" class="dropdown-menu">
				<ul>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='sberbank' /> <spring:message code="filters.sberbank.mes" />
					</label></li>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='rts' /> <spring:message code="filters.rts.mes" />
					</label></li>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='mmvb' /> <spring:message code="filters.mmvb.mes" />
					</label></li>
					<li role="separator" class="divider"></li>

			</ul>
		</div> 
	</div> 
	<!--  --> 
	
	<!-- Price filter -->
		<div class="filtersContainer">
			<button class="filtersToggle" data-toggle="collapse" data-target="#priceBordersToggle"><spring:message code="filters.filterPrice.mes" /></button>
			<div id="priceBordersToggle" class="dropdown-menu"><input type="text" id="minPrice" class="priceInputs"> - <input type="text" id="maxPrice" class="priceInputs"></div>
	</div> 
	<!--  --> 
	
	<!-- ImportanceFilter -->
		<div class="filtersContainer">
			<button class="filtersToggle" data-toggle="collapse" data-target="#importanceFlagToggle"><spring:message code="filters.filterImportance.mes" /></button>
			<div id="importanceFlagToggle" class="dropdown-menu">
				<ul>
					<li><label class="dropdown-menu-item checkbox"> <input type="checkbox" class="stageCheckbox" value='sberbank' /> <spring:message code="filters.importanceFlag.mes" />
					</label></li>
			</ul>
		</div>
	</div> <!--  -->
			<div><button id="btnFilterConfim" class="btn">Применить</button></div>
</div>
	<!-- End of filters -->

	<!-- Tenders information blocks -->
<div style = 'color: lightgrey'>.</div>

	<div class="tendersContainer">
	
	<c:forEach items="${tendersfiling}" var="tendersfiling">
			<div class="col-md-12 btn-group">
				<!-- Stage btn -->
				<button type="button" class="btn btn-fil"><span class="lower">Подача</span></button> <!-- ID of tender -->
				<button type="button" class="btn btnIdZakupki " data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tendersfiling.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span>
			</button> <!-- Name -->
				<button type="button" class="btn btnName" onclick="location.href = '/TenderStore/tender/${tendersfiling.idTenderZakupki}'">
					<div class="overflow">${tendersfiling.idCompanyRecepient}<br>
						<form class="popup">Ссылка на страницу аукциона</form> <span class="lower"><spring:message code="mainPage.company.mes" /></span>
				</div>
			</button> <!-- City -->
				<button type="button" class="btn btnCity">${tendersfiling.cityOfCompany}<br> <span class="lower"><spring:message code="mainPage.city.mes" /></span>
			</button> <!-- Price -->
				<button type="button" class="btn btnPrice">${tendersfiling.price}<br> <span class="lower"><spring:message code="mainPage.price.mes" /></span>
			</button> <!-- Info -->
				<button type="button" class="btn btnInf" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></button> <!-- Edit -->
				<button type="button" class="btn btnEdit" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersfiling.idTenderZakupki}'">Edit</button>
			</div>
			<div class="collapse" id="theSection${tendersfiling.idTenderZakupki}">
				<!-- Sliding table -->
				<div class="col-md-12 btn-group">
					<table class="tbl">
						<tr>
							<td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tendersfiling.objectOfPurchase}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tendersfiling.procuring}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tendersfiling.site}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tendersfiling.dateTo}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tendersfiling.dateTender}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tendersfiling.procuringContract}</td>
					</tr>
				</table>
			</div>
			</div>
		
		</c:forEach>
		</div>
		<div class="tendersContainer">
		<c:forEach items="${tendersconsideration}" var="tendersconsideration">
			<div class="col-md-12 btn-group">
				<button type="button" class="btn btn-con"><span class="lower">Рассмотрение</span></button>
				<button type="button" class="btn btnIdZakupki " data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tendersconsideration.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span>
			</button>
				<button type="button" class="btn btnName" onclick="location.href = '/TenderStore/tender/${tendersconsideration.idTenderZakupki}'">
					<div class="overflow">${tendersconsideration.idCompanyRecepient}<br>
						<form class="popup">Страница аукциона</form> <span class="lower"><spring:message code="mainPage.company.mes" /></span>
				</div>
			</button>
				<button type="button" class="btn btnCity">${tendersconsideration.cityOfCompany}<br> <span class="lower"><spring:message code="mainPage.city.mes" /></span>
			</button>
				<button type="button" class="btn btnPrice">${tendersconsideration.price}<br> <span class="lower"><spring:message code="mainPage.price.mes" /></span>
			</button>
				<button type="button" class="btn btnInf" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></button>
				<button type="button" class="btn btnEdit" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}'">Edit</button>
			</div>
			<div class="collapse" id="theSection${tendersconsideration.idTenderZakupki}">
				<!-- Sliding table -->
				<div class="col-md-12 btn-group">
					<table class="tbl">
						<tr>
							<td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tendersconsideration.objectOfPurchase}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tendersconsideration.procuring}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tendersconsideration.site}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tendersconsideration.dateTo}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tendersconsideration.dateTender}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tendersconsideration.procuringContract}</td>
					</tr>
				</table>
			</div>
			</div>
			
			
		</c:forEach>
		</div>
		<div class="tendersContainer">
	<c:forEach items="${tenderscomplited}" var="tenderscomplited">
			<div class="btn-group col-md-12">
				<button type="button" class="btn btn-com"><span class="lower">Завершенные</span></button>
				<button type="button" class="btn btnIdZakupki " data-track='hover' onclick="window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}')">
					<form class="popup">Ссылка на Zakupki.gov</form>${tenderscomplited.idTenderZakupki}<br> <span class="lower"><spring:message code="mainPage.tenderId.mes" /></span>
			</button>
				<button type="button" class="btn btnName" onclick="location.href = '/TenderStore/tender/${tenderscomplited.idTenderZakupki}'">
					<div class="overflow">${tenderscomplited.idCompanyRecepient}<br>
						<form class="popup">Страница аукциона</form> <span class="lower"><spring:message code="mainPage.company.mes" /></span>
				</div>
			</button>
				<button type="button" class="btn btnCity">${tenderscomplited.cityOfCompany}<br> <span class="lower"><spring:message code="mainPage.city.mes" /></span>
			</button>
				<button type="button" class="btn btnPrice">${tenderscomplited.price}<br> <span class="lower"><spring:message code="mainPage.price.mes" /></span>
			</button>
				<button type="button" class="btn btnInf" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes" /></button>
				<button type="button" class="btn btnEdit" onclick="location.href = '/TenderStore/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}'">Edit</button>
			</div>
			<div class="collapse" id="theSection${tenderscomplited.idTenderZakupki}">
				<!-- Sliding table -->
				<div class="col-md-12 btn-group">
					<table class="tbl">
						<tr>
							<td class="tenderTableData">Объект закупки</td>
							<td class="tenderTableData">${tenderscomplited.objectOfPurchase}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Obespechenie</td>
							<td class="tenderTableData">${tenderscomplited.procuring}</td>
					</tr>
						<tr> 
							<td class="tenderTableData">Сайт</td>
							<td class="tenderTableData">${tenderscomplited.site}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Окончание подачи заявок</td>
							<td class="tenderTableData">${tenderscomplited.dateTo}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Дата аукциона</td>
							<td class="tenderTableData">${tenderscomplited.dateTender}</td>
					</tr>
						<tr>
							<td class="tenderTableData">Обеспечение контракта</td>
							<td class="tenderTableData">${tenderscomplited.procuringContract}</td>
					</tr>
				</table>
			</div>
			</div>
		</c:forEach>
		</div>

	<!-- End of Tenders information blocks-->



	<!-- Footer here -->
	<div class=" wrapper navbar-fixed-bottom">
		<div>
			<form method="get" action="/TenderStore/archive/${user}">
				<button class="btn btn-lg btn-block" type="submit">Archive</button>
		</form>
	</div>
		<div class="wrapper col-md-6">@Oleg Gonchar</div>
		<div class="wrapper col-md-6">contact: o.gonchar@live.com</div>
</div>
	<!-- End of footer -->

	<!-- Scripts -->

	<script>
	
	$('#filtersSectionToggle').click(function(){
		$('#filtersSection').toggle();
	});
	
		/* Function for showing pop up advices on element */
		$(".btn").on("mouseenter", function(e) {
			let $elem = $(this);
			window.setTimeout(function() {
					if ($elem.is(':hover')===true){
					$elem.find('form').slideDown();
				}
			}, 1000);
		}).on("mouseout", function(e) {
				$('.popup').slideUp();
		});
		/*  */

		/* Ajax call for adding tender */
		jQuery(document).ready(function($) {

			$("#bthAddTender").click(function(event) {
				// Disble the search button
				enableSearchButton(false);
				// Prevent the form from submitting via the browser.
				event.preventDefault();
				addViaAjax();
			});
		});
		function addViaAjax() {
			let id;
			id = $("#tenderId").val();
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "${home}addbyparser",
				data : JSON.stringify(id),
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					if (JSON.stringify(data, null, 4).includes("OK")) {
						window.location.reload();

					} else
						display(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				},
			});
		}
		function enableSearchButton(flag) {
			$("#btn-search").prop("disabled", flag);
		}
		/*  */

		/* Function to show warning on incorrect tender id insertions */
		function display(data) {
			$('#feedback').hide();
			var json = JSON.stringify(data, null, 4);
			var one = json.indexOf(": \"") + 3;
			var two = json.indexOf("\"", one);
			var df = json.substring(one, two);
			$('#feedback').html("<h4 style=''>" + df + "</h4>").toggle().delay(
					2000).fadeOut();
		}
		/*  */

			/* Dropdown tebles */
		$('.btnInf').on('click', function() {
			 let section = $(this).attr('data-target');
			 $(section).toggle();
		})

		/* Filters */
		$(function() {
			$('#btnStageConfim').on('click', function(e) {
				let stageValues = [];
				$('.stageCheckbox:checked').each(function() {
					stageValues.push($(this).val());
				})
				var text = stageValues.join();
				alert(text);
				$.ajax({
					type : "POST",
					contentType : "text/plain",
					url : "${home}getFilteredTenders",
					datatype : "text",
					data : text,
					success : function(data) {
					},
					error : function(e) {
						alert('error');
					},
				});
			});
		});

		/*  */
	</script>



	<!-- End of scripts -->



</body>
</html>
