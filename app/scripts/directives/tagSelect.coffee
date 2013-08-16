'use strict';

angular.module('ClubConnectApp')
  .directive('tagSelect', () ->
    scope:
      tags: '='
      radio: '='
      cols: '@'
    template: '<div class="row"><div ng-repeat="tagSlice in getTagSlices()" class="col-lg-{{12 / cols}}"><ul class="nav nav-pills nav-stacked"><li ng-repeat="tag in tagSlice" ng-class="tag.selected && \'active\' || \'\'"><a href="javascript:void(0)" ng-click="tagClicked(tag)">{{tag.name}}</a></li></ul>'
    controller: ['$scope', '$element', ($scope, $element) ->
      $scope.cols = 1 if not $scope.cols
      $scope.getTagSlices = () ->
        ct = Math.ceil($scope.tags.length / $scope.cols)
        idx = 0
        ret = []
        while idx < $scope.tags.length
          ret.push $scope.tags.slice(idx, idx + ct)
          idx += ct
        ret

      $scope.tagClicked = (tag) ->
        if $scope.radio
          for scopeTag in $scope.tags
            scopeTag.selected = scopeTag.name == tag.name
        else
          tag.selected = !tag.selected
    ]
  )
