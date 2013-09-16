'use strict'

angular.module('ClubConnectApp')
  .provider 'officerRequestApi', () ->
    uri = null

    @setUri = (val) ->
      uri = val

    @$get = ['$resource', ($resource) ->
      $resource uri, {},
        get:
          method: 'JSONP',
          params:
            officer_request_id: '@officer_request_id'
            callback: 'JSON_CALLBACK'
    ]

    undefined
