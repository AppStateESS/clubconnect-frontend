'use strict'

describe 'Controller: ClubregistrationCtrl', () ->

  # load the controller's module
  beforeEach module 'ClubConnectApp'

  ClubregistrationCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClubregistrationCtrl = $controller 'ClubregistrationCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
