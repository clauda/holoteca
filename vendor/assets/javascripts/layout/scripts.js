(function ($) {
	"use strict";

	$(function() {

		$('time').each(function(){
			moment.lang('pt-br');
			if (!!this.getAttribute('datetime').length) {
				$(this).text(moment(this.getAttribute('datetime'), "YYYY-MM-DD hh:mm:ss").fromNow());
			}
		});

		/**
		 * submenu indicator & fade animation
		$('#mainmenu > li:has(ul) > a').addClass('parent').append('<i class="fa fa-angle-down"></i>');
		$('#mainmenu ul li:has(ul) > a').addClass('parent').append('<i class="fa fa-angle-right"></i>');
		$('#mainmenu li').hover(function() {
			$(this).children('ul').stop().fadeIn(100);
		}, function() {
			$(this).children('ul').stop().fadeOut('fast');
		});
		 */

		/**
		 * add select menu for mainmenu
		 */
		if ($.fn.mobileMenu) {
			$('#mainmenu').mobileMenu({
				defaultText: 'Navegue por aqui',
				className: 'mainmenu'
			});
		}

		/**
		 * add masonry layout
		var mcontainer = $('.masonry-container');
		mcontainer.each(function() {
			var mc = $(this);
			mc.imagesLoaded(function() {
				mc.masonry({
					itemSelector: 'article',
					isAnimated: true
				});
			})
		});
		 	var container = document.querySelector('.masonry-container');
		 	if(container){
				var msnry = new Masonry( container, {
				  isAnimated: true,
				  itemSelector: 'article'
				});
			};
		*/

		/**
		 * add prettyPhoto call if plugin included
		if ($.fn.prettyPhoto) {
			$("a[rel^='prettyPhoto']").prettyPhoto({
				theme: 'pp_default',
				social_tools: false
			});
		}
		 */

		/**
		 * contact widget validation and submit action

		$('[name="contact_name"], [name="contact_email"], [name="contact_message"]').keyup(function() {
			if ($(this).val() != '') {
				$(this).removeClass('err');
			}
		});
		$('.widget_g7_contact form').submit(function(e) {
			e.preventDefault();
			var f = $(this);
			var loading = f.find('.loading');
			var contact_msg = f.prev('.contact-msg');
			var contact_name = f.find('[name="contact_name"]');
			var contact_email = f.find('[name="contact_email"]');
			var contact_message = f.find('[name="contact_message"]');
			loading.show();
			contact_msg.html('');
			$.ajax({
				type: 'POST',
				url: g7.ajaxurl,
				data: $(this).serialize(),
				datatype: 'json',
				timeout: 30000,
				error: function() {
					loading.hide();
				},
				success: function (response) {
					loading.hide();
					switch (response.status) {
						case 1:
							contact_msg.html(response.msg);
							f.hide();
							break;
						case 2:
							contact_msg.html(response.msg);
							break;
						case 3:
							if (typeof response.error.name != 'undefined') {
								contact_name.addClass('err');
							}
							if (typeof response.error.email != 'undefined') {
								contact_email.addClass('err');
							}
							if (typeof response.error.message != 'undefined') {
								contact_message.addClass('err');
							}
							if (typeof response.error.body != 'undefined') {
								contact_msg.html(response.error.body);
								f.hide();
							}
							break;
					}
				}
			});
			return false;
		});
		*/

		/**
		 * add fitvids for video inside content and widgets
		 * $('.entry-content, .widget').fitVids();
		 */

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
