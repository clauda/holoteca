//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require layout/jquery.easing.1.3
//= require layout/jquery.flexslider-min
//= require layout/jquery.mobilemenu
//= require layout/retina-1.1.0.min
//= require layout/moment-with-langs.min
//= require layout/holo
//= require components/facebook
//

Turbolinks.enableTransitionCache();

$(document).on('page:change', function(){
  if(window.Shareaholic){ Shareaholic.init_apps(); };
  if(window.ga){ ga('send', 'pageview'); };
  if(googletag){ googletag.pubads().refresh() };
});