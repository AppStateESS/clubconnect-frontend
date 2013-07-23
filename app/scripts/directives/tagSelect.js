'use strict';

angular.module('clubconnectApp')
  .directive('tagSelect', function () {
    return {
      scope: {
        tags: '=tags',
        ulClass: '@ulClass',
        liClass: '@liClass',
        liSelectedClass: '@liSelectedClass',
        liUnselectedClass: '@liUnselectedClass'
      },
      template: '<ul class="{{ulClass}}"><li ng-repeat="tag in tags" class="{{liClass}}" ng-class="tag.selected && liSelectedClass || liUnselectedClass"><a href="javascript:void(0)" ng-click="alert(tag.selected); tag.selected = !tag.selected">{{tag.title}}</a></li></ul>'/*,
      link: function postLink(scope, element, attrs) {
        element.text('this is the tagSelect directive');
      }*/
    };
  });
