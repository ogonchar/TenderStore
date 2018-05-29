<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Style here -->
<style type="text/css">
	.navbar-fixed-bottom{background-color: #333; }
	.wrapper{background-color: #333; height: 40px; color : white;}
	.container{width:50vw;}
	.lower{font-size: 10px;}
	#nav1{background-image: none;}  
	#AddTender{background-color: rgba(30,75,39,0.5); color: white;}
	#new{word-break: break-all;}
	
	.btn-fil{background-color: rgb(78, 244, 66,0.4);}
	.btn-con{background-color: rgb(30, 105, 140,0.4);}
	.btn-com{background-color: rgb(160, 38, 109,0.4);}
	.btn-edit{background-color: rgb(255, 173, 51,0.7);}
	.btn0-wdh{width: 7%;  overflow: hidden;} 
	.btn1-wdh{width: 15%;background-color: rgba(50,64,0,0.05); text-overflow: ellipsis; overflow: hidden;} 
	.btn2-wdh{width: 30%;background-color: rgba(50,0,160,0.05); text-overflow: ellipsis; overflow: hidden;}    
	.btn3-wdh{width: 12%;background-color: none; text-overflow: ellipsis; overflow: hidden;} 
	.btn4-wdh{width: 12%;background-color: none; text-overflow: ellipsis; overflow: hidden;} 
	.btn5-wdh{width: 10%;background-color: none; text-overflow: ellipsis; overflow: hidden;} 
	.btn6-wdh{width: 15%;background-color: rgba(50,64,160,0.4); text-overflow: ellipsis; overflow: hidden;} 

	.divider{color:white;}
	.tHeader{margin-bottom: 20px; margin-left: 30px; }
	.btn{background-color: none; height: 60px;}   
	.btn-group{z-index:1;width:80vw; margin-right: 1vw;margin-left: 1vw; padding-top: 1px;}   
	body {  height: 100%; background-color: #333; }
	body {  color: #fff;  text-align: center;}
	.collapse{z-index: 9999;display: block;}
</style>
<!-- End of style -->  
    
 
<!-- There are some links to CDN -->    
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!-- End of links -->
 

<title>Your tenders</title>
</head>
<body style="padding-top: 80px; ">

<!-- Main container-->
	<div class = "container col-md-12"> 
	
	<!-- Navigation bar -->
		<nav class="navbar navbar-default navbar-fixed-top" id ="nav1">
			<div class="container-fluid">
			    <div class="navbar-header">
			        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#the-menu">
			        </button>
			        <div class="col-md-5">
   						<img src="<c:url value="/img/logo.png">
     				    </c:url>" alt="image"  style = "height:50px">  
     				</div>
				</div>
			<!-- Home and add -->
				<div class="collapse navbar-collapse" id="the-menu">
			    	<ul class="nav navbar-nav">
				    	<li class="active"><a href="/TenderStore1">&nbsp;Home</a></li>
			        	<li id="AddTender"><a href="/TenderStore1/tenders/add"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			        	<li id="AddTenderP"><a href="/TenderStore1/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li>
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="#" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="#"><span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp; News&nbsp;<span class="badge">4</span></a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			<!-- Search -->
			    	<form class="navbar-form navbar-right visible-md-inline visible-lg-inline">
			    		<div class="form-group" style="margin-top: 4px">
			    			<label class="sr-only" for="keyword">Keyword</label>
			    			<input type="text" class="form-control input-sm" id="keyword" placeholder="Enter Search keyword" />
			    		</div>
			    	</form>
			<!--  -->
				</div>
			</div>
		</nav>
	<!-- End of navigation -->
	
   
	<!-- Tenders information blocks -->

			
			<div>
				<c:forEach items="${tendersfiling}" var="tendersfiling">
					<div class="btn-group col-md-12">
						<button type="button" class="btn btn0-wdh btn-fil"><span class="lower">Подача</span></button>
						<button type="button" class="btn btn1-wdh "><a href="http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersfiling.idTenderZakupki}">${tendersfiling.idTenderZakupki}</a><br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh">${tendersfiling.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tendersfiling.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tendersfiling.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tendersfiling.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit"><a href="/store/tenders/updateTender?id=${tendersfiling.idTenderZakupki}">Edit</a></button>
					</div>
					<div class="collapse" id="theSection${tendersfiling.idTenderZakupki}">
						<table class ="table">
							<tr><td>Obespechenie</td>
							<td>${tendersfiling.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tendersfiling.cite}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tendersfiling.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tendersfiling.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tendersfiling.procuringContract}</td></tr>
						</table>
					</div>
			</c:forEach>
			<p class="divider">.</p>
				<c:forEach items="${tendersconsideration}" var="tendersconsideration">
					<div class="btn-group col-md-12">
						<button type="button" class="btn btn0-wdh btn-con"><span class="lower">Рассмотрение</span></button>
						<button type="button" class="btn btn1-wdh"><a href="http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tendersconsideration.idTenderZakupki}">${tendersconsideration.idTenderZakupki}</a><br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh">${tendersconsideration.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tendersconsideration.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tendersconsideration.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tendersconsideration.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit"><a href="/store/tenders/updateTender?id=${tendersconsideration.idTenderZakupki}">Edit</a></button>
					</div>
				<div class="collapse" id="theSection${tendersconsideration.idTenderZakupki}">	
				<table class ="table">
					<table class ="table">
							<tr><td>Obespechenie</td>
							<td>${tendersconsideration.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tendersconsideration.cite}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tendersconsideration.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tendersconsideration.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tendersconsideration.procuringContract}</td></tr>
						</table>
					</table>
					</div>
			</c:forEach>
			<p class="divider">.</p>
				<c:forEach items="${tenderscomplited}" var="tenderscomplited">
					<div class="btn-group col-md-12">
				 		<button type="button" class="btn btn0-wdh btn-com"><span class="lower">Завершенные</span></button>
						<button type="button" class="btn btn1-wdh"><a href="http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=${tenderscomplited.idTenderZakupki}">${tenderscomplited.idTenderZakupki}</a><br><span class="lower">Tender ID</span></button>
						<button type="button" class="btn btn2-wdh">${tenderscomplited.idCompanyRecepient}<br><span class="lower">Company ID(INN)</span></button>
						<button type="button" class="btn btn3-wdh">${tenderscomplited.cityOfCompany}<br><span class="lower">Company city</span></button>
						<button type="button" class="btn btn5-wdh">${tenderscomplited.price}<br><span class="lower">price</span></button>
						<button type="button" class="btn btn6-wdh"  data-toggle="collapse" data-target="#theSection${tenderscomplited.idTenderZakupki}" id="theButton">Detailed information</button>
						<button type="button" class="btn btn0-wdh btn-edit"><a href="/store/tenders/updateTender?id=${tenderscomplited.idTenderZakupki}">Edit</a></button>
					</div>
				<div class="collapse" id="theSection${tenderscomplited.idTenderZakupki}">
					<table class ="table">
						<tr><td>Obespechenie</td>
							<tr><td>Obespechenie</td>
							<td>${tenderscomplited.procuring}</td></tr>
							<tr><td>Сайт</td>
							<td>${tenderscomplited.cite}</td></tr>
							<tr><td>Окончание подачи заявок</td>
							<td>${tenderscomplited.dateTo}</td></tr>
							<tr><td>Дата аукциона</td>
							<td>${tenderscomplited.dateTender}</td></tr>
							<tr><td>Обеспечение контракта</td>
							<td>${tenderscomplited.procuringContract}</td></tr>
					</table>
					</div>
			</c:forEach>
	</div>
	<!-- End of Tenders information blocks--> 
			
	<!-- Sign in box -->
			<div class="modal" Id="logonBox" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
							<h4 class="modal-title">Sign in</h4>
						</div>
						<form:form  method="POST" modelAttribute="newUser" class="form-horizontal">
						<div class="modal-body">
							<div>
								<ul class="nav nav-tabs" data-tabs="tabs">
									<li class="active"><a data-toggle="tab" href="#signin" data-caption="Sign In">Sign In</a></li>
									<li><a data-toggle="tab" href="#signup" data-caption="Sigh Up">Sign Up</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="signup">
										<form style="padding-top:5px">
											<div class="form-group">
												<input type="text" id="name" class="form-control" placeholder="Name">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="password" placeholder="Password">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="email" placeholder="Email">
											</div>
											
											<button type="button" class="btn btn-success btn-block" id="doLogon">Sign In</button>
										</form>
									</div>
									<div class="tab-pane" id="signup">
										<form style="padding-top:5px;">
											<div class="form-group">
												<input type="text" class="form-control" id="YourName" placeholder="Your Name">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="yourUserName" placeholder="Desired User Name">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="yourEmail" placeholder="Your Email Id">
											</div>
											<div class="form-group">
												<input type="password" class="form-control" id="yourPwd" placeholder="Password">
											</div>
											<div class="form-group">
												<input type="password" class="form-control" id="confirmPwd" placeholder="Confirm Password">
											</div>
											<button type="button" class="btn btn-success btn-block" id="doLogon">Sign Up</button>
										</form>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
							</div>
						</div>
						</form:form>
					</div>
				</div>
			</div>	
			</div>					
	<!--  End of sign in box -->
		
	<!-- Footer here -->
		<div class = "navbar-fixed-bottom">
			<div class = "wrapper col-md-6">
			@Oleg Gonchar
			</div>
			<div class = "wrapper col-md-6">
			contact: o.gonchar@live.com
			</div>
		</div>
	<!-- End of footer -->
	
	
	<!-- Scripts -->
	

	
	
	<!-- End of scripts -->
	

	
	</body>
</html>