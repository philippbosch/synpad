"use strict"

angular
    .module('synpad.controllers.home', [])

    .controller('HomeController', ['$scope', '$state', '$firebase', 'firebaseref', ($scope, $state, $firebase, firebaseref) ->
        $scope.createRandomId = ->
            $scope.documentId = Math.random().toString(36).substr(2,8)

        $scope.createNewDocument = (documentId) ->
            ref = firebaseref.child('documents').push()
            $state.go('editor', id: documentId)
    ])
