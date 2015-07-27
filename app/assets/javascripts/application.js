//
//= require jquery
//= require jquery_ujs
//= require layout/jquery.easing.1.3
//= require layout/jquery.flexslider-min
//= require layout/jquery.mobilemenu
//= require layout/retina-1.1.0.min
//= require layout/moment-with-langs.min
//= require layout/holo
//= require components/facebook
//

$(function(){

  $("#is-subscription").on('submit', function(){
    $('#is-subscription button').text("ASSINADO").attr('disabled', 'disabled');
  });

  // Fix menu on top
  // $(document).on("scroll", function() {
  //   if ($(document).scrollTop() > 100) {
  //     $("#mainnav").addClass("fix");
  //   } else {
  //     $("#mainnav").removeClass("fix");
  //   }
  // });

});

