results = (data, params) =>
  params.page = params.page || 1
  {
    results: data
    pagination: {
      more: (params.page * 30) < data.total_count
    }
  }

data = (params) ->
  {
    q: params.term
    page: params.page
  }

$ ->
  $("#members").empty()
  $('#members').select2({
    ajax: {
      url: '/users.json',
      delay: 500
      data: data
      processResults: results
    }
    width: '100%'
    placeholder: 'Select new member'
  })
