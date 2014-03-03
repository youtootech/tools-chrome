class Hook

  @handle_install_hook: (details, done = ->) ->
    Debug.log "Handing install hook"
    switch details.reason
      when "install" then @post_install done
      when "update" then @post_update details.previousVersion, done
      when "chrome_update" then @post_chrome_update done

  @post_install: (done = ->) ->
    Debug.log "Processing post-install hook"
    done()

  @post_update: (previous_version, done = ->) ->
    Debug.log "Processing post-update hook"
    done()

  @post_chrome_update: (done = ->) ->
    Debug.log "Processing post-chrome-update hook"
    done()

  @post_startup: (done = ->) ->
    console.log "Processing post-startup hook"
    done()
