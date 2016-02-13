$ ->
  if $('#welcome').length()
    $('.button-collapse').sideNav()
    $('#index-banner').height($(window).height() - 64)
    $('.parallax').parallax()
