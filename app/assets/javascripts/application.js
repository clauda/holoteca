//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require layout/jquery.easing.1.3
//= require layout/masonry.pkgd.min
//= require layout/jquery.flexslider-min
//= require layout/jquery.fitvids
//= require layout/jquery.mobilemenu
//= require layout/jquery.prettyPhoto
//= require layout/retina-1.1.0.min
//= require layout/moment-with-langs.min
//= require layout/scripts
//= require components/facebook
//

Turbolinks.enableTransitionCache();

$(document).on('page:change', function(){
  if(window.Shareaholic){ Shareaholic.init_apps(); };
});