'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationHistoryCtrl', ['$scope', ($scope) ->
    $scope.history =
      # Input field for searching clubs
      search: ''

      # Input field for indicating if the club has a history
      hasHistory: undefined

      # Tags for "Has your organization registered before"
      rereg: [
          name: 'Yes'
        , 
          name: 'No'
      ]

      # Link this club instance with an existing club record
      confirm: () ->

        # Club exists and has history
        if $scope.history.hasHistory == 'Yes'

          # Get club data from server based on exact name match
          $scope.sdrapi.getRegistration($scope.history.search).then (result) ->
            if result.error
              alert result.error
            else
              $scope.setHistory result

        else

          # Club is new and has no history
          $scope.setHistory false

      # Undo function for linking this club instance with an existing club record
      unconfirm: () ->
        $scope.clearHistory()

    $scope.$watch 'history.hasHistory', (val) ->
      $scope.$evalAsync () ->
        $('#oldname').focus()
  ]
