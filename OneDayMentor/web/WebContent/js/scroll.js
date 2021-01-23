
var last_top = 0;
$(window).scroll(function() {
	var this_top = $(this).scrollTop();
	if (this_top > last_top) {
		$(".bar").addClass("hide");
	} else {
		$(".bar").removeClass("hide");
	}
	last_top = this_top;
});