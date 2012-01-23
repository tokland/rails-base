# Rails-flash feedback box

$(document).on "click", "#notice .close", (ev) ->
   $(this).up("#notice").fadeOut()
