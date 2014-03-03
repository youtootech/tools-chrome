class Tab

  @open: (opts = {}, done = ->) ->
    Debug.log "Opening a new tab", opts
    done()

  @close: (opts = {}, done = ->) ->
    Debug.log "Closing a tab", opts
    done()