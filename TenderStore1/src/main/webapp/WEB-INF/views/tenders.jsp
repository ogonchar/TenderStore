<%@page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${jqueryJs}"></script>
<c:url var="home" value="/" scope="request" />
<script type="text/javascript" src = "js/tenders.js"></script>
<link href="<c:url value="/css/tenders.css"></c:url>" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script   src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<!-- There are some links to CDN -->    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- End of links -->
 

<title>Your tenders</title>
</head>
<body>  


<form class="area">
    <div  class="fixed " id="feedback"></div>
</form>
<!-- Main container-->  
	<div class = "container col-md-12"> 
	
	<!-- Navigation bar -->
		<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
			<div class="container-fluid">
			    <div class="navbar-header"> 
			        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
			        </button> 
			        <div>
   						<img src="<c:url value="/img/logo1.png">
     				    </c:url>" alt="image"  style = "height:50px">  
     				</div>
				</div>
			<!-- Home and add -->
				<div id="the-menu">
			    	<ul class="nav navbar-nav">
				    	<li class="active"><a href="/TenderStore">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			      
			    	</ul>
			 <!-- AddByParser -->
			    	<form class="col-md-4 form-horizontal" id="search-form">
			    	<div class="input-group ">
						  <input type="text" class="form-control" placeholder="Добавить аукцион по номеру на Zkupki.gov.ru" id="keyword">
						  <div class="input-group-btn">
						   <button type="submit" id="bth-search" class="btn btn-primary">add</button>
						  </div>
						</div>
						</form>
			<!--  -->
			<!-- Log in and out -->

			    	<ul  class="nav navbar-nav navbar-right">
			    		<li><a href="/TenderStore/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			
				</div>  
			</div>
		</nav>  
		</div> 
	<!-- End of navigation -->
	
	  
	<!-- Filters section -->
	<button type="button" id="filtersToggle" data-toggle="collapse" data-target="#filterSection"><spring:message code="filters.filters.mes"/></button>
	<table id= "filterSection">
		<tr>
			<td class="tdFilters"> <!-- Filter for stage -->
				<div class="divFilters">
					<div class="btn-group" role="group" aria-label="..."> 
				         <div class="btn-group">
				            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"> Stage</span> <span class="caret"></span></button>
				            <ul class="dropdown-menu">
				               <li>
				                   <a href="#">Link 2</a>
				               </li>
				               <li>
				                   <label class="dropdown-menu-item checkbox">
				                       <input type="checkbox" class="stageCheckbox" value='filling'/>
				                       <span class="glyphicon glyphicon-unchecked"></span>
				                       <spring:message code="stages.filling.mes"/>
				                   </label>
				               </li>
				               <li>
				                   <label class="dropdown-menu-item checkbox">
				                       <input type="checkbox" class="stageCheckbox" value='consideration'/>
				                       <span class="glyphicon glyphicon-unchecked"></span>
				                       <spring:message code="stages.consideration.mes"/>
				                   </label>
				               </li>
				               <li>
				                   <label class="dropdown-menu-item checkbox">
				                       <input type="checkbox" class="stageCheckbox" value='complited'/>
				                       <span class="glyphicon glyphicon-unchecked"></span>
				                       <spring:message code="stages.complited.mes"/>
				                   </label>
				               </li> 
				               <li role="separator" class="divider"></li>
				                <button id="btnStageConfim" class="btn btn-link dropdown-menu-item">
                   				    <spring:message code="filters.submit.mes"/>
                			   </button>
				            </ul>
				         </div>
				      </div>
				</div>
			</td>
		</tr>
	</table>

	<!-- End of filters -->
   
	<!-- Tenders information blocks -->   

			
			<div>
				<c:forEach items="${tendersfiling}" var="tendersfiling">   
					<div class="col-md-12 btn-group">
