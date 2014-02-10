"use strict"

angular
    .module('synpad.services.firebaseref', [])

    .factory('firebaseref', ['$firebase', '$timeout', '$state', 'dbname', ($firebase, $timeout, $state, dbname) ->
        fb = new Firebase("https://#{dbname}-synpad.firebaseio.com/")

        connCheck = $timeout ->
            console.log('No connection!')
            $state.go('setup')
        , 2000

        $firebase(fb).$on 'loaded', ->
            $timeout.cancel(connCheck)

        fb
    ])
