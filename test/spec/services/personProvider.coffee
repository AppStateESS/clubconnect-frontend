'use strict'

describe 'Service: personProvider', () ->

  # load the service's module
  beforeEach module 'ClubConnectApp'

  # instantiate service
  personProvider = {}
  beforeEach inject (_personProvider_) ->
    personProvider = _personProvider_

  it 'should do something', () ->
    expect(!!personProvider).toBe true;
