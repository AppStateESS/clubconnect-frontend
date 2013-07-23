'use strict'

describe 'Controller: DirectiveDemoTagSelectCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  DirectiveDemoTagSelectCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DirectiveDemoTagSelectCtrl = $controller 'DirectiveDemoTagSelectCtrl', {
      $scope: scope
    }

  it 'should pass this test', () ->
    expect(true).toBe true;
