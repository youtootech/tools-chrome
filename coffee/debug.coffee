class Debug

  @prefix: ->
    "[#{@timestamp()}] Youtoo Tools > "

  @timestamp: ->
    Datetime.timestamp()

  @log: ->
    console.log.apply console, arguments # "#{@prefix}#{@msg}"

  @info: ->
    @log msg

  @debug: ->
    @log msg
