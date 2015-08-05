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
  }, 10000);

  $('.is-close').on('click', function(e){
    e.preventDefault();
    _close();
  })

  // Fix menu on top
  // $(document).on("scroll", function() {
  //   if ($(document).scrollTop() > 100) {
  //     $("#mainnav").addClass("fix");
  //   } else {
  //     $("#mainnav").removeClass("fix");
  //   }
  // });

});

