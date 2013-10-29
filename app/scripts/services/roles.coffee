'use strict'

angular.module('ClubConnectApp')
  .provider 'roles', () ->
    roles = null

    @setRoles = (val) ->
      roles = val

    @$get = () ->
      roles[..]
