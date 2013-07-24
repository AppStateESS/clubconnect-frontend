'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubRegistrationCtrl', ($scope, tagProvider) ->
    $scope.searchTags = tagProvider.getSearchTags()
    $scope.electionTags = tagProvider.getElectionTags()
