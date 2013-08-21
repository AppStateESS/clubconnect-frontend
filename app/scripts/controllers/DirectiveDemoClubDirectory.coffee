'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoClubDirectoryCtrl', ['$scope', 'clubSearch', ($scope, clubSearch) ->
    $scope.clubs = clubSearch.getAllClubs()
  ]
