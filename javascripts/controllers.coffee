"use strict"

angular
    .module('synpad.controllers', [])

    .controller('MainController', ['$scope', ($scope) ->
    ])

    .controller('HomeController', ['$scope', '$firebase', 'firebaseref', ($scope, $firebase, firebaseref) ->
        $scope.documents = $firebase(firebaseref)
    ])

    .controller('DocumentController', ['$scope', '$sce', '$stateParams', '$firebase', 'firebaseref', 'showdown', ($scope, $sce, $stateParams, $firebase, firebaseref, showdown) ->
        docRef = firebaseref.child($stateParams.id)
        $scope.document = $firebase(docRef)
        mdRef = docRef.child('md')
        $scope._md = $firebase(mdRef)
        $scope._md.$bind($scope, 'md')

        $scope._md.$on 'change', ->
            $scope.documentHTML = $sce.trustAsHtml(showdown.makeHtml($scope._md.$value))
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
    ])
