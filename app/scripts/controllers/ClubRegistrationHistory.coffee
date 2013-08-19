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

          # Search for an exact name match since they should have used the popup
          history = ($scope.clubs.filter (x) -> x.fullname == $scope.history.search)[0]

          # Unable to find
          if not history
            alert 'Could not find a club by the name ' + name + '.  Please try searching again.'

          # Set the history on the Registration object
          else
            $scope.setHistory history

        else

          # Club is new and has no history
          $scope.setHistory false

      # Undo function for linking this club instance with an existing club record
      unconfirm: () ->
        $scope.clearHistory()
  ]
