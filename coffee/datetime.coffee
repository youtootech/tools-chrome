class Datetime

  @timestamp: ->
    "#{@year()}/#{@month()}/#{@date} #{@hour()}:#{@minute()}:#{@second()}"

  @year: ->
    new Date().getFullYear()

  @month: ->
    new Date().getMonth() + 1

  @date: ->
    new Date().getDate()

  @hour: ->
    new Date().getHours()

  @minute: ->
    new Date().getMinutes()

  @second: ->
    new Date().getSeconds()

  @parse: (timestamp, done) ->