"use strict"

angular
    .module('synpad', ['ngResource', 'ui.router', 'ui.codemirror', 'angular-storage', 'angularMoment', 'firebase', 'synpad.controllers', 'synpad.services'])
    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider', '$sceProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $sceProvider) ->
        $urlRouterProvider.otherwise('/')
        $locationProvider.html5Mode(true)
        $sceProvider.enabled(false)

        $stateProvider.state 'home',
            url: '/'
            views:
                main:
                    controller: 'HomeController'

        $stateProvider.state 'list',
            url: '/list'
            views:
                main:
                    templateUrl: '/partials/list.html'
                    controller: 'ListController'

        $stateProvider.state 'document',
            url: '/{id:.*[^_]}'
            views:
                main:
                    templateUrl: '/partials/document.html'
                    controller: 'DocumentController'

        $stateProvider.state 'editor',
            url: '/{id:.*[^_]}_'
            views:
                main:
                    templateUrl: '/partials/editor.html'
                    controller: 'EditorController'
    ])
