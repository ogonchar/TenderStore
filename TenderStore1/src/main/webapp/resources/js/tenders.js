// code for adding tenders by parser
			jQuery(document).ready(function($) {
				$("#search-form").submit(function(event) {
					// Disble the search button
					
		
					// Prevent the form from submitting via the browser.
					event.preventDefault();
					addViaAjax();
				});
		
			});
		
			function addViaAjax() {
				var search;
				search = $("#keyword").val();
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/addbyparser",
					data : JSON.stringify(search),
					dataType : 'json',
					timeout : 100000,
					success : function(data) {
						console.log("SUCCESS: ", data);
						display(data);
						window.location = window.location;
						
					},
					error : function(e) {
						console.log("ERROR: ", e);
						display(e);
					},
					done : function(e) {
						console.log("DONE");
						enableSearchButton(true);
					}
				});
			}
			function enableSearchButton(flag) {
				$("#btn-search").prop("disabled", flag);
			}
			function display(data) {
				var json = "<h4>Ajax Response</h4><pre>"
						+ JSON.stringify(data, null, 4) + "</pre>";
				$('#feedback').html(json);
			}
