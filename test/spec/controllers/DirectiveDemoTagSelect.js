'use strict';

describe('Controller: DirectivedemotagselectCtrl', function () {

  // load the controller's module
  beforeEach(module('clubconnectApp'));

  var DirectivedemotagselectCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DirectivedemotagselectCtrl = $controller('DirectivedemotagselectCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
