'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ['$scope', 'tagProvider', '$http', ($scope, tagProvider, $http) ->
    $scope.searchTags = tagProvider.getSearchTags()
    $scope.electionTags = tagProvider.getElectionTags()
    $scope.monthTags = tagProvider.getMonthTags()

    $scope.rereg = [
        name: 'Yes'
      ,
        name: 'No'
    ]

    $scope.officers = []

    $scope.newperson = {}

    $scope.confirmHistory = (name) ->
      $scope.registration.history = ($scope.clubs.filter (x) -> x.fullname == name)[0]
      if not $scope.registration.history
        alert 'We were not able to find a club by the name ' + name + '.  Please try searching again.'
      else
        $scope.showRestOfForm = true

    $scope.unconfirmHistory = () ->
      $scope.history = undefined
      $scope.showRestOfForm = undefined

    $scope.confirmNoHistory = () ->
      $scope.showRestOfForm = true

    $scope.unconfirmNoHistory = () ->
      $scope.showRestOfForm = undefined

    $scope.registration = {}

    $http.get('/json/clubs.json').success (result) ->
      $scope.clubs = result
      result

    $scope.loadingClubs = false

    $scope.$watch 'fullname', (value) ->
      # Value can be blank
      if not value
        return undefined

      $scope.loadingClubs = true
  ]
