'use strict';

angular.module('ClubConnectApp')
  .directive 'tagSelect', () ->
    require: 'ngModel'
    scope:
      tags: '='
      cols: '@'
      radio: '='
      model: '=ngModel'
    template: '<div class="row"><div ng-repeat="group in chunkedTags" class="col-lg-{{12 / cols}}"><ul class="nav nav-pills nav-stacked tagselect"><li ng-repeat="tag in group" ng-class="isSelected(tag) && \'active\' || \'\'"><a href="javascript:void(0)" ng-click="tagClicked(tag)">{{tag.name}}</a></li></ul></div></div>'
    link: (scope, elm, attrs, ctrl) ->

      scope.getVal = (tag) ->
        if not _.isUndefined(tag.val)
          tag.val
        else
          tag.name

      scope.tagClicked = (tag) ->

        clicked = scope.getVal(tag)
        foundVal = ctrl.$viewValue

        if scope.radio
          if clicked == foundVal
            foundVal = undefined
          else
            foundVal = clicked

        else
          foundVal = ctrl.$viewValue
          removed = false
          for key, val of foundVal
            if val == clicked
              foundVal.splice key, 1
              removed = true
          if not removed
            if not foundVal
              foundVal = []
            foundVal.push clicked

        ctrl.$setViewValue foundVal
        scope.lastSelected = clicked
        undefined

      """
        Watch scope.tags for changes.  The tagset needs to be split into columns
        if scope.cols is set.
      """
      ctrl.$render = () ->
        input = scope.tags

        if not input
          return undefined

        idx = 0
        len = input.length

        # If the client specified cols, use that, otherwise 1 column
        if not scope.cols or scope.cols < 1 then numchunks = 1 else numchunks = scope.cols

        # How many items per cell - total scope.tags length divided by number of columns
        ct = Math.ceil(len/numchunks)

        # Create chunks, put array of arrays of tags on scope
        chunked = []
        while idx < len
          lastidx = idx
          idx += ct
          chunked.push input[lastidx..idx-1]
        
        scope.chunkedTags = chunked

        undefined

      scope.$watch 'radio', (radio) ->
        foundVal = ctrl.$viewValue
        if radio and scope.lastSelected
          if _.contains foundVal, scope.lastSelected
            foundVal = scope.lastSelected
          else
            foundVal = undefined
        else
          if foundVal
            foundVal = [foundVal]
        ctrl.$setViewValue foundVal
        undefined

      scope.isSelected = (tag) ->
        if scope.radio
          ctrl.$viewValue == scope.getVal(tag)
        else
          _.contains ctrl.$viewValue, scope.getVal(tag)

      """
        These listeners are necessary to keep our isolate scope in sync with
        the parent scope
      """
      scope.$watch 'model', () ->
        scope.$eval(attrs.ngModel + ' = model')
      scope.$watch attrs.ngModel, (val) ->
        scope.model = val
