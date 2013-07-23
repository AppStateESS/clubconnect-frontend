'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoClubDirectoryCtrl', ['$scope', 'clubProvider', ($scope, clubProvider) ->
    $scope.clubs = clubProvider
  ]
