'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoTagSelectCtrl', ['$scope', 'tagProvider', ($scope, tagProvider) ->
    $scope.tsdemo =
      tags: tagProvider.getElectionTags()
      isActive: (item) -> !!item.selected
      radio: false
  ]
