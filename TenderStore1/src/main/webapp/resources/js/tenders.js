$(document).ready(function() {


		/* Function to show warning on incorrect tender id insertions while adding tender*/
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


// Bit clumsy function that showing notification for tenders date to filing of which expires today
// there are delay f
function showTodaysUpdates(){
	let currDate = new Date(new Date().setHours(3,0,0,0));
	let idList = getTendersIdWithDate(currDate);
	for (let i = 0; i < idList.length; i++){
		(function(index) {
			setTimeout(function(){
				const notificationTodayLastDay = `<div class="notification">Pay attention, today is the last date to fil in for the tender ${idList[i]}</div>`;
				$('#notif').html(notificationTodayLastDay);
				$('.notification').fadeIn(1000);
				setTimeout(function() {$('.notification').fadeOut(1000);}, 2000);}
			, i*3000)
		})(i);
	}
}
$( window ).on( "load", showTodaysUpdates());

// Provides list of tenders IDs with provided date of filing
function getTendersIdWithDate(date){
	let tendersIdWithDate = [];
$('.dateTo').each(function(i){
	const tenderDate = new Date(Date.parse(this.innerText));
	if (tenderDate.getTime() === date.getTime()){
		let id = $(this).parent().parent().parent().parent().attr('id');
		tendersIdWithDate.push(id.substring(id.indexOf('n')+1));
	}
});
return tendersIdWithDate;
};


		/* Ajax call for adding tender in batabase*/
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

		//Realisation that known as standard
		function isNumeric(n) {
  		return !isNaN(parseFloat(n)) && isFinite(n);
		}
