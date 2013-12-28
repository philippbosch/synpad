"use strict"

angular
    .module('synpad.controllers.list', [])

    .controller('ListController', ['$scope', '$firebase', 'firebaseref', ($scope, $firebase, firebaseref) ->
        $scope.documents = $firebase(firebaseref.child('documents'))
        $scope.documents.$on 'loaded', ->
            $scope.documentsLoaded = true
    ])
