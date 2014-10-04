$(document).ready(function(){

	$('.endorsements-link').on('click', function(event){
		var endorsementCount = $(this).siblings('span');
		console.log(endorsementCount);
		event.preventDefault();
		$.post(this.href, function(response){
			endorsementCount.text(response.new_endorsement_count);
		});
	});	
});
