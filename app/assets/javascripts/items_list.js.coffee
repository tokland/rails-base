class window.ItemsList
  constructor: (options = {}) ->
    @options = _(options).defaults
      selectors:
        box: "#items-list-box"
        item_box: ".item-box"
        add: ".add"
        remove: ".remove"
        delete_field: ".delete-field"
      messages:
        confirm_remove: "Are you sure?"
      callbacks:
        after_add: null
        after_remove: null
      template: ""
      slideSpeed: "slow"
      child_index: '_child_index_'
            
    $(document).on "click", @options.selectors.add, _.bind(@onAddClicked, @)
    $(document).on "click", @options.selectors.remove, _.bind(@onRemoveClicked, @)
    _(@options.preadd || 0).times => @_add() 

  run_callback: (key, args...) ->
    fname = @options.callbacks[key]
    if fname then window[fname](args...) else null
   
  onRemoveClicked: (ev) ->
    ev.preventDefault()
    el = $(ev.currentTarget)
    if el.attr("data-confirmation") != "1" or confirm(@options.messages.confirm_remove)
      box = el.up(@options.selectors.item_box)
      delete_fields = box.down(@options.selectors.delete_field)
      delete_fields.val('1')
      box.slideUp @options.slideSpeed, =>
        box.remove() if delete_fields.isEmpty()
        @run_callback("after_remove", el, box)
    
  onAddClicked: (ev) ->
    ev.preventDefault()
    el = $(ev.currentTarget)
    item_box = @_add()
    @run_callback("after_add", el, item_box)
    item_box.slideDown @options.slideSpeed, =>
      item_box.css("display", "block")    

  _add: ->  
    items_box = $(@options.selectors.box)
    rn = Math.random() + new Date().getTime()
    html = @options.template.replace(new RegExp(@options.child_index, "g"), "new-#{rn}")
    item_box = $("<span>").html(html)
    items_box.append(item_box)
    item_box
