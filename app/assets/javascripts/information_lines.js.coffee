$ ->

  # Temporary switch

  $("#temporary-mode-switch").click ->
    is_new_call = true

    if ($("#temporary-mode-switch").text() == "Draggable") && is_new_call
      $("#temporary-mode-switch").text("Sortable")
      $("#topics-list li").droppable("disable")
      $("#information_lines li").draggable("disable")
      $("#information_lines").sortable("enable")
      is_new_call = false

    if ($("#temporary-mode-switch").text() == "Sortable") && is_new_call
      $("#temporary-mode-switch").text("Highlightable")
      $("#topics-list li").droppable("disable")
      $("#information_lines li").draggable("disable")
      $("#information_lines").sortable("disable")
      is_new_call = false

    if ($("#temporary-mode-switch").text() == "Highlightable") && is_new_call
      $("#temporary-mode-switch").text("Draggable")
      $("#topics-list li").droppable("enable")
      $("#information_lines li").draggable("enable")
      $("#information_lines").sortable("disable")
      is_new_call = false

  # Drag & Drop

  $("#topics-list li").droppable
    accept: ".information-line"
    tolerance: "pointer"
    hoverClass: 'hovered-droppable'
    drop: (event, ui) ->
      topic_id = $(this).attr("data-id")
      url = ui.draggable.attr("data-url")
      max_int = 1000000000
      $.ajax(
        type: "PUT"
        url: url
        data:
          information_line: {topic_id: topic_id, line_order_position: max_int}
      ).done((msg) ->
        ui.draggable.remove()
      ).fail (msg) ->
        alert "Error: " + msg

  $("#information_lines li").draggable
    revert: "invalid"
    snap: ".topic-li"
    snapMode: "inner"

  # Sortable

  $("#information_lines").sortable
    cursor: "move"
    update: (event, ui) ->
      position = ui.item.index()
      id = ui.item.attr("data-information-line-id")
      url = ui.item.attr("data-url")
      $.ajax(
        type: "PUT"
        url: url
        data:
          information_line: {line_order_position: position}
      ).fail (msg) ->
        alert "Error: " + msg
