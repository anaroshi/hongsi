/**
 * flatpickr
 * 날짜 필드
 */
$( function() {

	$.flatpickr.setDefaults({	
//		mode: "range",
		dateFormat: "Y-m-d",
		locale: "ko",
//	 	minDate: new Date().fp_incr(-30),
//	 	maxDate: new Date().fp_incr(93),		
		allowInput: false  
	}); // Defaults for all datepickers
		
	$('.flatpickr').flatpickr(); // Initialisation
		 
});	