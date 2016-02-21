$ ->
  if $('#project-list').length
    $('.button-collapse').sideNav()
    $('.modal-trigger').leanModal()
    $('.container').css('min-height', $(window).height() - $('nav').height() - $('.page-footer').height())
