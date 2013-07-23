'use strict'

describe 'Directive: clubDirectory', () ->
  scope = 0
  element = 0

  beforeEach () ->
    module 'ClubConnectApp'

    html = '<div club-directory></div>';

    inject ($compile, $rootScope) ->
      scope = $rootScope.$new()
      element = angular.element(html)
      $compile(element)(scope)
      scope.$digest()

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    expect(element.text()).toBe 'this is the clubDirectory directive'
