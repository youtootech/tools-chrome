class Cookie

  @add: (opts = {}, done = ->) ->
    done()

  @remove: (opts = {}, done = ->) ->
    done()

  @clear_all: (opts = {}, done = ->) ->
    Debug.log "Clearing all cookies"
    chrome.browsingData.removeCookies opts, done

  @dump: (opts = {}, done = ->) ->
    Debug.log "Dumping cookies"
    chrome.cookies.getAll opts, (cookies) ->
      done() unless cookies
      Debug.log "Found #{cookies.length} cookies"
      cookies.forEach (cookie) ->
        Debug.log cookie

      done()

  @process_uncached_request: (done = ->) ->
    done()