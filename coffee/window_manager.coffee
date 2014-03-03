class WindowManager

  @open: (opts = {}, done = ->) ->
    return done() unless opts.url?

    Debug.log "Opening a new window", opts
    chrome.windows.create opts, (new_window) ->
      Debug.log "New window created", new_window
      done new_window

  @open_incognito: (opts = {}, done = ->) ->
    return done() unless opts.url?
    opts.incognito = true

    Debug.log "Opening a new incognito window", opts
    chrome.windows.create opts, (new_window) ->
      Debug.log "New incognito window created", new_window
      done()

  @close: (opts = {}, done = ->) ->
    Debug.log "Closing a window", opts
    done()