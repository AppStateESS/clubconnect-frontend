'use strict';

angular.module('clubconnectApp', [])
  .config(function ($routeProvider) {
    $routeProvider

      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/clubs', {
        templateUrl: 'views/clubs.html',
        controller: 'ClubDirectoryCtrl'
      })
      .when
      .otherwise({
        redirectTo: '/'
      });
  });
