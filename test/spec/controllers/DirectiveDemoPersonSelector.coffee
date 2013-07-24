'use strict'

describe 'Controller: DirectivedemopersonselectorCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  DirectivedemopersonselectorCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DirectivedemopersonselectorCtrl = $controller 'DirectivedemopersonselectorCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
