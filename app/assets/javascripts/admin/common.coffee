window.submitFormOnControlEnter = (parent) ->
  $(parent).on "keydown", "form", (ev) ->
    if ev.ctrlKey and ev.keyCode == 13
      $(this).submit()

window.initDatepickers = -> 
  default_options = $.datepicker.regional[window.locale]
  $(".custom_datepicker").datepicker _(default_options).merge
    dateFormat: 'yy-mm-dd'
    changeYear: true
    showOn: "button"
    buttonImage: "/assets/calendar.gif"

$ ->
  window.submitFormOnControlEnter(document)
  window.initDatepickers()
  $("select").chosen()
