"use strict"

angular
    .module('synpad', [
        'ngResource',
        'ui.router',
        'ui.codemirror',
        'angular-storage',
        'angularMoment',
        'firebase',
        'synpad.controllers',
        'synpad.services'
    ])

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
            url: '/{id:.+[^_]}'
            views:
                main:
                    templateUrl: '/partials/document.html'
                    controller: 'DocumentController'

        $stateProvider.state 'editor',
            url: '/{id:.+[^_]}_'
            views:
                main:
                    templateUrl: '/partials/editor.html'
                    controller: 'EditorController'
    ])


angular
    .module('synpad.controllers', [
        'synpad.controllers.main',
        'synpad.controllers.home',
        'synpad.controllers.list',
        'synpad.controllers.document',
        'synpad.controllers.editor',
    ])


angular
    .module('synpad.services', [
        'synpad.services.firebaseref',
        'synpad.services.showdown',
    ])
