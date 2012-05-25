$.fn.extend({
  /* Find the first parent of element (tree-ascending) that matches a given selector(s) */
  up: function(selectors) {
    return $(this).parent().closest(selectors);
  },

  /* Find the first children that matches a given selector(s) */
  down: function(selectors) {
    return $(this).find(selectors).first();
  },
  
  setVisible: function(value) {
    return (value ? $(this).show() : (this).hide());
  },
  
  /* Return true if jquery array is empty */
  isEmpty: function() {
    return $(this).length == 0;
  }
});
