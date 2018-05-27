<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

 <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
      <link href="<c:url value="/css/tender.css"></c:url>" rel="stylesheet" />
      <title>${tender.idTenderZakupki}</title>
      </head> 
      <body>
      
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
			        <!-- 	<li id="AddTenderP"><a href="/TenderStore1/tenders/addByParcer"><span class="glyphicon glyphicon-plus"></span>Add tender</a></li> -->
			    	</ul>
			    	
			<!-- Log in and out -->
			    	<ul class="nav navbar-nav navbar-right">
			    		<li><a href="#" id="logonLink"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign In</a></li>
			    		<li><a href="/TenderStore1/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</a></li>
			    		<li><a href="<c:url value="/logout" />">Logout</a></li>
			    	</ul>
			    	
			<!-- AddByParser -->
			    	<form class="form-horizontal" id="search-form">
			    	<div class="input-group mb-5">
						  <input type="text" class="form-control" placeholder="Add tender by parser" id="keyword">
						  <div class="input-group-btn">
						    <button class="btn btn-outline-secondary" type="submit" id="bth-search">B</button>
						  </div>
						</div>
						</form> 
			<!--  -->
				</div>
			</div>
		</nav>  
		
	<!-- End of navigation -->
	
	<!-- Information about tender -->
		<h2 class="text-center">Detailed information about ${tender.idTenderZakupki} tender</h2> 
		<br>
		
	<div class="container">
      <div class="row">
         <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
               <div class="panel-heading">   
		            
		                  <legend>Info</legend>  
		                  
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.idTenderZakupki.mes"/></td>
			                  <td class="td">${tender.idTenderZakupki}</td>
		                  </table>
		                  <br>
		                   <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.idCompanyRecepient.mes"/></td>
			                  <td class="td">${tender.idCompanyRecepient}</td>
		                  </table>
		                  <br>
		                   <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.cityOfCompany.mes"/></td>
			                  <td class="td">${tender.cityOfCompany}</td>
		                  </table>
		                  <br>
		                    <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.price.mes"/></td>
			                  <td class="td">${tender.price}</td>
		                  </table>
		                  <br>
		                  <div class="form-group">
		                     <label class="input-group-addon" for="tenderStage"><spring:message code="tender.tenderstage.mes"/></label>
		                     <div class="input-group-addon">
		                      <td>${tender.tenderStage}</td>
		                     </div>
		                  </div>
		                  <br>
		                    <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.procuring.mes"/></td>
			                  <td class="td">${tender.procuring}</td>
		                  </table>
		                  <br>
		                    <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.cite.mes"/></td>
			                  <td class="td"><a href="http:/${tender.cite}">${tender.cite}</a></td>
		                  </table>
		                  <br>
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.date.mes"/></td>
			                  <td class="td">${tender.dateTo}</td>
		                  </table>
		                  <br>
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.procuringContract.mes"/></td>
			                  <td class="td">${tender.procuringContract}</td>
		                  </table>
		                  <br>
		                  <table class = "table table-striped table-bordered table-sm tb col-md-12 ">
			                  <td class="td"'><spring:message code="tender.idinn.mes"/></td>
			                  <td class="td">${tender.idinn}</td>
		                  </table>
		                     <br>
		                     <br>
		                     
		                      <div class="form-actions">  
		                        <input type="submit"
		                           class="btn btn-block btn-info" onclick = "location.href = '/TenderStore1/contact/${tender.idinn}'" value="ContactPage">  
		                     </div>
		                     
		                     
		                      <br>
		                        <div class="form-actions">
		                        <input type="submit"
		                           class="btn btn-block btn-edit" onclick = "location.href = '/TenderStore1/tenders/updateTender?id=${tender.idTenderZakupki}'" value="Edit">  
		                     </div>
		                        <br>

		                       <div class="form-actions">
		                        <input type="submit"
		                           class="btn btn-block btn-primary btn-default" onclick = "location.href = '/TenderStore1/tenders/${user}'" value="Back">
		                     </div>
		                  
    	            </div>
                </div>
	        </div>
		</div>
    </div>   
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