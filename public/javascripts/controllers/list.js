(function() {
  "use strict";
  angular.module('synpad.controllers.list', []).controller('ListController', [
    '$scope', '$firebase', 'firebaseref', function($scope, $firebase, firebaseref) {
      $scope.documents = $firebase(firebaseref.child('documents'));
      return $scope.documents.$on('loaded', function() {
        return $scope.documentsLoaded = true;
      });
    }
  ]);

}).call(this);
