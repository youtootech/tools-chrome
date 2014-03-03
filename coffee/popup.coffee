$ ->
  $('#action-cache-clear').click ->
    Cache.clear ->
      Debug.log "Page registers that cache was cleared"

  $('#action-cache-disable').hover ->
    $(this).html "<span class='glyphicon glyphicon-leaf'></span> This feature coming soon!"
  , ->
    $(this).html "<span class='glyphicon glyphicon-remove'></span> Disable Browser Cache"

  $('#action-cache-disable').click ->
    ###
      I'll do this very soon. Just want to get this out the door first.
    ###
    return false
    self = $ this
    Cache.disable ->
      Debug.log "Page registers that cache was disabled"
      self.addClass "hidden"
      $("#action-cache-enable").removeClass "hidden"

  $('#action-cache-enable').click ->
    return false
    self = $ this
    Cache.enable ->
      Debug.log "Page registers that cache was enabled"
      self.addClass "hidden"
      $("#action-cache-disable").removeClass "hidden"

  $('#action-cookies-clear').click ->
    Cookie.clear_all {}, ->
      Debug.log "Page registers that cookies were cleared"

  $('#action-incognito-create').click ->
    Debug.log "Clicked to open incognito window"
    Tab.get_current (tab) ->
      Debug.log "Current tab(s) inside popup script", tab
      WindowManager.open_incognito { url: tab.url }, ->
        Debug.log "Page registers that an incognito window was opened"