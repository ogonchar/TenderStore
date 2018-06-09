/* on cklick of send button submit form */
			(function ($) {
				  $('#submitMyForm').on('click', function () {
				    $('#myForm').submit(); 
					  });
					})(jQuery);
				 
			
			/* Replacing comment text field with textarea to edit comment */
				$(function() {
				    $('.btnEdit').on('click', function() {
				    	let idCommetn = $(this).val();
				    	$('#btnEdit'+idCommetn).replaceWith('<button id="btned' + idCommetn+'" value="' + idCommetn+ '" type="submit" class="btnSubmit" >Send</button>');
				    	let inputTextarea = $('<textarea />', {
				    			'id' : 'commenttext' + idCommetn,
				    			'type': 'text',
								'class' : 'textareaEdit',
	    	        'text': $('#commentText'+idCommetn).text()
				    	    });
				        $('#commentText'+idCommetn).replaceWith(inputTextarea); 
				        $('#btnDel'+idCommetn).hide(); 
				   
				/* On clicked send button send info via AJAX in plain text on server and replace everything back */
				 $(document).on("click", ".btnSubmit", function(e) {  
					 let home = '/'
					 e.preventDefault();
					 	var text = $("#commenttext"+idCommetn).val() + ":::" +  idCommetn;
					 	$.ajax({ 
							type : "POST",
							contentType: "text/plain",
							url : "/TenderStore/editcomment",
							datatype : "text",
							data : text,  
							success : function(data) {  
							},
							error : function(e) {
							},
						});
					 	$("#commenttext"+idCommetn).replaceWith('<td class = "col-md-10 commenttext" id="commentText' + idCommetn + '" class="commenttext"><div>' + $("#commenttext"+idCommetn).val() + '</div></td>');
					 	$('#btned'+idCommetn).replaceWith('<button id="btnEdit' + idCommetn + '" class="btnEdit" value="' + idCommetn + '"><span class="glyphicon glyphicon-pencil"></span></button>');
					 	$('#btnDel'+$(this).attr('value')).show(); 
					});
				    });
				});	 (jQuery);
					 