'use strict';

describe('Controller: DirectivedemoclubdirectoryCtrl', function () {

  // load the controller's module
  beforeEach(module('clubconnectApp'));

  var DirectivedemoclubdirectoryCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DirectivedemoclubdirectoryCtrl = $controller('DirectivedemoclubdirectoryCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
