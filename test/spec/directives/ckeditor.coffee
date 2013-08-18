'use strict'

describe 'Directive: ckeditor', () ->
  beforeEach module 'ClubConnectApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<ckeditor></ckeditor>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the ckeditor directive'
