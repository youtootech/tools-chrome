$ ->
  $('#action-cache-clear').click ->

  $('#action-cache-disable').click ->
    $(this).addClass "none"
    $("#action-cache-enable").removeClass "none"

  $('#action-cache-enable').click ->
    $(this).addClass "none"
    $("#action-cache-disable").removeClass "none"

  $('#action-cookies-clear').click ->

  $('#action-incognito-create').click ->