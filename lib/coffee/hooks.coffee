class Hooks

  @post_install: ->

  @post_update: (previous_version) ->

  @post_chrome_update: ->

  @post_startup: ->

chrome.runtime.onInstalled.addListener (details) ->
  switch details.reason
    when "install" then Hooks.post_install()
    when "update" then Hooks.post_update details.previousVersion
    when "chrome_update" then Hooks.post_chrome_update()

chrome.runtime.onStartup.addListener ->
  console.log "Booting Youtoo Tools"