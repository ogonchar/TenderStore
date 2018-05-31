
function message() {
    alert("hello!!!");
}

 (function ($) {
				  $('#submitMyForm').on('click', function () {
					  alert("sdcsdc");
				    $('#myForm').submit(); // js fiddle won't allow this
				    
				  });
				  
				})(jQuery);
 
 $('#submitMyForm').click( function(e) {e.preventDefault(); alert("sdcsdc"); return false; } );
 
	(function ($) {
		 $('.btnEdit').on('click', function () {
			alert( document.getElementById('btnEd').value );
			$(document.getElementById('btnEd').value).replaceWith('<div class="input-group">');
			$('#commentText' + document.getElementById('btnEd').value).replaceWith('<textarea class = "addit" id="copy1" path="text" rows="3" cols="65"></textarea>').clone();
			$('#ass').replaceWith('<span type="submit" class="addit input-group-addon btn" id="editMyForm">Send</span>');
		});
	})(jQuery);
	
	

	 (function ($) {
		  $('#editMyForm').on('click', function () {
			  alert( document.getElementById('btnEd').value );
		    $('#copy1').submit(); 
		    
		  });
		  
		})(jQuery);