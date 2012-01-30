$.fn.extend({
  /* Find the first parent of element (tree-ascending) that matches a given selector(s) */
  up: function(selectors) {
    return $(this).parent().closest(selectors);
  },
  
  isEmpty: function() {
    return $(this).length == 0;
  }
});
