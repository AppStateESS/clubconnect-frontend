'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoTagSelectCtrl', ['$scope', 'tagProvider', ($scope, tagProvider) ->
    $scope.tags = tagProvider.getElectionTags()
    $scope.isActive = (item) -> !!item.selected
    $scope.radio = false
  ]
