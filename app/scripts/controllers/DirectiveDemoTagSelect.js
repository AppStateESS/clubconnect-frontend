'use strict';

angular.module('clubconnectApp')
  .controller('DirectiveDemoTagSelectCtrl', function ($scope) {
    $scope.tags = [
      {
        title: 'Special Interest',
        selected: false
      },
      {
        title: 'Multicultural',
        selected: false
      },
      {
        title: 'Religious',
        selected: false
      },
      {
        title: 'Political',
        selected: false
      },
      {
        title: 'Athletic',
        selected: false
      },
    ];
    $scope.isActive = function(item) {
        return !!item.selected;
    };
  });
