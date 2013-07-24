'use strict'

describe 'Directive: personSelector', () ->
  beforeEach module 'ClubConnectApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<person-selector></person-selector>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the personSelector directive'
