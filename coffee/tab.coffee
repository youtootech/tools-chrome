class Tab

  @get_current: (done) ->
    Debug.log "Retrieving current tab"
    chrome.tabs.query
      active: true
      currentWindow: true
    , (tabs) ->
      Debug.log "Current tab(s)", tabs
      if tabs.length >= 1
        done tabs[0]
      else
        Debug.log "No current tab found"

  @open: (opts = {}, done = ->) ->
    Debug.log "Opening a new tab", opts
    done()

  @close: (opts = {}, done = ->) ->
    Debug.log "Closing a tab", opts
    done()