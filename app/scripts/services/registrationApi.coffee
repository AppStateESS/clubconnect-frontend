'use strict'

angular.module('ClubConnectApp')
  .provider 'registrationApi', () ->
    uri = null

    @setUri = (val) ->
      uri = val

    @$get = ['$resource', ($resource) ->
      $resource uri, {},
        get:
          method: 'JSONP'
          params:
            registration_id: '@registration_id'
            callback:        'JSON_CALLBACK'
        query:
          method: 'JSONP'
          isArray: true
          params:
            callback: 'JSON_CALLBACK'
    ]

    undefined
