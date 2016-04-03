class KanabanManager
  constructor: (@$task_panel, @$kanban_panel, @$preloader) ->
    @$items = @$kanban_panel.find('.card')
    @set_sortable_handler()
    @set_click_handler()

  tilt_direction: (item) ->
    left_pos = item.position().left
    move_handler = (e) =>
      if (e.pageX >= left_pos)
        item.addClass("tilt-right")
        item.removeClass("tilt-left")
      else
        item.addClass("tilt-left")
        item.removeClass("tilt-right")
      left_pos = e.pageX
    $('html').bind('mousemove', move_handler)
    item.data('move_handler', move_handler)

  update_task_state: (item) ->
    $.ajax({
      url: "tasks/#{$(item).data('id')}",
      type: 'put',
      dataType: 'json',
      success: ( ->
        Materialize.toast('Update was successful!', 1000)
      )
      data: {
        task: {
          state: $(item).parent('.kanban_col').data('col-type')
        }
      }
    })

  set_sortable_handler: =>
    @$kanban_panel.find('.kanban_col').sortable({
      connectWith: '.kanban_col',
      handle: '.card-content',
      start: ((event, ui) =>
        @$items.addClass('hide')
        ui.item.removeClass('hide')
        @$kanban_panel.find('.kanban_col').addClass('state')
        @tilt_direction(ui.item)
      ),
      stop: ((event, ui) =>
        @update_task_state(ui.item)
        ui.item.removeClass("tilt-left")
        ui.item.removeClass("tilt-right")
        @$items.removeClass('hide')
        @$kanban_panel.find('.kanban_col').removeClass('state')
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

  set_click_handler: =>
    @$items.click(((e) =>
      @$task_panel.find('#task_content').addClass('hide')
      @$task_panel.addClass('valign-wrapper')
      @$preloader.removeClass('hide')
      $.getJSON("tasks/#{$(e.currentTarget).data('id')}", ( (data) =>
          @$task_panel.find('#active_task_description').html(data['description'])
          @$task_panel.find('#active_task_title').html(data['title'])
          @$preloader.addClass('hide')
          @$task_panel.removeClass('valign-wrapper')
          @$task_panel.find('#task_content').removeClass('hide')
        )
      )
    ))

$ ->
  new KanabanManager($('#task_panel'), $('#kanban_panel'), $('.preloader-wrapper'))
