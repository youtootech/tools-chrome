$ ->
  $('#action-cache-clear').click ->
    Cache.clear ->
      Debug.log "Page registers that cache was cleared"

  $('#action-cache-disable').click ->
    self = $ this
    Cache.disable ->
      Debug.log "Page registers that cache was disabled"
      self.addClass "hidden"
      $("#action-cache-enable").removeClass "hidden"

  $('#action-cache-enable').click ->
    self = $ this
    Cache.enable ->
      Debug.log "Page registers that cache was enabled"
      self.addClass "hidden"
      $("#action-cache-disable").removeClass "hidden"

  $('#action-cookies-clear').click ->
    Cookie.clear_all {}, ->
      Debug.log "Page registers that cookies were cleared"

  $('#action-incognito-create').click ->
    WindowManager.open_incognito {}, ->
      Debug.log "Page registers that an incognito window was opened"