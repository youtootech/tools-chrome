class Cache

  @cache_enabled: true

  @clear: (done = ->) ->
    Debug.log "Clearing the browser cache"
    return done()
    chrome.browsingData.removeCache {}, ->
      Debug.log "Browser cache cleared"
      done()

  @disable: (done = ->) ->
    Debug.log "Disabling the browser cache"
    @cache_enabled = false
    done()

  @enable: (done = ->) ->
    Debug.log "Enabling the browser cache"
    @cache_enabled = true
    done()