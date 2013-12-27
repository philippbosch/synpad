"use strict"

angular
    .module('synpad.controllers', [])

    .controller('MainController', ['$scope', ($scope) ->
    ])

    .controller('HomeController', ['$scope', '$state', '$firebase', 'firebaseref', ($scope, $state, $firebase, firebaseref) ->
        ref = firebaseref.child('documents').push()
        $state.go('editor', id: ref.name())
    ])

    .controller('ListController', ['$scope', '$firebase', 'firebaseref', ($scope, $firebase, firebaseref) ->
        $scope.documents = $firebase(firebaseref.child('documents'))
    ])

    .controller('DocumentController', ['$scope', '$sce', '$state', '$stateParams', '$firebase', 'firebaseref', 'showdown', ($scope, $sce, $state, $stateParams, $firebase, firebaseref, showdown) ->
        docRef = firebaseref.child('documents').child($stateParams.id)
        $scope.renderedDocument = $firebase(docRef.child('rendered'))

        docRef.once 'value', (data) ->
            $state.go('editor', id: $stateParams.id) if not data.val()
    ])

    .controller('EditorController', ['$scope', '$rootScope', '$sce', '$state', '$stateParams', '$location', 'ngStorage', '$firebase', 'firebaseref', 'showdown', ($scope, $rootScope, $sce, $state, $stateParams, $location, ngStorage, $firebase, firebaseref, showdown) ->
        $rootScope.noScroll = true

        docRef = firebaseref.child('documents').child($stateParams.id)

        $scope.showPreview = ngStorage.get('showPreview') == 'true'

        $scope.togglePreview = ->
            $scope.showPreview = !$scope.showPreview
            ngStorage.set('showPreview', $scope.showPreview)

        $scope.codemirrorLoaded = (editor) ->
            firepad = Firepad.fromCodeMirror(docRef, editor)

            firepad.on 'ready', ->
                if firepad.isHistoryEmpty()
                    firepad.setText '# Hello world'

                editor.on 'change', ->
                    $scope.$apply updatePreview

                setTimeout ->
                    $scope.$apply updatePreview
                , 0

                editor.getDoc().setCursor(0,0)

            updatePreview = ->
                $scope.documentHTML = $sce.trustAsHtml(showdown.makeHtml(editor.getDoc().getValue()))

        $scope.publish = ->
            renderedDocRef = firebaseref.child('documents').child($stateParams.id).child('rendered').set html: "#{$scope.documentHTML}", ->
                $('#published').modal(backdrop: false, keyboard: true)

        $scope.id = $stateParams.id
        $scope.outputURL = "#{$location.protocol()}://#{$location.host()}#{if $location.port()!=80 then ':'+$location.port() else ''}#{$state.href('document', id: $stateParams.id)}"
    ])
