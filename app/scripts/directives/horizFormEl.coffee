'use strict';

angular.module('ClubConnectApp')
  .directive 'horizFormEl', [->
    scope:
      labelCols: '@'
      controlCols: '@'
      label: '@'
      help: '@'
      elementId: '@'
    restrict: 'EA'
    templateUrl: 'views/directive-horiz-form-el.html'
    transclude: true
  ]
