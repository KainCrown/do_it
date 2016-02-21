class NoticeManager
  DURATION: 1500
  constructor: (@$notice) ->
    setTimeout(@hideNotice, @DURATION)
  hideNotice: =>
    @$notice.fadeOut('slow', ->
      $(this).remove()
    )

$ ->
  new NoticeManager($('#notice_wrapper'))
