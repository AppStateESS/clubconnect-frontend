'use strict';

angular.module('ClubConnectApp')
  .directive('personSelector', () ->
    scope:
      search: '='
    template: '<form><input ng-model="terms" placeholder="Type here to search for someone"></form><ul><li ng-repeat="result in results |orderBy:[\'last\', \'first\', \'middle\']">{{result.last}}, {{result.first}} {{result.middle}} - {{result.username}} - {{result.id}}</li></ul>'
    controller: ['$scope', '$element', ($scope, $element) ->
      $scope.terms = ''
      $scope.results = []
      $element.bind 'keyup', (event) ->
        $scope.$apply () ->
          $scope.results = if $scope.terms.length < 3 then [] else $scope.search $scope.terms

      undefined
    ]
  )
