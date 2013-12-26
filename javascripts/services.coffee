"use strict"

angular
    .module('synpad.services', [])

    .factory('firebaseref', ['$firebase', ($firebase) ->
        new Firebase('https://synpad.firebaseio.com/')
    ])

    .factory('showdown', ->
        new Showdown.converter()
    )
