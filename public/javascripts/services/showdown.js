(function() {
  "use strict";
  angular.module('synpad.services.showdown', []).factory('showdown', function() {
    return new Showdown.converter();
  });

}).call(this);
