'use strict'

angular.module('ClubConnectApp')
  .service 'errorService', ['$http', () ->
    @handle = handle = (error) ->
      if error.message
        alert error.message
      else
        alert 'There was a problem communicating with the server.  Please try again later. ' + error.status
  ]
