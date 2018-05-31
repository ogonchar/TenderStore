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
	#hello{margin-top: 100 px; padding-top: 50px;}
	
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
				    	<li class="active"><a href="/TenderStore1/tenders">&nbsp;Home</a></li>
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
	
	<!-- Hello -->
	
<body>
	<!-- Hello -->
	<h1 id="hello">Hello, ${user}!</h1>
	<p>please rpoxeed to your <a href="tenders/${user}">tenders</a></p>  
</body>
	
	
	</div>