"use strict"

angular
    .module('synpad.controllers.document', [])

    .controller('DocumentController', ['$scope', '$sce', '$state', '$stateParams', '$document', '$firebase', 'firebaseref', 'showdown', ($scope, $sce, $state, $stateParams, $document, $firebase, firebaseref, showdown) ->
        docRef = firebaseref.child('documents').child($stateParams.id)
        $scope.renderedDocument = $firebase(docRef.child('rendered'))

        docRef.once 'value', (data) ->
            $state.go('editor', id: $stateParams.id) if not data.val()?.rendered

        $document.bind 'keypress', (event) ->
            if event.charCode == 95 and $state.current.name == 'document' and $state.params.id == $stateParams.id
                $state.go('editor', id: $stateParams.id)
    ])
