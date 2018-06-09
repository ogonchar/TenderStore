$(document).ready(function() {
$('#filtersSectionToggle').click(function(){
		$('#filtersSection').toggle();
	});
	
		/* Function for showing pop up advices on element */
		$(".tend").on("mouseenter", function(e) {
			let $elem = $(this);
			window.setTimeout(function() {
					if ($elem.is(':hover')===true){
					$elem.find('form').slideDown();
				}
			}, 1000);
		}).on("mouseout", function(e) {
				$('.popup').slideUp();
		});
		/*  */


		/* Function to show warning on incorrect tender id insertions */
		function display(data) {
			$('#popUps').hide();
			let json = JSON.stringify(data, null, 4);
			let one = json.indexOf(": \"") + 3;
			let two = json.indexOf("\"", one);
			let df = json.substring(one, two);
			$('#popUps').html("<h4 style=''>" + df + "</h4>").toggle().delay(
					2000).fadeOut();
		}
		/*  */

			/* Dropdown tebles */
		$('.tendInf').on('click', function() {
			 let section = $(this).attr('data-target');
			 $(section).toggle();
		})
});

		/* Ajax call for adding tender */
		jQuery(document).ready(function($) {
		
			$("#bthAddTender").click(function(event) {
				// Disble the search button
				enableSearchButton(false);
				// Prevent the form from submitting via the browser.
				event.preventDefault();
				addViaAjax();
			});
		});
		function addViaAjax() {
			let id;
			id = $("#tenderId").val();
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/TenderStore/addbyparser",
				data : JSON.stringify(id),
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					if (JSON.stringify(data, null, 4).includes("OK")) {
						window.location.reload();
					} else
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
			$('#popUps').hide();
			var json = JSON.stringify(data, null, 4);
			var one = json.indexOf(": \"") + 3;
			var two = json.indexOf("\"", one);
			var df = json.substring(one, two);
			$('#popUps').html("<h4 style=''>" + df + "</h4>").toggle().delay(
					2000).fadeOut();
		}
		/*  */



		/* Filters */
		/*$(function() {
			$(document).on("click", "#btnFilterConfim", function(e) {  
				e.preventDefault();
				const stageValues = [];
				const siteValues = []; 
				let pricesorders = [$('#minPrice').val(), $('#maxPrice').val()];
				$('.stageCheckbox:checked').each(function() {
					stageValues.push($(this).val());
				})
				$('.siteCheckbox:checked').each(function(){
					siteValues.push($(this).val());
				})
				const text = stageValues.join() +':::'+ siteValues.join() +':::'+ pricesorders.join();
				console.log(text);
				$.ajax({
					type : "POST",
					contentType: "text/plain",
					url : "${home}editcomment",
					datatype : "text",
					data : text,  
					success : function(data) {  
						console.log(text);
					},
					error : function(e) {
						alert('error');  
					},
				});
			});
		});(jQuery);
*/