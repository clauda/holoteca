(function ($) {
	"use strict";

	$(function() {
		/**
		 * friendly time on home
		 */
		$('time').each(function(){
			moment.lang('pt-br');
			if (!!this.getAttribute('datetime').length) {
				$(this).text(moment(this.getAttribute('datetime'), "YYYY-MM-DD hh:mm:ss").fromNow());
			}
		});

		/**
		 * add select menu for mainmenu
		 */
		if ($.fn.mobileMenu) {
			$('#mainmenu').mobileMenu({
				defaultText: 'Navegue por aqui',
				className: 'mainmenu'
			});
		}
	});

	/**
	 * add flex slider call if plugin included
	 */
	if ($.fn.flexslider) {
		$('.flexslider').flexslider({
			animation: 'slide',
			pauseOnHover: true,
			smoothHeight: true,
			directionNav: true
		});
	}

})(jQuery);
