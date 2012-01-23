_.mixin({
  /* Return a new object with the merged properties of all objects in arguments */
  merge: function() {
    var objects = arguments;
    return _.reduce(_.rest(objects), function(obj, o) {
      return _.extend(obj, o);
    }, _.clone(_.first(objects) || {}));
  },

  /* Build an object with [key, value] from pair list or callback */
  mash: function(list, callback, context) {
   var pair_callback = callback || _.identity;
    return _.reduce(list, function(obj, value, index, list) {
      var pair = pair_callback.call(context, value, index, list);
      if (typeof pair == "object" && pair.length == 2) {
        obj[pair[0]] = pair[1];
      }
      return obj;
    }, {});
  },

  /* Return JSON representation of object for inspection */
  inspect: function(obj) {
    return JSON.stringify(obj, null);
  }
});

//console.log(_.merge({a: 1}, {a: 'new1', b: 2}));
//console.log(_(["ride", "the", "dragon"]).mash(function(s) { return [s, s.length]; }));
