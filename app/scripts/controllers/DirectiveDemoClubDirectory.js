'use strict';

angular.module('clubconnectApp')
.controller('DirectiveDemoClubDirectoryCtrl', function ($scope, clubProvider) {
    $scope.clubs = clubProvider.getAllClubs();
  });
