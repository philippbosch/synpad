(function() {
  "use strict";
  angular.module('synpad.services.firebaseref', []).factory('firebaseref', [
    '$firebase', '$timeout', '$state', 'dbname', function($firebase, $timeout, $state, dbname) {
      var connCheck, fb;
      fb = new Firebase("https://" + dbname + "-synpad.firebaseio.com/");
      connCheck = $timeout(function() {
        console.log('No connection!');
        return $state.go('setup');
      }, 2000);
      $firebase(fb).$on('loaded', function() {
        return $timeout.cancel(connCheck);
      });
      return fb;
    }
  ]);

}).call(this);
