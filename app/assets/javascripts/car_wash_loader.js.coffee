class @CarWashLoader
  constructor: ->

  @load: (on_load_end_callback) ->
    console.log 'getCarWashes called'
    @cw_list = []
    $.getJSON '/car_washes', (json) ->
      console.log 'getCarWashes.success called'
      for row in json
        CarWashLoader.cw_list.push
          coords: [row.lat, row.lon],
          id: row.id,
          address: row.address,
          title: row.title,
          signal: row.signal,
          url: row.url.slice(0,-5),
          contacts: row.contacts,
          services: row.services,
          blink: row.blink,
          main_action: row.main_action,
          action_on_map: row.action_on_map,
          videoned: row.videoned,
          discounted: row.discounted,
          brended: row.brended,
          gasolined: row.gasolined,
          repaired: row.repaired,
          tired: row.tired,
          signal_type: row.signal_type,
          grey: row.grey
      on_load_end_callback.call()
      console.log "cw_list.length: #{CarWashLoader.cw_list.length}"
      console.log 'getCarWashes.success end'
    console.log 'getCarWashes end'

