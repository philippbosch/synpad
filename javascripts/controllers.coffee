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
        docRef = firebaseref.child('rendered').child($stateParams.id)
        $scope.renderedDocument = $firebase(docRef)

        docRef.once 'value', (data) ->
            $state.go('editor', id: $stateParams.id) if not data.val()
    ])

    .controller('EditorController', ['$scope', '$sce', '$stateParams', '$firebase', 'firebaseref', 'showdown', ($scope, $sce, $stateParams, $firebase, firebaseref, showdown) ->
        docRef = firebaseref.child('documents').child($stateParams.id)

        $scope.showPreview = true
        $scope.togglePreview = ->
            $scope.showPreview = !$scope.showPreview

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

            updatePreview = ->
                $scope.documentHTML = $sce.trustAsHtml(showdown.makeHtml(editor.getDoc().getValue()))

        $scope.publish = ->
            renderedDocRef = firebaseref.child('rendered').child($stateParams.id).set(html: "#{$scope.documentHTML}")
    ])
