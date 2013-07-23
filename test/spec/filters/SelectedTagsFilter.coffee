'use strict'

describe 'Filter: SelectedTagsFilter', () ->

  # load the filter's module
  beforeEach module 'ClubConnectApp'

  # initialize a new instance of the filter before each test
  SelectedTagsFilter = {}
  beforeEach inject ($filter) ->
    SelectedTagsFilter = $filter 'SelectedTagsFilter'

  it 'should return the input prefixed with "SelectedTagsFilter filter:"', () ->
    text = 'angularjs'
    expect(SelectedTagsFilter text).toBe ('SelectedTagsFilter filter: ' + text);
