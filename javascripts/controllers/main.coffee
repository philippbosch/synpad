"use strict"

angular
    .module('synpad.controllers.main', [])

    .controller('MainController', ['$scope', '$state', ($scope, $state) ->
        $scope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
            $scope.noScroll = toState.name == 'editor'
    ])
