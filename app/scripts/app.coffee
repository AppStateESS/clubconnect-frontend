'use strict'

angular.module('ClubConnectApp', [])
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
