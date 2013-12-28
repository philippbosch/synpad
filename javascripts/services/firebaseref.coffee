"use strict"

angular
    .module('synpad.services.firebaseref', [])

    .factory('firebaseref', ['$firebase', ($firebase) ->
        new Firebase('https://synpad.firebaseio.com/')
    ])
