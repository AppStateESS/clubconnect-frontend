'use strict'

describe 'Service: tagProvider', () ->

  # load the service's module
  beforeEach module 'ClubConnectApp'

  # instantiate service
  tagProvider = {}
  beforeEach inject (_tagProvider_) ->
    tagProvider = _tagProvider_

  it 'should do something', () ->
    expect(!!tagProvider).toBe true;
