(function() {
  "use strict";
  angular.module('synpad.services.firebaseref', []).factory('firebaseref', [
    '$firebase', '$timeout', '$state', 'dbname', function($firebase, $timeout, $state, dbname) {
      return new Firebase("https://" + dbname + "-synpad.firebaseio.com/");
    }
  ]);

}).call(this);
