'use strict'

angular.module('ClubConnectApp')
  .service 'clubService', ['$http', '$q', ($http, $q) ->

    @getAllClubs = () ->
      $http
        .get '/json/clubs.json'

    undefined
  ]
