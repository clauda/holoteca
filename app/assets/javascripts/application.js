//
//= require jquery
//= require jquery_ujs
//= require layout/underscore-min
//= require layout/backbone-min
//= require layout/jquery.easing.1.3
//= require layout/jquery.flexslider-min
//= require layout/retina-1.1.0.min
//= require layout/moment-with-langs.min
//= require layout/remodal
//= require layout/holo
//= require components/facebook
//= require views/subscriber
//= require views/tracker
//= require views/modal
//

var isMobile = { 
  Android: function() { return navigator.userAgent.match(/Android/i); }, 
  BlackBerry: function() { return navigator.userAgent.match(/BlackBerry/i); }, 
  iOS: function() { return navigator.userAgent.match(/iPhone|iPad|iPod/i); }, 
  Opera: function() { return navigator.userAgent.match(/Opera Mini/i); }, 
  Windows: function() { return navigator.userAgent.match(/IEMobile/i); }, 
  any: function() { return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows()); } 
};

var tracker = new Holo.Tracker();

if (sessionStorage.getItem('holoteca:modal') != "closed") {
  var modal = new Holo.Modal();
 
  setTimeout(function(){
    Holo.Dispatcher.trigger('modal:trigger');
  }, 120000); // 2 minutes
}

if (sessionStorage.getItem('holoteca:newsletter') != "subscribed") {
  setTimeout(function(){ new Holo.Subscriber() }, 20000);
}