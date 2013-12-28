"use strict"

angular
    .module('synpad.controllers.home', [])

    .controller('HomeController', ['$scope', '$state', '$firebase', 'firebaseref', ($scope, $state, $firebase, firebaseref) ->
        ref = firebaseref.child('documents').push()
        $state.go('editor', id: Math.random().toString(36).substr(2,8))
    ])
