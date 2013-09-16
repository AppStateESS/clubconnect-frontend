'use strict'

angular.module('ClubConnectApp')
  .controller 'ProcessRegistrationCtrl', ['$scope', 'clubService', 'tagService', 'registration', ($scope, clubService, tagService, registration) ->
    $scope.sdrdata = {}

    tagService.getSearchTags()
      .then (tags) ->
        $scope.sdrdata.searchTags = tags

    tagService.getElectionTags()
      .then (tags) ->
        $scope.sdrdata.electionTags = tags

    $scope.regid = registration

    clubService.getRegistration($scope.regid)
      .then (registration) ->
        $scope.registration = registration
  ]


