'use strict';

describe('Service: clubProvider', function () {

  // load the service's module
  beforeEach(module('clubconnectApp'));

  // instantiate service
  var clubProvider;
  beforeEach(inject(function (_clubProvider_) {
    clubProvider = _clubProvider_;
  }));

  it('should do something', function () {
    expect(!!clubProvider).toBe(true);
  });

});
