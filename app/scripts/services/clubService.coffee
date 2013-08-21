'use strict'

angular.module('ClubConnectApp')
  .service 'clubService', ['$http', '$filter', 'makeSearchUrl', 'makeRegUrl', 'makeRolesUrl', 'makeRegSubmitUrl', 'errorService', ($http, $filter, makeSearchUrl, makeRegUrl, makeRolesUrl, makeRegSubmitUrl, errorService) ->

    getAllClubs = () ->
      $http
        .jsonp(makeSearchUrl())
        .then (response) ->
          response.data
        , errorService.handle

    getRegistration = (search) ->
      $http
        .jsonp(makeRegUrl(search))
        .then (response) ->
          response.data
        , errorService.handle

    getRoles = () ->
      $http
        .jsonp(makeRolesUrl())
        .then (response) ->
          response.data
        , errorService.handle

    submitReg = (data) ->
      $http(
        method: 'POST'
        url: makeRegSubmitUrl()
        data: data
        headers:
          "Content-type": "application/json"
      ).then (response) ->
        response.data
      , errorService.handle

    @getRegistration = getRegistration
    @getRoles        = getRoles
    @submitReg       = submitReg
    @getAllClubs     = getAllClubs

    undefined
  ]
