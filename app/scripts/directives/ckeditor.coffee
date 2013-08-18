'use strict';

angular.module('ClubConnectApp')
  .directive 'ckeditor', () ->
    require: '?ngModel'
    link: (scope, element, attrs, ngModel) ->
      ck = window.CKEDITOR.replace element[0],
        contentsCss: '/styles/main.css'
      unless ngModel then return
      ck.on 'pasteState', () ->
        scope.$apply () ->
          ngModel.$setViewValue ck.getData()
      ngModel.$render = (value) -> ck.setData ngModel.$viewValue
