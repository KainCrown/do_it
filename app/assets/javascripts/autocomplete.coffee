$ ->
  data = ['tom','john'];
  $('textarea').atwho(
    {
      at:"@",
      'data': data
    }
  );

  emojis = $.map(emojies, (value, i) ->
    return {key: value, name:value}
  )

  emoji_config = {
      at: ":",
      data: emojis,
      displayTpl: "<li>${name} <img src='http://localhost:3000/images/emoji/${key}.png'  height='20' width='20' /></li>",
      insertTpl: ':${key}:',
      delay: 400
    }

  $('textarea').atwho(emoji_config);
