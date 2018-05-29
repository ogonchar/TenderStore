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
<link href="<c:url value="/css/archive.css"></c:url>" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script   src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<!-- There are some links to CDN -->    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- End of links -->
 

<title>Archive</title>
</head>
<body>
	<!-- Navigation bar -->
			<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
				<div class="container-fluid">
				    <div class="navbar-header">
				        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
				        </button>
				        <div class="col-md-5">
	   						<img src="<c:url value="/img/logo1.png">
	     				    </c:url>" alt="image"  style = "height:50px">  
	     				</div>
					</div>
				<!-- Home and add -->
					<div class="collapse navbar-collapse" id="the-menu">
				    	<ul class="nav navbar-nav">
					    	<li class="active"><a href="/TenderStore1/tenders/${user}">&nbsp;Home</a></li>
				        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
				        <!-- 	<li id="AddTenderP"><a href="/TenderStore1/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li> -->
				    	</ul>
				    	
				<!-- Log in and out -->
				    	<ul class="nav navbar-nav navbar-right">
				    		<li><a href="/TenderStore1/registration" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
				    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
				    		<li><a href="<c:url value="/logout" />">Logout</a></li>
				    	</ul>
				    	
				
					</div>
				</div>
			</nav>  
			</div>
		<!-- End of navigation -->

	<!-- List of tenders in archive -->
				<c:forEach items="${tendersarchived}" var="tendersarchived">
					<div class="btn-group col-md-12">
				 		<button type="button" class="btn btn0-wdh btn-com"><span class="lower">Архив</span></button>
						<button type="button" class="btn btn1-wdh " onclick = "window.open ('http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersarchived.idTenderZakupki}')">${tendersarchived.idTenderZakupki}<br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh" onclick = "location.href = '/TenderStore1/tender/one/${tendersarchived.idTenderZakupki}'">${tendersarchived.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tendersarchived.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tendersarchived.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tendersarchived.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tendersarchived.idTenderZakupki}'">Edit</button>
					</div>
				<div class="col-md-1"></div>
					<div class="collapse col-md-10" id="theSection${tendersarchived.idTenderZakupki}">  
						<table class ="table table-striped table-bordered ">
							<tr><td>Obespechenie</td>
							<td>${tendersarchived.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tendersarchived.site}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tendersarchived.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tendersarchived.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tendersarchived.procuringContract}</td></tr>
							<tr><td><form method="get" action="/TenderStore1/tenders/delete/${tendersarchived.idTenderZakupki}"><button class="btn btn-danger" type="submit">delete</button></form></td><br>
							<td><form method="get" action="/TenderStore1/contact/${tendersarchived.idInn}"><button class="btn btn-info" type="submit">Contact page</button></form></td><br></tr>
						</table>
					</div>
			</c:forEach>
			
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