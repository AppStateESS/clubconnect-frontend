'use strict'

angular.module('ClubConnectApp')
  .service 'personService', ['$http', 'makePersonSearchUrl', 'errorService', ($http, makePersonSearchUrl, errorService) ->

    @search = search = (term) ->
      $http
        .jsonp(makePersonSearchUrl(term))
        .then (response) ->
          response.data
        , errorService.handle
  ]
