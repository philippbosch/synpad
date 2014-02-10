"use strict"

angular
    .module('synpad.controllers.main', [])

    .controller('MainController', ['$scope', '$state', 'dbname', ($scope, $state, dbname) ->
        $scope.dbname = dbname

        $scope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
            $scope.noScroll = toState.name == 'editor'
    ])
