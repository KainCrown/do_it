tilt_direction = (@item) ->
  left_pos = @item.position().left
  move_handler = (e) =>
    if (e.pageX >= left_pos)
      @item.addClass("right")
      @item.removeClass("left")
    else
      @item.addClass("left")
      @item.removeClass("right")
    left_pos = e.pageX;
  $("html").bind("mousemove", move_handler)
  item.data("move_handler", move_handler)

$ ->  
  $( '.kanban_col' ).sortable({
    connectWith: '.kanban_col',
    handle: '.card-content',
    start: ((event, ui) ->
      ui.item.addClass('tilt')
      $('.kanban_col').addClass('state')
      tilt_direction(ui.item)
    ),
    stop: ((event, ui) ->
      ui.item.removeClass("tilt")
      ui.item.removeClass("left")
      ui.item.removeClass("right")
      $('.kanban_col').removeClass('state')
      $("html").unbind('mousemove', ui.item.data("move_handler"))
      ui.item.removeData("move_handler")
    )
  })
