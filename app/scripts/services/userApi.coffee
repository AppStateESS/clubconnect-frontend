'use strict'

angular.module('ClubConnectApp')
  .provider 'userApi', () ->
    uri = null

    @setUri = (val) ->
      uri = val

    @$get = ['$resource', ($resource) ->
      $resource uri, {},
        get:
          method: 'JSONP'
          params:
            callback: 'JSON_CALLBACK'
    ]

    undefined
