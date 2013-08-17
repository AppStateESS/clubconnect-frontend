'use strict'

describe 'Directive: horizFormEl', () ->
  beforeEach module 'ClubConnectApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<horiz-form-el></horiz-form-el>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the horizInput directive'
