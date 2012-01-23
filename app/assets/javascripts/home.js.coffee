class window.Home
  constructor: (name) ->
    @name = name

  hello: ->
    "hello #{@name}"

  run: ->
    s = _([1, 2, 3]).map((x) -> 2*x).join(", ")
    $("#content").html("from coffescript2 and Jquery: #{@hello()}")
