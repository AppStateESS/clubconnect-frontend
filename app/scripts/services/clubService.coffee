'use strict'

angular.module('ClubConnectApp')
  .service 'clubService', ['$http', '$filter', '$resource', 'sdrConfig', 'errorService', ($http, $filter, $resource, sdrConfig, errorService) ->

    getAllClubs = () ->
      $http
        .jsonp(sdrConfig.makeSearchUrl())
        .then (response) ->
          response.data
        , errorService.handle

    getRoles = () ->
      $http
        .jsonp(sdrConfig.makeRolesUrl())
        .then (response) ->
          response.data
        , errorService.handle

    submitReg = (data) ->
      $http(
        method: 'POST'
        url: sdrConfig.makeRegSubmitUrl()
        data: data
        headers:
          "Content-type": "application/json"
      ).then (response) ->
        response.data
      , errorService.handle

    fromPgDate = (val) ->
      if not val
        val
      else
        val.split(' ')[0]

    fixReg = (reg) ->
      reg.created       = fromPgDate reg.created
      reg.approved      = fromPgDate reg.approved
      if not reg.president
        reg.presCertified = 'data error please contact ESS'
      else

    @user = $resource sdrConfig.userUrl, {},
      get:
        method: 'JSONP'
        params:
          callback: 'JSON_CALLBACK'
    
    @getRoles            = getRoles
    @submitReg           = submitReg
    @getAllClubs         = getAllClubs

    undefined
  ]
