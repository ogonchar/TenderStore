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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- End of links -->
 

<title>Your tenders</title>
</head>
<body>  


<form class="area ">
    <div  class="fixed " id="feedback">Hello World!</div>
</form>
<!-- Main container-->  
	<div class = "container col-md-12"> 
	
	<!-- Navigation bar -->
		<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
			<div class="container-fluid">
			    <div class="navbar-header"> 
			        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
			        </button> 
			        <div >
   						<img src="<c:url value="/img/logo1.png">
     				    </c:url>" alt="image"  style = "height:50px">  
     				</div>
				</div>
			<!-- Home and add -->
				<div id="the-menu">
			    	<ul class="nav navbar-nav">
				    	<li class="active"><a href="/TenderStore1">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			      
			    	</ul>
			 <!-- AddByParser -->
			    	<form class="col-md-4 form-horizontal" id="search-form">
			    	<div class="input-group ">
						  <input type="text" class="form-control" placeholder="Add tender by parser" id="keyword">
						  <div class="input-group-btn">
						   <button type="submit" id="bth-search" class="btn btn-primary">add</button>
						  </div>
						</div>
						</form>
			<!--  -->
			<!-- Log in and out -->

			    	<ul  class="nav navbar-nav navbar-right">
			    		<li><a href="/TenderStore1/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			
				</div>  
			</div>
		</nav>  
		</div>
	<!-- End of navigation -->
	  
   
	<!-- Tenders information blocks -->   

			
			<div>
				<c:forEach items="${tendersfiling}" var="tendersfiling">  
					<div class="btn-group col-md-12">
						<button type="button" class="btn btn0-wdh btn-fil"><span class="lower">Подача</span></button>
						<button type="button" class="btn btn1-wdh " onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}')">${tendersfiling.idTenderZakupki}<br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh" onclick = "location.href = '/TenderStore1/tender/${tendersfiling.idTenderZakupki}'">${tendersfiling.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tendersfiling.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tendersfiling.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tendersfiling.idTenderZakupki}'">Edit</button>
					</div>
						<div class="col-md-1"></div>
					<div class="collapse col-md-10 " id="theSection${tendersfiling.idTenderZakupki}">
						<table class ="table table-striped table-bordered">
							<tr><td>Объект закупки</td>
							<td>${tendersfiling.objectOfPurchase}</td></tr>
							<tr><td>Obespechenie</td>
							<td>${tendersfiling.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tendersfiling.site}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tendersfiling.dateTo}</td></tr>   
							<tr><td>Дата аукциона</td>
							<td>${tendersfiling.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tendersfiling.procuringContract}</td></tr>
							<tr><td><form method="get" action="/TenderStore1/tenders/delete/${tendersfiling.idTenderZakupki}"><button class="btn btn-danger" type="submit">delete</button></form></td><br>
							<td><form method="get" action="/TenderStore1/contact/${tendersfiling.idInn}"><button class="btn btn-info" type="submit">Contact page</button></form></td><br></tr>
						</table>
					</div>
			</c:forEach> 
			<p class="divider">.</p>
				<c:forEach items="${tendersconsideration}" var="tendersconsideration">
					<div class="btn-group col-md-12">
						<button type="button" class="btn btn0-wdh btn-con"><span class="lower">Рассмотрение</span></button>
						<button type="button" class="btn btn1-wdh " onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}')">${tendersconsideration.idTenderZakupki}<br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh" onclick = "location.href = '/TenderStore1/tender/${tendersconsideration.idTenderZakupki}'">${tendersconsideration.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tendersconsideration.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tendersconsideration.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton">Detailed information</button>   
						<button type="button" class="btn btn0-wdh btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}'">Edit</button>
						
						
					</div>
						<div class="col-md-1"></div>
				<div class="collapse col-md-10" id="theSection${tendersconsideration.idTenderZakupki}">	    
				<table class ="table">
					<table class ="table table-striped table-bordered">  
							<tr><td>Объект закупки</td>
							<td>${tendersconsideration.objectOfPurchase}</td></tr>
							<tr><td>Obespechenie</td>
							<td>${tendersconsideration.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tendersconsideration.site}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tendersconsideration.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tendersconsideration.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tendersconsideration.procuringContract}</td></tr>
							<tr><td><form method="get" action="/TenderStore1/tenders/delete/${tendersconsideration.idTenderZakupki}"><button class="btn btn-danger" type="submit">delete</button></form></td><br>
							<td><form method="get" action="/TenderStore1/contact/${tendersconsideration.idInn}"><button class="btn btn-info" type="submit">Contact page</button></form></td><br></tr>
						</table>
					</table>
					</div>
			</c:forEach>
			<br>
			<p class="divider">.</p>
				<c:forEach items="${tenderscomplited}" var="tenderscomplited">
					<div class="btn-group col-md-12">
				 		<button type="button" class="btn btn0-wdh btn-com"><span class="lower">Завершенные</span></button>
						<button type="button" class="btn btn1-wdh " onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}')">${tenderscomplited.idTenderZakupki}<br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh" onclick = "location.href = '/TenderStore1/tender/${tenderscomplited.idTenderZakupki}'">${tenderscomplited.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tenderscomplited.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tenderscomplited.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}'">Edit</button>
					</div>
				<div class="col-md-1"></div>
					<div class="collapse col-md-10" id="theSection${tenderscomplited.idTenderZakupki}">
						<table class ="table table-striped table-bordered ">
							<tr><td>Объект закупки</td>
							<td>${tenderscomplited.objectOfPurchase}</td></tr>
							<tr><td>Obespechenie</td>
							<td>${tenderscomplited.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tenderscomplited.site}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tenderscomplited.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tenderscomplited.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tenderscomplited.procuringContract}</td></tr>
							<tr><td><form method="get" action="/TenderStore1/tenders/delete/${tenderscomplited.idTenderZakupki}"><button class="btn btn-danger" type="submit">delete</button></form></td><br>
							<td><form method="get" action="/TenderStore1/contact/${tenderscomplited.idInn}"><button class="btn btn-info" type="submit">Contact page</button></form></td><br></tr>
						</table>
					</div>
			</c:forEach>
	</div>
	<!-- End of Tenders information blocks--> 
			
	 
		   
	<!-- Footer here --> 
		<div class = " wrapper navbar-fixed-bottom">
		<div> 
			<form method="get" action="/TenderStore1/archive/${user}"><button class="btn btn-lg btn-block" type="submit">Archive</button></form>
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
			function display(data) {
				$('#feedback').hide();
				var json = JSON.stringify(data, null, 4);
				var one = json.indexOf(": \"") +3;
				var two = json.indexOf("\"",one);
				var df = json.substring(one, two);
				$('#feedback').html("<h4 style=''>"+ df + "</h4>").toggle().delay(2000).fadeOut();
			}
			
		</script>

	
	
	<!-- End of scripts -->
	

	
	</body>
</html>