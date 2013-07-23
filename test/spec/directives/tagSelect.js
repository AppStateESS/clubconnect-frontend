'use strict';

describe('Directive: tagSelect', function () {
  beforeEach(module('clubconnectApp'));

  var element;

  it('should make hidden element visible', inject(function ($rootScope, $compile) {
    element = angular.element('<tag-select></tag-select>');
    element = $compile(element)($rootScope);
    expect(element.text()).toBe('this is the tagSelect directive');
  }));
});
