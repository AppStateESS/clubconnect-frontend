'use strict'

angular.module('ClubConnectApp', ['ui'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      # Default
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'

      # Perspectives
      .when '/clubs',
        templateUrl: 'views/clubdirectory.html'
        controller: 'ClubDirectoryCtrl'
      .when '/registration',
        templateUrl: 'views/clubregistration.html'
        controller: 'ClubRegistrationCtrl'

      # Directives
      .when '/dirdemo/tagselect',
        templateUrl: 'views/directive-tagselect.html'
        controller: 'DirectiveDemoTagSelectCtrl'
      .when '/dirdemo/clubdirectory',
        templateUrl: 'views/directive-clubdirectory.html'
        controller: 'DirectiveDemoClubDirectoryCtrl'
      .when '/dirdemo/personselector',
        templateUrl: 'views/directive-personselector.html'
        controller: 'DirectiveDemoPersonSelectorCtrl'

      # Otherwise...
      .otherwise
        redirectTo: '/'
  ]
