
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

	// fecha barra de newsletter
  var _close = function(){
    $('#fixed_bar').slideUp('fast');
    $('#top').css('marginTop', '0');
  }

  $(".is-subscription").on('submit', function(){
    $('#is-subscription button').text("ASSINADO").attr('disabled', 'disabled');
    setTimeout(function(){ _close() }, 2000);
  });

  setTimeout(function(){
    $('#fixed_bar').slideDown('fast');
    $('#top').css('marginTop', '62px');
  }, 20000);

  $('.is-close').on('click', function(e){
    e.preventDefault();
    _close();
  });

  // Modal
  var _modernpopup = $('[data-remodal-id=modal-social]').remodal();
  setTimeout(function(){ _modernpopup.open() }, 120000); // 2 minutes

})(jQuery);
