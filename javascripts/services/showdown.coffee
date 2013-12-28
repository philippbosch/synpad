"use strict"

angular
    .module('synpad.services.showdown', [])

    .factory('showdown', ->
        new Showdown.converter()
    )
