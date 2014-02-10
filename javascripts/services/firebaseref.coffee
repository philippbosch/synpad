"use strict"

angular
    .module('synpad.services.firebaseref', [])

    .factory('firebaseref', ['$firebase', '$timeout', '$state', 'dbname', ($firebase, $timeout, $state, dbname) ->
        new Firebase("https://#{dbname}-synpad.firebaseio.com/")
    ])
