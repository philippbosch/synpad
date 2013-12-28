"use strict"

angular
    .module('synpad.controllers.editor', [])

    .controller('EditorController', ['$scope', '$sce', '$state', '$stateParams', '$location', 'ngStorage', '$firebase', 'firebaseref', 'showdown', ($scope, $sce, $state, $stateParams, $location, ngStorage, $firebase, firebaseref, showdown) ->
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
            data =
                html: "#{$scope.documentHTML}"
                timestamp: Firebase.ServerValue.TIMESTAMP

            docRef = firebaseref.child('documents').child($stateParams.id)
            docRef.child('rendered').set(data, ->
                $('#published').modal(backdrop: false, keyboard: true)
                docRef.setPriority(Math.round((new Date()).getTime()/1000))
            )

        $scope.id = $stateParams.id
        $scope.outputURL = "#{$location.protocol()}://#{$location.host()}#{if $location.port()!=80 then ':'+$location.port() else ''}#{$state.href('document', id: $stateParams.id)}"
    ])
