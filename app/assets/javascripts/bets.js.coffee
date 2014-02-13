$ ->
  PrivatePub.subscribe '/lots/update', (data, channel) ->
    console.log(data)
    $('#lot_' + data.lot_id + ' .expired_time').html(data.expired_time)
