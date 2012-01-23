class Test
  constructor: (name) ->
    @name = name

  hello: ->
    'hello ' + @name

$ ->
  s = _([1, 2, 3]).map((x) -> 2*x).join(", ")
  $("#content2").html('hi from coffescript2 and Jquery: ' + s)
  t = new Test('arnau')
  console.log t.hello()
