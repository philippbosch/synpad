(function() {
  "use strict";
  angular.module('synpad.controllers.main', []).controller('MainController', [
    '$scope', '$state', 'dbname', function($scope, $state, dbname) {
      $scope.dbname = dbname;
      return $scope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
        return $scope.noScroll = toState.name === 'editor';
      });
    }
  ]);

}).call(this);
