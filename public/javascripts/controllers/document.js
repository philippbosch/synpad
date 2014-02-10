(function() {
  "use strict";
  angular.module('synpad.controllers.document', []).controller('DocumentController', [
    '$scope', '$sce', '$state', '$stateParams', '$document', '$firebase', 'firebaseref', 'showdown', function($scope, $sce, $state, $stateParams, $document, $firebase, firebaseref, showdown) {
      var docRef;
      docRef = firebaseref.child('documents').child($stateParams.id);
      $scope.renderedDocument = $firebase(docRef.child('rendered'));
      docRef.once('value', function(data) {
        var _ref;
        if (!((_ref = data.val()) != null ? _ref.rendered : void 0)) {
          return $state.go('editor', {
            id: $stateParams.id
          });
        }
      });
      return $document.bind('keypress', function(event) {
        if (event.charCode === 95 && $state.current.name === 'document' && $state.params.id === $stateParams.id) {
          return $state.go('editor', {
            id: $stateParams.id
          });
        }
      });
    }
  ]);

}).call(this);
