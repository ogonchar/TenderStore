// Filters functions block

//Toggle filters panel
	$('#filtersSectionToggle').click(function(){
			$('#filtersSection').toggle();
		});
		//Toggle check lists for filters
			$('.filtersToggle').click( function() {
				 let section = $(this).attr('data-target');
				 $(section).toggle();
				 let timeout = setTimeout(function(){$(section).slideUp(200)}, 7000);
				 });


    $('.options').click(function(){
      if ($(this).attr('state') == 'unchecked') {
        $(this).attr('state', 'checked');
        $(this).css('background-image','linear-gradient(to top, #0ba360 0%, #3cba92 60%)');
      }else {
        $(this).attr('state', 'unchecked');
        $(this).css('background-image','linear-gradient(to top, #09203f 0%, #537895 100%)');
      }
      console.log($(this).attr('state'));
      $(this).css('background-color','red');
    });

		//Execute filters logic.
		$('#btnFilterConfim').click(function(){
			const filtersValue = getFitersValues();
			ApplyStageFilter(filtersValue[0]);
			ApplySiteFilter(filtersValue[1]);
			ApplyPriceFilter(filtersValue[2]);
		});

					//Getting filters values
					function getFitersValues(){
						const stageValues = [];
						const siteValues = [];
						const pricesBorders = [$('#minPrice').val(), $('#maxPrice').val()];
						$('.stageCheck').each(function() {
              console.log($(this).attr('state'));
              if($(this).attr('state') == 'checked'){
                	stageValues.push($(this).val());
              }
						})
						$('.siteCheck').each(function(){
              if($(this).attr('state') == 'checked'){
                	siteValues.push($(this).val());
              }
						})
						return [stageValues, siteValues, pricesBorders];
					}
					//ApplyStageFilter if user check minimum one parameter
					function ApplyStageFilter(stages){
						if(stages.length > 0) {
							$('.tendersContainer').hide();
						}else { // this is the case when fillter was applied and then user set filter on initial state
							$('.tendersContainer').show();
						}
						if(stages.some(value=>value=='filling')) $('#tendersFilingContainer').show();
						if(stages.some(value=>value=='consideration')) $('#tendersConsiderationContainer').show();
						if(stages.some(value=>value=='complited')) $('#tendersComplitedContainer').show();
					}
					//ApplySiteFilter if user check minimum one parameter
					function ApplySiteFilter(sites){
						$('.tbl').each(function (){
							const id = $(this).parent().attr('id').substring(10);
							if(sites.length == 0) $('#tender'+id).show();// this is the case when fillter was applied and then user set filter on initial state
							if(sites.length > 0) $('#tender'+id).hide();
							if(sites.some(value=>value==$(this).find('.site').text())) $('#tender'+id).show();
						});
					}
					//ApplyPriceFilter if user check minimum one parameter and the parameters are decent number
					function ApplyPriceFilter(prices) {
						$('.tendPrice').each(function (){
							const id = $(this).parent().attr('id').substring(6);
							if((isNumeric(prices[0]))||isNumeric(prices[1])){
								$('#tender'+id).hide();
								let priceTender = Number.parseInt($(this).text().substring(0,$(this).text().indexOf('Н')));
								let compareWithSecond = (priceTender<prices[1]);
								if (prices[1]<1) compareWithSecond = true;
								console.log(priceTender+" ; "+prices[0]);
								console.log(compareWithSecond);
								if(priceTender>prices[0]&&compareWithSecond) $('#tender'+id).show();
							}else {}//showFiltersWarning('You pass wrong numbers to price filter');
						})
					}
