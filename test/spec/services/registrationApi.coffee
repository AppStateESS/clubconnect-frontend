'use strict'

describe 'Provider: registrationApi', () ->

  # load the service's module
  beforeEach module 'ClubConnectApp'

  # instantiate service
  registrationApiProvider = {}
  beforeEach inject (_registrationApiProvider_) ->
    registrationApiProvider = _registrationApiProvider_

  it 'should return a $resource object', () ->
