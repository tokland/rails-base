submitFormOnControlEnter = (parent) ->
  $(parent).on "keydown", "form", (ev) ->
    if ev.ctrlKey and ev.keyCode == 13
      $(this).submit()

submitFormOnControlEnter(document)
