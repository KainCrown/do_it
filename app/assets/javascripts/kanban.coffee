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

updateTaskState = (@item) ->
  $.ajax({
    url: "tasks/#{$(@item).data('id')}",
    type: 'put',
    dataType: 'json',
    success: ( ->
      Materialize.toast('Update was successful!', 1000)
    )
    data: {
      task: {
        state: $(@item).parent('.kanban_col').data('col-type')
      }
    }
  })

$ ->
  $( '.kanban_col' ).sortable({
    connectWith: '.kanban_col',
    handle: '.card-content',
    start: ((event, ui) ->
      $('.card').addClass('hide')
      ui.item.removeClass('hide')
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
      $(ui.item).closest('.kanban_col').removeClass('focus')
    ),
    over: ((event, ui) ->
      $(ui.placeholder).closest('.kanban_col').addClass('focus')
    ),
    out: ((event, ui) ->
      $(ui.placeholder).closest('.kanban_col').removeClass('focus')
    )
  })

  $('.card').click((->
    $('#task_content').addClass('hide')
    $('#task_panel').addClass('valign-wrapper')
    $('.preloader-wrapper').removeClass('hide')
    $.getJSON("tasks/#{$(this).data('id')}", ( (data) ->
        $('#active_task_description').html(data['description'])
        $('#active_task_title').html(data['title'])
        $('.preloader-wrapper').addClass('hide')
        $('#task_panel').removeClass('valign-wrapper')
        $('#task_content').removeClass('hide')
      )
    )
  ))
