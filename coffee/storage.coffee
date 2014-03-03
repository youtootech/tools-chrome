class Storage

  @dump: (done = ->) ->
    done()

  @stats: (done = ->) ->
    done()

  @store: (key, val, done = ->) ->
    done()

  @remove: (key, done = ->) ->
    done()