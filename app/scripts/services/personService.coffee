'use strict'

angular.module('ClubConnectApp')
  .service 'personService', ['$http', 'sdrConfig', 'errorService', ($http, sdrConfig, errorService) ->

    @search = search = (term) ->
      $http
        .jsonp(sdrConfig.makePersonSearchUrl(term))
        .then (response) ->
          response.data
        , errorService.handle
  ]
