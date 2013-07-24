'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubDirectoryCtrl', ($scope, clubProvider, tagProvider) ->
    $scope.clubs = clubProvider.getAllClubs()
    $scope.tags = tagProvider.getSearchTags()
