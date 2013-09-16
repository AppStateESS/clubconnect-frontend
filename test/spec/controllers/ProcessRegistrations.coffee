'use strict'

describe 'Controller: ProcessregistrationsCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  ProcessregistrationsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ProcessregistrationsCtrl = $controller 'ProcessregistrationsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
