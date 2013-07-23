'use strict'

describe 'Directive: tagSelect', () ->
  beforeEach module 'ClubConnectApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<tag-select></tag-select>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the tagSelect directive'
