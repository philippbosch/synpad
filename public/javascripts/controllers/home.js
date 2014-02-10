(function() {
  "use strict";
  angular.module('synpad.controllers.home', []).controller('HomeController', [
    '$scope', '$state', '$firebase', 'firebaseref', function($scope, $state, $firebase, firebaseref) {
      $scope.createRandomId = function() {
        return $scope.documentId = Math.random().toString(36).substr(2, 8);
      };
      return $scope.createNewDocument = function(documentId) {
        var ref;
        ref = firebaseref.child('documents').push();
        return $state.go('editor', {
          id: documentId
        });
      };
    }
  ]);

}).call(this);
