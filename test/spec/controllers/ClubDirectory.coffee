'use strict'

describe 'Controller: ClubdirectoryCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  ClubdirectoryCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClubdirectoryCtrl = $controller 'ClubdirectoryCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