<!-- Stage btn -->		<button type="button" class="btn btn-fil"><span class="lower">Подача</span></button>
<!-- ID of tender -->	<button type="button" class="btn btnIdZakupki " data-track='hover' onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}')"><form class="popup">Ссылка на Zakupki.gov</form>${tendersfiling.idTenderZakupki}<br><span class="lower"><spring:message code="mainPage.tenderId.mes"/></span></button>
<!-- Name -->			<button type="button" class="btn btnName" onclick = "location.href = '/TenderStore/tender/${tendersfiling.idTenderZakupki}'"><div class ="overflow">${tendersfiling.idCompanyRecepient}<br><form class="popup">Страница аукциона</form><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></button>
<!-- City -->			<button type="button" class="btn btnCity">${tendersfiling.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></button>
<!-- Price -->			<button type="button" class="btn btnPrice">${tendersfiling.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></button>
<!-- Info -->			<button type="button" class="btn btnInf"  data-toggle="collapse" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes"/></button>
<!-- Edit -->			<button type="button" class="btn btnEdit" onclick = "location.href = '/TenderStore/tenders/updateTender?id=${tendersfiling.idTenderZakupki}'">Edit</button>
					</div>
						<div class="col-md-1"></div>
					<div class="collapse" id="theSection${tendersfiling.idTenderZakupki}"><!-- Sliding table -->
						<div class="col-md-12 btn-group">
						<table class ="tbl table-striped">
							<tr><td class = "td">Объект закупки</td>
							<td class = "td">${tendersfiling.objectOfPurchase}</td></tr>
							<tr><td class = "td">Obespechenie</td>
							<td class = "td">${tendersfiling.procuring}</td></tr>
							<tr><td class = "td">Сайт</td>
							<td class = "td">${tendersfiling.site}</td></tr>
							<tr><td class = "td">Окончание подачи заявок</td>
							<td class = "td">${tendersfiling.dateTo}</td></tr>   
							<tr><td class = "td">Дата аукциона</td>
							<td class = "td">${tendersfiling.dateTender}</td></tr>
							<tr><td class = "td">Обеспечение контракта</td>
							<td class = "td">${tendersfiling.procuringContract}</td></tr>
						</table>
						</div>
					</div>
			</c:forEach> 
			<p class="divider">.</p>
				<c:forEach items="${tendersconsideration}" var="tendersconsideration">
					<div class="col-md-12 btn-group">
						<button type="button" class="btn btn-con"><span class="lower">Рассмотрение</span></button>
						<button type="button" class="btn btnIdZakupki " data-track='hover' onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}')"><form class="popup">Ссылка на Zakupki.gov</form>${tendersconsideration.idTenderZakupki}<br><span class="lower"><spring:message code="mainPage.tenderId.mes"/></span></button>
						<button type="button" class="btn btnName" onclick = "location.href = '/TenderStore/tender/${tendersconsideration.idTenderZakupki}'"><div class ="overflow">${tendersconsideration.idCompanyRecepient}<br><form class="popup">Страница аукциона</form><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></button>
						<button type="button" class="btn btnCity">${tendersconsideration.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></button>
						<button type="button" class="btn btnPrice">${tendersconsideration.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></button>
						<button type="button" class="btn btnInf"  data-toggle="collapse" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes"/></button>
						<button type="button" class="btn btnEdit" onclick = "location.href = '/TenderStore/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}'">Edit</button>
					</div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
				<div class="collapse"  id="theSection${tendersconsideration.idTenderZakupki}"><!-- Sliding table -->
				<div class="col-md-12 btn-group">
					<table class ="tbl table-striped">  
							<tr><td class = "td">Объект закупки</td>
							<td class = "td">${tendersconsideration.objectOfPurchase}</td></tr>
							<tr><td class = "td">Obespechenie</td>
							<td class = "td">${tendersconsideration.procuring}</td></tr>
							<tr><td class = "td">Сайт</td>
							<td class = "td">${tendersconsideration.site}</td></tr>
							<tr><td class = "td">Окончание подачи заявок</td>
							<td class = "td">${tendersconsideration.dateTo}</td></tr>
							<tr><td class = "td">Дата аукциона</td>
							<td class = "td">${tendersconsideration.dateTender}</td></tr>
							<tr><td class = "td">Обеспечение контракта</td>
							<td class = "td">${tendersconsideration.procuringContract}</td></tr>							
						</table>
					</div>
					</div>
			</c:forEach>
			<br>
			<p class="divider">.</p>
				<c:forEach items="${tenderscomplited}" var="tenderscomplited">
					<div class="btn-group col-md-12">
						<button type="button" class="btn btn-com"><span class="lower">Завершенные</span></button>
						<button type="button" class="btn btnIdZakupki " data-track='hover' onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}')"><form class="popup">Ссылка на Zakupki.gov</form>${tenderscomplited.idTenderZakupki}<br><span class="lower"><spring:message code="mainPage.tenderId.mes"/></span></button>
						<button type="button" class="btn btnName" onclick = "location.href = '/TenderStore/tender/${tenderscomplited.idTenderZakupki}'"><div class ="overflow">${tenderscomplited.idCompanyRecepient}<br><form class="popup">Страница аукциона</form><span class="lower"><spring:message code="mainPage.company.mes"/></span></div></button>
						<button type="button" class="btn btnCity">${tenderscomplited.cityOfCompany}<br><span class="lower"><spring:message code="mainPage.city.mes"/></span></button>
						<button type="button" class="btn btnPrice">${tenderscomplited.price}<br><span class="lower"><spring:message code="mainPage.price.mes"/></span></button>
						<button type="button" class="btn btnInf"  data-toggle="collapse" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton"><spring:message code="mainPage.detailedInframtion.mes"/></button>
						<button type="button" class="btn btnEdit" onclick = "location.href = '/TenderStore/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}'">Edit</button>
					</div>
					
				<div class="col-md-1"></div>
					<div class="collapse" id="theSection${tenderscomplited.idTenderZakupki}"><!-- Sliding table -->
						<div class="col-md-12 btn-group">
							<table class ="tbl table-striped">
								<tr><td class = "td">Объект закупки</td>
								<td class = "td">${tenderscomplited.objectOfPurchase}</td></tr>
								<tr><td class = "td">Obespechenie</td>
								<td class = "td">${tenderscomplited.procuring}</td></tr>
								<tr><td class = "td">Сайт</td>
								<td class = "td">${tenderscomplited.site}</td></tr>
								<tr><td class = "td">Окончание подачи заявок</td>
								<td class = "td">${tenderscomplited.dateTo}</td></tr>
								<tr><td class = "td">Дата аукциона</td>
								<td class = "td">${tenderscomplited.dateTender}</td></tr>
								<tr><td class = "td">Обеспечение контракта</td>
								<td class = "td">${tenderscomplited.procuringContract}</td></tr>
							</table>
						</div>
					</div>
			</c:forEach>
	</div>
	<!-- End of Tenders information blocks--> 
			
	 
		   
	<!-- Footer here --> 
		<div class = " wrapper navbar-fixed-bottom">
		<div> 
			<form method="get" action="/TenderStore/archive/${user}"><button class="btn btn-lg btn-block" type="submit">Archive</button></form>
			</div>
			<div class = "wrapper col-md-6">
			@Oleg Gonchar
			</div>
			<div class = "wrapper col-md-6">
			contact: o.gonchar@live.com
			</div>
		</div>
	<!-- End of footer -->
			
	<!-- Scripts -->
		
			<script> 
			
			/* Function for showing pop up advices on element */
			$(".btn").on("mouseenter",function(e){
				e.stopPropagation();
				var $elem = $(this);
				
				  $elem.attr("data-hover",true);
				  window.setTimeout(function() {
				    if ($elem.attr("data-hover")) {
				    	$elem.find('form').slideDown();
				    }
				  }, 2000);
				}).on("mouseout",function(e){
				e.stopPropagation();
				 window.setTimeout(function() {
					 $('.popup').slideUp();
				 }, 200);
				});
			/*  */
			
			
			/* Ajax call for adding tender */
			jQuery(document).ready(function($) {
				
				$("#search-form").submit(function(event) {
					// Disble the search button
					enableSearchButton(false);
					// Prevent the form from submitting via the browser.
					event.preventDefault();
					addViaAjax();
				});
			});
			function addViaAjax() {
				var id;
				id = $("#keyword").val();
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "${home}addbyparser",
					data : JSON.stringify(id),
					dataType : 'json',
					timeout : 100000,
					success : function(data) {  
						if(JSON.stringify(data, null, 4).includes("OK")){
							window.location.reload();
							
						}else
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
				var one = json.indexOf(": \"") +3;
				var two = json.indexOf("\"",one);
				var df = json.substring(one, two);
				$('#feedback').html("<h4 style=''>"+ df + "</h4>").toggle().delay(2000).fadeOut();
			}
			/*  */
			
			/* Dropdown list for filters */
			$(function(){
			    $( '.dropdown-menu li' ).on( 'click', function( event ) {
			        var $checkbox = $(this).find('.checkbox');
			        if (!$checkbox.length) {
			            return;
			        }
			        var $input = $checkbox.find('input');
			        var $icon = $checkbox.find('span.glyphicon');
			        if ($input.is(':checked')) {
			            $input.prop('checked',false);
			            $icon.removeClass('glyphicon-check').addClass('glyphicon-unchecked')
			        } else {
			            $input.prop('checked',true);
			            $icon.removeClass('glyphicon-unchecked').addClass('glyphicon-check')
			        }
			        return false;
			    }); 
			});
			
			/* Filters */
				$(function(){
					$('#btnStageConfim').on('click', function(e){
					var stageValues = [];
						$('.stageCheckbox:checked').each(function() {
							stageValues.push($(this).val());
						})
						var text = stageValues.join();
						alert(text);
						$.ajax({ 
							type : "POST",
							contentType: "text/plain",
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