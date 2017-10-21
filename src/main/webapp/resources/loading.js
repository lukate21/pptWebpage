jQuery(window).load(function() {
        // will first fade out the loading animation
	jQuery(".status").fadeOut();
        // will fade out the whole DIV that covers the website.
	jQuery(".preloader").delay(100).fadeOut("slow");
})
function loading(callback,var1){
	$('.status').fadeIn();
	$('.preloader').fadeIn();
    // will first fade out the loading animation
        // will first fade out the loading animation
	jQuery(".status").fadeOut();
       // will fade out the whole DIV that covers the website.
	jQuery(".preloader").delay(1000).fadeOut("slow");
	setTimeout(callback,500);
		
}
