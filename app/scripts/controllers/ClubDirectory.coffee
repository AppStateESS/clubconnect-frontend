'use strict'

angular.module('ClubConnectApp')
  .controller 'ClubDirectoryCtrl', ($scope, clubProvider) ->
    $scope.clubs = clubProvider
    $scope.tags = [
        title: 'Technology'
      ,
        title: 'Religious'
      ,
        title: 'Special Interest'
      ,
        title: 'Academics'
      ,
        title: 'Greek-lettered'
      ,
        title: 'Fraternity'
      ,
        title: 'Sorority'
      ,
        title: 'Service'
      ,
        title: 'Honor'
    ]
