//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var purchaseMenu = function() {

	$('#imageclick').click(function() {
    $('#back').show();
    $('#front').show();
    $('#close').show();
    $('.wrapper').addClass('blur');
    $('.bar').addClass('blur');
  });

  $('#back').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.prepurchaseform').hide();
    $('.wrapper').removeClass('blur');
    $('.bar').removeClass('blur');
  });

  $('#close').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.prepurchaseform').hide();
    $('.wrapper').removeClass('blur');
    $('.englewood').removeClass('blur');
    $('.bar').removeClass('blur');
  });

  $('#front').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.wrapper').removeClass('blur');
    $('.bar').removeClass('blur');
  });

  $('.lightboximage').click(function() {
    $('#back').hide();
    $('#front').hide();
    $('.wrapper').removeClass('blur');
    $('.bar').removeClass('blur');
  });

  $('.prepurchaseformbutton').click(function() {
    $('#back').show();
    $('.prepurchaseform').show();
    $('.wrapper').addClass('blur');
    $('.bar').addClass('blur');
  });

}

$(document).ready(purchaseMenu);
$(document).on('page:load', purchaseMenu);