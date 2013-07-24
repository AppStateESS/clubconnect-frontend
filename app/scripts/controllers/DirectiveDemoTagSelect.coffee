'use strict'

angular.module('ClubConnectApp')
  .controller 'DirectiveDemoTagSelectCtrl', ['$scope', 'tagProvider', ($scope, tagProvider) ->
    $scope.tags = tagProvider.getSearchTags()
    $scope.isActive = (item) -> !!item.selected
  ]
