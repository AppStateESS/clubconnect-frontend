'use strict'

angular.module('ClubConnectApp', ['ui.bootstrap', 'ngResource', 'ngRoute', 'ui.scrollfix'])
  .config ['$routeProvider', '$httpProvider', ($routeProvider, $httpProvider) ->

    $httpProvider.defaults.useXDomain = true
    $httpProvider.defaults.withCredentials = true

    $routeProvider
      # Default
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'

      # Perspectives
      .when '/clubs',
        templateUrl: 'views/ClubDirectory.html'
        controller: 'ClubDirectoryCtrl'
      .when '/registration',
        templateUrl: 'views/RegistrationList.html'
        controller: 'RegistrationListCtrl'
      .when '/registration/:regid',
        templateUrl: 'views/ClubRegistration.html'
        controller: 'ClubRegistrationCtrl'
      .when '/people',
        templateUrl: 'views/People.html'
        controller: 'PeopleCtrl'
      .when '/reg/:regid',
        templateUrl: 'views/ProcessRegistration.html'
        controller: 'ProcessRegistrationCtrl'
      .when '/registrations',
        templateUrl: 'views/RegistrationList.html'
        controller: 'RegistrationListCtrl'
      .when '/user',
        templateUrl: 'views/UserOverview.html'
        controller: 'UserOverviewCtrl'

      # Directives
      .when '/dirdemo/tagselect',
        templateUrl: 'views/directive-tagselect.html'
        controller: 'DirectiveDemoTagSelectCtrl'
      .when '/dirdemo/clubdirectory',
        templateUrl: 'views/directive-clubdirectory.html'
        controller: 'DirectiveDemoClubDirectoryCtrl'

      # Otherwise...
      .otherwise
        redirectTo: '/'
  ]
