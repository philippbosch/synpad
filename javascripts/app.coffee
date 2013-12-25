"use strict"

angular
    .module('synpad', ['ngResource', 'ui.router', 'angular-storage', 'synpad.controllers', 'synpad.services'])
    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $urlRouterProvider.otherwise('/')
        $locationProvider.html5Mode(true)

        $stateProvider.state 'home',
            url: '/'
            views:
                main:
                    templateUrl: 'partials/home.html'
                    controller: 'HomeController'

    ])
