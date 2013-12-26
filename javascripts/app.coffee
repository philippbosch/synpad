"use strict"

angular
    .module('synpad', ['ngResource', 'ui.router', 'ui.codemirror', 'angular-storage', 'firebase', 'synpad.controllers', 'synpad.services'])
    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $urlRouterProvider.otherwise('/')
        $locationProvider.html5Mode(true)

        $stateProvider.state 'home',
            url: '/'
            views:
                main:
                    templateUrl: '/partials/home.html'
                    controller: 'HomeController'

        $stateProvider.state 'document',
            url: '/:id'
            views:
                main:
                    templateUrl: '/partials/document.html'
                    controller: 'DocumentController'

        $stateProvider.state 'editor',
            url: '/:id/edit'
            views:
                main:
                    templateUrl: '/partials/editor.html'
                    controller: 'EditorController'
    ])
