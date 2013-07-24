'use strict';

angular.module('ClubConnectApp')
  .directive('tagSelect', () ->
    scope:
      tags: '='
      radio: '='
      ulClass: '@'
      liClass: '@'
      liSelectedClass: '@'
      liUnselectedClass: '@'
    template: '<ul class="{{ulClass}}"><li ng-repeat="tag in tags" class="{{liClass}}" ng-class="tag.selected && liSelectedClass || liUnselectedClass"><a href="javascript:void(0)" ng-click="tag.selected = !tag.selected">{{tag.name}}</a></li></ul>'
  )
