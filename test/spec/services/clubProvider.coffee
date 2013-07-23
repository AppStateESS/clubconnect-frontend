'use strict'

describe 'Service: clubProvider', () ->

  # load the service's module
  beforeEach module 'ClubConnectApp'

  # instantiate service
  clubProvider = {}
  beforeEach inject (_clubProvider_) ->
    clubProvider = _clubProvider_

  it 'should return an array', () ->
    expect(!!clubProvider).toBeArray()
