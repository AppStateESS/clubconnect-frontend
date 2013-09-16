'use strict'

angular.module('ClubConnectApp')
  .controller 'PeopleCtrl', ['$scope', 'personService', ($scope, personService) ->
    $scope.results = []

    $scope.search = ''

    searchTimeout = undefined

    doSearch = () ->
      $scope.$apply () ->
        personService.search($scope.search).then (response) ->
          $scope.results = response

    $scope.personRowClicked = (href) ->
      window.location = href

    $scope.$watch 'search', (search) ->
      if searchTimeout
        clearTimeout searchTimeout
      searchTimeout = setTimeout doSearch, 500
  ]
