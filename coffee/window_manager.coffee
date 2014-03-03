class WindowManager

  @open: (opts = {}, done = ->) ->
    Debug.log "Opening a new window", opts
    done()

  @open_incognito: (opts = {}, done = ->) ->
    Debug.log "Opening a new incognito window", opts
    done()

  @close: (opts = {}, done = ->) ->
    Debug.log "Closing a window", opts
    done()