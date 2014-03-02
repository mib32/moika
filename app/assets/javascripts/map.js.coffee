# yandex map on main page
$ ->
  getCarWashes = ->
    $.ajax '/car_washes',
      dataType: "json",
      cache: false,
      success: (json) ->
        cw_list = []
        json.forEach (row) ->
          cw_list.push
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
        ymaps.ready(init(cw_list))
  getCarWashes.call()
  window.setInterval(updateTraffic,1*60*1000)


