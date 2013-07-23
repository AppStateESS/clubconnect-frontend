'use strict'

describe 'Controller: DirectiveDemoClubDirectoryCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  DirectiveDemoClubDirectoryCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DirectiveDemoClubDirectoryCtrl = $controller 'DirectiveDemoClubDirectoryCtrl', {
      $scope: scope
    }

  it 'should pass this test', () ->
    expect(true).toBe(true)
