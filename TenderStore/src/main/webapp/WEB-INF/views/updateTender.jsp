<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

 <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <link rel="stylesheet"
      href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
      <title>Add Tender</title>
      </head>
      <body>
         <section>
            <div class="jumbotron">
               <div class="container">
                  <h1>Tenders</h1>
                  <p>Add Tender</p>
               </div>
            </div>
         </section>
         <section class="container">
            <form:form  method="POST" modelAttribute="updateTender" class="form-horizontal">
               <fieldset>
                  <legend>Add new tender</legend>
                 <div class="form-group">
                   <label class="control-label col-lg-2 col-lg-2" for="idCompanyRecepient">idCompanyRecepient</label>
                     <div class="col-lg-10">
                        <form:input id="idCompanyRecepient" path="idCompanyRecepient" type="text" class="form:input-large"/>
                     </div>
                  </div>
                  <div class="form-group">
                   <label class="control-label col-lg-2 col-lg-2" for="cityOfCompany">cityOfCompany</label>
                     <div class="col-lg-10">
                        <form:input id="cityOfCompany" path="cityOfCompany" type="text" class="form:input-large"/>
                     </div>
                  </div>
                    <div class="form-group">
                   <label class="control-label col-lg-2 col-lg-2" for="price">cityOfCompany</label>
                     <div class="col-lg-10">
                        <form:input id="price" path="price" type="text" class="form:input-large"/>
                     </div>
                  </div>
                  <label class="control-label col-lg-2 col-lg-2" for="procuring">cityOfCompany</label>
                     <div class="col-lg-10">
                        <form:input id="procuring" path="procuring" type="text" class="form:input-large"/>
                     </div>
                   <div class="form-group">
                     <label class="control-label col-lg-2"
                      for="tenderStage">tenderStage</label>
                     <div class="col-lg-10">
                        <form:radiobutton path="tenderStage" value="filing" />filing
                        <form:radiobutton path="tenderStage" value="consideration" />consideration
                        <form:radiobutton path="tenderStage" value="complited" />complited
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