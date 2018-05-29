<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

 <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <link rel="stylesheet"
      href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
      <title>Add Tender from Zakupki.gov.ru</title>
      </head>
      <body>
         <section>
            <div class="jumbotron">
               <div class="container">
                 <div class="col-md-5">
   						<img src="<c:url value="/img/logo.png">
     				    </c:url>" alt="image"  style = "height:50px">  
     				 </div>
     				  <h2>Add tender</h2>
               </div>
            </div>
         </section>
         <section class="container">
            <form:form  method="POST" modelAttribute="newTender" class="form-horizontal">
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>
               <fieldset>
                 
                  <div class="form-group">
                   <label class="control-label col-lg-2 col-lg-2" for="idTenderZakupki">Number of auction on Zakupki.gov.ru</label>
                     <div class="col-lg-10">
                        <form:input id="idTenderZakupki" path="idTenderZakupki" type="text" class="form:input-large"/>
                        <form:errors path="idTenderZakupki" cssClass="text-danger"/>
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <div class="col-lg-offset-2 col-lg-10">
                        <input type="submit" id="btnAdd" class="btn
                         btn-primary" value ="Add"/>
                     </div>
                  </div>
               </fieldset>
                </form:form>
         </section>
      </body>
      </html>