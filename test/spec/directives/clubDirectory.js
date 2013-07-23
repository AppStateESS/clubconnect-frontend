'use strict';

describe('Directive: clubDirectory', function () {
  beforeEach(module('clubconnectApp'));

  var element;

  it('should make hidden element visible', inject(function ($rootScope, $compile) {
    element = angular.element('<club-directory></club-directory>');
    element = $compile(element)($rootScope);
    expect(element.text()).toBe('this is the clubDirectory directive');
  }));
});
