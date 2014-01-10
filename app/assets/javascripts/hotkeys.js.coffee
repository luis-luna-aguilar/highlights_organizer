$ ->

  $("#information_line_text").bind 'keydown.ctrl_return', ->
    $(this).parents("form").submit()
