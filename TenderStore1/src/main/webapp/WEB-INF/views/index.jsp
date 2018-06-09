<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TenderStore</title>

<!-- Style here -->
<style type="text/css">
	#header{
		width: 100%;
		background-color: rgba(100,100,100);
		overflow:auto;
		height:40px;
		position: fixed;
	}
	.headerSection{
		float:left;
		height:100%;
		width:7%;
		
	}
	.headerSectionRight{
		float:right;
		height:100%;
		width:6%;
		background-color: rgba(260,260,260, 0.5);
		border-right: 1px solid darkgrey;
		text-align: center;
		padding-top: 10px;
	}
	#hello{
		margin-top: 100 px; 
		padding-top: 50px;
		}
	.headerSectionRight{
		float:right;
		height:100%;
		width:6%;
		background-color: rgba(260,260,260, 0.5);
		border-right: 1px solid darkgrey;
		text-align: center;
		padding-top: 10px;
		}

	body {
		height: 100%; 
		text-align: center; 
		}

</style>
<!-- End of style -->  

<!-- There are some links to CDN -->    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- End of links -->

<!-- Main container-->
	<div class = "container col-md-12">
	
	<!-- Navigation bar -->
		<div id="header">
			
			<!--  --> <!-- Log in and out -->
				<div class='headerSectionRight'><a href="/TenderStore/registration" id="logonLink">Sign In</a></div>
				<div class='headerSectionRight'><a href="/TenderStore/login">LogIn</a></div>
				<div class='headerSectionRight'>	<a href="/TenderStore/logout">Logout</a></div>
			</div>
	<!-- End of navigation -->

	<!-- End of navigation -->
	
	<!-- Hello -->
	
<body>
	<!-- Hello -->
	<h1 id="hello">Hello, ${user}!</h1>
	<h1>please proceed to your <a href="tenders/${user}">tenders</a></h1>
	<img src="<c:url value="/img/logo.png">	</c:url>" alt="image">  
	<img src="<c:url value="/img/Xmpl.PNG"></c:url>" alt="image"> </div> 
	<img src="<c:url value="/img/Xmpl2.PNG"></c:url>" alt="image"> </div> 
</body>
	
	
	</div>