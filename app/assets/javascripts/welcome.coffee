$ ->
  if $('#welcome').length
    $('.button-collapse').sideNav()
    $('#index-banner').height($(window).height() - $('nav').height())
    $('.parallax').parallax()
