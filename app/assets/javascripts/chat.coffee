$ ->
  PrivatePub.subscribe('/chat', (data, channel) ->
    $('#chat').append(data.message)
    $('#new_message')[0].reset()
  )
