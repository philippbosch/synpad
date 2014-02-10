(function() {
  "use strict";
  angular.module('synpad.controllers.editor', []).controller('EditorController', [
    '$scope', '$sce', '$state', '$stateParams', '$location', 'ngStorage', '$firebase', 'firebaseref', 'showdown', function($scope, $sce, $state, $stateParams, $location, ngStorage, $firebase, firebaseref, showdown) {
      var docRef;
      docRef = firebaseref.child('documents').child($stateParams.id);
      $scope.showPreview = ngStorage.get('showPreview') === 'true';
      $scope.togglePreview = function() {
        $scope.showPreview = !$scope.showPreview;
        return ngStorage.set('showPreview', $scope.showPreview);
      };
      $scope.codemirrorLoaded = function(editor) {
        var firepad, updatePreview;
        firepad = Firepad.fromCodeMirror(docRef, editor);
        firepad.on('ready', function() {
          if (firepad.isHistoryEmpty()) {
            firepad.setText('# Hello world');
          }
          editor.on('change', function() {
            return $scope.$apply(updatePreview);
          });
          setTimeout(function() {
            return $scope.$apply(updatePreview);
          }, 0);
          return editor.getDoc().setCursor(0, 0);
        });
        return updatePreview = function() {
          return $scope.documentHTML = $sce.trustAsHtml(showdown.makeHtml(editor.getDoc().getValue()));
        };
      };
      $scope.publish = function() {
        var data;
        data = {
          html: "" + $scope.documentHTML,
          timestamp: Firebase.ServerValue.TIMESTAMP
        };
        docRef = firebaseref.child('documents').child($stateParams.id);
        return docRef.child('rendered').set(data, function() {
          $('#published').modal({
            backdrop: false,
            keyboard: true
          });
          return docRef.setPriority(Math.round((new Date()).getTime() / 1000));
        });
      };
      $scope.id = $stateParams.id;
      return $scope.outputURL = "" + ($location.protocol()) + "://" + ($location.host()) + ($location.port() !== 80 ? ':' + $location.port() : '') + ($state.href('document', {
        id: $stateParams.id
      }));
    }
  ]);

}).call(this);
