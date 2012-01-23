$ ->
  $("#notice .close").on "click", (ev) ->
     $(this).up("#notice").fadeOut()
